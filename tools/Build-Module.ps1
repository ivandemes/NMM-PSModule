[CmdletBinding()]
param(
    [Parameter()]
    [string] $SpecificationPath = (Join-Path $PSScriptRoot '..\swagger.json'),

    [Parameter()]
    [string] $ModuleRoot = (Join-Path $PSScriptRoot '..\NMM-PoShModule')
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function ConvertTo-PascalCase {
    param([Parameter(Mandatory)][string] $Value)

    $words = [regex]::Matches($Value, '[A-Z]+(?=[A-Z][a-z]|\d|$)|[A-Z]?[a-z]+|\d+') | ForEach-Object Value
    if (-not $words) { return 'Value' }
    return ($words | ForEach-Object {
        if ($_.Length -eq 1) { $_.ToUpperInvariant() }
        else { $_.Substring(0, 1).ToUpperInvariant() + $_.Substring(1) }
    }) -join ''
}

function Get-ParameterType {
    param([Parameter(Mandatory)] $Schema)

    $schemaType = Get-PropertyValue $Schema 'type'
    $schemaFormat = Get-PropertyValue $Schema 'format'
    if ($schemaType -eq 'array') { return '[object[]]' }
    switch ($schemaType) {
        'boolean' { '[bool]'; break }
        'integer' {
            if ($schemaFormat -eq 'int64') { '[long]' } else { '[int]' }
            break
        }
        'number' { '[double]'; break }
        'object' { '[hashtable]'; break }
        default {
            if ($schemaFormat -eq 'date-time') { '[datetime]' }
            else { '[string]' }
        }
    }
}

function ConvertTo-HelpText {
    param([AllowNull()][string] $Value)

    if ([string]::IsNullOrWhiteSpace($Value)) { return 'No additional description is provided by the API specification.' }
    $legacyCasing = 'Nm' + 'm'
    return ((($Value.Replace($legacyCasing, 'NMM')) -replace '#>', '# >') -replace '\r?\n', "`n")
}

function Get-PropertyValue {
    param([AllowNull()] $InputObject, [Parameter(Mandatory)][string] $Name)

    if ($null -eq $InputObject) { return $null }
    $property = $InputObject.PSObject.Properties[$Name]
    if ($null -ne $property) { return $property.Value }
    return $null
}

function Get-CommandName {
    param([string] $Method, [string] $Path)

    $verb = @{ get = 'Get'; post = 'New'; delete = 'Remove'; put = 'Set'; patch = 'Update' }[$Method]
    $segments = $Path.Trim('/') -split '/' | Where-Object { $_ -notin @('rest-api', 'v1') }
    $nounParts = foreach ($segment in $segments) {
        if ($segment -match '^\{(.+)\}$') { 'By' + (ConvertTo-PascalCase $Matches[1]) }
        else { ConvertTo-PascalCase $segment }
    }
    return "$verb-NMM$($nounParts -join '')"
}

$specification = Get-Content -LiteralPath $SpecificationPath -Raw | ConvertFrom-Json -Depth 100
if ($specification.openapi -notlike '3.*') { throw "Only OpenAPI 3.x specifications are supported. Found '$($specification.openapi)'." }
$commonParameterNames = @(
    'Verbose', 'Debug', 'ErrorAction', 'WarningAction', 'InformationAction', 'ProgressAction',
    'ErrorVariable', 'WarningVariable', 'InformationVariable', 'OutVariable', 'OutBuffer',
    'PipelineVariable', 'WhatIf', 'Confirm'
)

$publicPath = Join-Path $ModuleRoot 'Public'
$docsPath = Join-Path (Split-Path $ModuleRoot -Parent) 'docs\Commands'
New-Item -ItemType Directory -Force -Path $publicPath, $docsPath | Out-Null
Get-ChildItem -LiteralPath $publicPath -Filter '*-NMM*.ps1' -File -ErrorAction SilentlyContinue |
    Where-Object BaseName -NotIn @('Connect-NMMApi', 'Disconnect-NMMApi') |
    Remove-Item -Force
Get-ChildItem -LiteralPath $docsPath -Filter '*-NMM*.md' -File -ErrorAction SilentlyContinue | Remove-Item -Force

$operations = [System.Collections.Generic.List[object]]::new()
$usedNames = @{}
foreach ($pathProperty in $specification.paths.PSObject.Properties) {
    foreach ($methodProperty in $pathProperty.Value.PSObject.Properties | Where-Object Name -In @('get', 'post', 'delete', 'put', 'patch')) {
        $operation = $methodProperty.Value
        $commandName = Get-CommandName -Method $methodProperty.Name -Path $pathProperty.Name
        if ($usedNames.ContainsKey($commandName)) {
            $sha = [System.Security.Cryptography.SHA256]::Create()
            $suffix = [Convert]::ToHexString($sha.ComputeHash([Text.Encoding]::UTF8.GetBytes("$($methodProperty.Name):$($pathProperty.Name)"))).Substring(0, 8)
            $commandName += $suffix
        }
        $usedNames[$commandName] = $true

        $parameters = @(Get-PropertyValue $operation 'parameters') | Where-Object { $null -ne $_ }
        $parameterNames = @{}
        $parameterBlocks = foreach ($apiParameter in $parameters) {
            $name = ConvertTo-PascalCase $apiParameter.name
            if ($name -in $commonParameterNames -or $name -in @('Connection', 'InputObject')) { $name = "Api$name" }
            if ($parameterNames.ContainsKey($name)) { throw "Duplicate PowerShell parameter '$name' for $($pathProperty.Name)." }
            $parameterNames[$name] = $true
            $attributes = [System.Collections.Generic.List[string]]::new()
            $mandatory = [bool](Get-PropertyValue $apiParameter 'required')
            $attributes.Add("        [Parameter(Mandatory = `$$($mandatory.ToString().ToLowerInvariant()))]")
            $enumValues = Get-PropertyValue $apiParameter.schema 'enum'
            if ($enumValues) {
                $values = ($enumValues | ForEach-Object { "'$(($_.ToString()) -replace "'", "''")'" }) -join ', '
                $attributes.Add("        [ValidateSet($values)]")
            }
            $minimum = Get-PropertyValue $apiParameter.schema 'minimum'
            $maximum = Get-PropertyValue $apiParameter.schema 'maximum'
            if ($null -ne $minimum -or $null -ne $maximum) {
                $min = if ($null -ne $minimum) { $minimum } else { [long]::MinValue }
                $max = if ($null -ne $maximum) { $maximum } else { [long]::MaxValue }
                $attributes.Add("        [ValidateRange($min, $max)]")
            }
            $type = Get-ParameterType $apiParameter.schema
            ($attributes -join "`n") + "`n        $type `$$name"
        }
        $parameterBlocks = @($parameterBlocks)

        $requestBody = Get-PropertyValue $operation 'requestBody'
        $hasBody = $null -ne $requestBody
        if ($hasBody) {
            $bodyMandatory = [bool](Get-PropertyValue $requestBody 'required')
            $parameterBlocks += "        [Parameter(Mandatory = `$$($bodyMandatory.ToString().ToLowerInvariant()), ValueFromPipeline = `$true)]`n        [AllowNull()]`n        [object] `$InputObject"
        }
        $parameterBlocks += "        [Parameter()]`n        [psobject] `$Connection"

        $helpParams = foreach ($apiParameter in $parameters) {
            $name = ConvertTo-PascalCase $apiParameter.name
            if ($name -in $commonParameterNames -or $name -in @('Connection', 'InputObject')) { $name = "Api$name" }
            ".PARAMETER $name`n$((ConvertTo-HelpText (Get-PropertyValue $apiParameter 'description')))"
        }
        $helpParams = @($helpParams)
        if ($hasBody) { $helpParams += ".PARAMETER InputObject`nThe JSON request body. Objects and hashtables are serialized automatically." }
        $helpParams += '.PARAMETER Connection' + "`nA connection returned by Connect-NMMApi. When omitted, the module's current connection is used."

        $pathAssignments = foreach ($apiParameter in $parameters | Where-Object in -eq 'path') {
            $name = ConvertTo-PascalCase $apiParameter.name
            if ($name -in $commonParameterNames -or $name -in @('Connection', 'InputObject')) { $name = "Api$name" }
            "        `$pathValues['$($apiParameter.name -replace "'", "''")'] = `$$name"
        }
        $queryAssignments = foreach ($apiParameter in $parameters | Where-Object in -eq 'query') {
            $name = ConvertTo-PascalCase $apiParameter.name
            if ($name -in $commonParameterNames -or $name -in @('Connection', 'InputObject')) { $name = "Api$name" }
            "        if (`$PSBoundParameters.ContainsKey('$name')) { `$queryValues['$($apiParameter.name -replace "'", "''")'] = `$$name }"
        }
        $bodyArgument = if ($hasBody) { " -Body `$InputObject -BodyWasBound:`$PSBoundParameters.ContainsKey('InputObject')" } else { '' }
        $supportsShouldProcess = $methodProperty.Name -ne 'get'
        $confirmImpact = if ($methodProperty.Name -eq 'delete') { ", ConfirmImpact = 'High'" } else { '' }
        $invoke = "        Invoke-NMMApiRequest -Method '$($methodProperty.Name.ToUpperInvariant())' -Path '$($pathProperty.Name -replace "'", "''")' -PathValues `$pathValues -QueryValues `$queryValues$bodyArgument -Connection `$Connection"
        if ($supportsShouldProcess) {
            $invoke = "        if (`$PSCmdlet.ShouldProcess('$($pathProperty.Name -replace "'", "''")', '$($methodProperty.Name.ToUpperInvariant())')) {`n    $invoke`n        }"
        }

        $functionText = @"
function $commandName {
    <#
.SYNOPSIS
$(ConvertTo-HelpText (Get-PropertyValue $operation 'summary'))
.DESCRIPTION
$(ConvertTo-HelpText (Get-PropertyValue $operation 'description'))
$($helpParams -join "`n")
.EXAMPLE
$commandName -Connection `$connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
$($pathProperty.Name)
#>
    [CmdletBinding(SupportsShouldProcess = `$$($supportsShouldProcess.ToString().ToLowerInvariant())$confirmImpact)]
    param(
$($parameterBlocks -join ",`n`n")
    )

    process {
        `$pathValues = @{}
$($pathAssignments -join "`n")
        `$queryValues = @{}
$($queryAssignments -join "`n")
$invoke
    }
}
"@
        Set-Content -LiteralPath (Join-Path $publicPath "$commandName.ps1") -Value $functionText -Encoding utf8NoBOM

        $syntaxParts = foreach ($apiParameter in $parameters) {
            $name = ConvertTo-PascalCase $apiParameter.name
            if ($name -in $commonParameterNames -or $name -in @('Connection', 'InputObject')) { $name = "Api$name" }
            $schemaType = Get-PropertyValue $apiParameter.schema 'type'
            if (Get-PropertyValue $apiParameter 'required') { "-$name <$schemaType>" } else { "[-$name <$schemaType>]" }
        }
        $syntaxParts = @($syntaxParts)
        if ($hasBody) { $syntaxParts += if (Get-PropertyValue $requestBody 'required') { '-InputObject <object>' } else { '[-InputObject <object>]' } }
        $syntaxParts += '[-Connection <psobject>]'
        $doc = @"
# $commandName

## Synopsis

$(ConvertTo-HelpText (Get-PropertyValue $operation 'summary'))

## Syntax

~~~powershell
$commandName $($syntaxParts -join ' ')
~~~

## Description

$(ConvertTo-HelpText (Get-PropertyValue $operation 'description'))

## API operation

$($methodProperty.Name.ToUpperInvariant()) $($pathProperty.Name)
"@
        Set-Content -LiteralPath (Join-Path $docsPath "$commandName.md") -Value $doc -Encoding utf8NoBOM
        $operations.Add([pscustomobject]@{ Command = $commandName; Method = $methodProperty.Name.ToUpperInvariant(); Path = $pathProperty.Name })
    }
}

$operations | Sort-Object Command | ConvertTo-Json | Set-Content -LiteralPath (Join-Path $ModuleRoot 'operations.json') -Encoding utf8NoBOM
Write-Verbose "Generated $($operations.Count) commands in '$publicPath'."
