[CmdletBinding()]
param()

$repositoryRoot = Split-Path $PSScriptRoot -Parent
$manifestPath = Join-Path $repositoryRoot 'NMM-PoShModule/NMM-PoShModule.psd1'
$operationsPath = Join-Path $repositoryRoot 'NMM-PoShModule/operations.json'
$readmePath = Join-Path $repositoryRoot 'README.md'

Import-Module $manifestPath -Force
$operations = Get-Content $operationsPath -Raw | ConvertFrom-Json
$operationByCommand = @{}
foreach ($operation in $operations) { $operationByCommand[$operation.Command] = $operation }

function Get-ExampleValue {
    param(
        [System.Management.Automation.ParameterMetadata] $Parameter
    )

    switch -Regex ($Parameter.Name) {
        '^AccountId$' { return '$accountId' }
        '^AccessToken$' { return '$token' }
        '^ClientId$' { return '$clientId' }
        '^ClientSecret$' { return '$secret' }
        '^TenantId$' { return '$tenantId' }
        '^BaseUri$' { return "'https://example.getnerdio.com'" }
        '^Connection$' { return '$connection' }
        '^InputObject$' { return '$body' }
        '^Filter$' { return "{ `$_.name -like 'Contoso*' }" }
        'Date$' { return "'2026-01-01'" }
        'SubscriptionId$' { return '$subscriptionId' }
        'ResourceGroup$' { return "'rg-avd-production'" }
        'PoolName$' { return "'avd-production'" }
        'HostName$' { return "'avd-host-01'" }
        'UserId$' { return '$userId' }
        'GroupId$' { return '$groupId' }
        'Id$' { return "'<$($Parameter.Name)>'" }
        'Name$' { return "'<$($Parameter.Name)>'" }
    }

    if ($Parameter.ParameterType -eq [switch]) { return $null }
    if ($Parameter.ParameterType -eq [bool]) { return '$true' }
    if ($Parameter.ParameterType -in @([int], [long], [double], [decimal])) { return '1' }
    return "'<$($Parameter.Name)>'"
}

function Get-CommandExample {
    param(
        [System.Management.Automation.CommandInfo] $Command
    )

    if ($Command.Name -eq 'Connect-NMMApi') {
        return "Connect-NMMApi -BaseUri 'https://example.getnerdio.com' -AccessToken `$token"
    }
    if ($Command.Name -eq 'Disconnect-NMMApi') { return 'Disconnect-NMMApi' }

    $parameterSet = $Command.ParameterSets |
        Sort-Object @{ Expression = { @($_.Parameters | Where-Object IsMandatory).Count } }, Name |
        Select-Object -First 1
    $parts = [System.Collections.Generic.List[string]]::new()
    $parts.Add($Command.Name)
    foreach ($parameter in $parameterSet.Parameters | Where-Object {
        $_.IsMandatory -and $_.Name -notin [System.Management.Automation.PSCmdlet]::CommonParameters
    }) {
        $parts.Add("-$($parameter.Name)")
        $value = Get-ExampleValue -Parameter $Command.Parameters[$parameter.Name]
        if ($null -ne $value) { $parts.Add($value) }
    }
    if ($Command.Parameters.ContainsKey('Connection')) {
        $parts.Add('-Connection')
        $parts.Add('$connection')
    }
    if ($Command.Name -match '^(Remove|Set|Update)-' -and $Command.Parameters.ContainsKey('WhatIf')) {
        $parts.Add('-WhatIf')
    }
    return $parts -join ' '
}

function Get-ParameterSummary {
    param(
        [System.Management.Automation.CommandInfo] $Command,
        [bool] $Mandatory
    )

    $common = [System.Management.Automation.PSCmdlet]::CommonParameters
    $names = foreach ($parameter in $Command.Parameters.Values | Sort-Object Name) {
        if ($parameter.Name -in $common) { continue }
        $isMandatory = @($parameter.Attributes | Where-Object {
            $_ -is [System.Management.Automation.ParameterAttribute] -and $_.Mandatory
        }).Count -gt 0
        if ($isMandatory -eq $Mandatory) {
            $typeName = $parameter.ParameterType.Name
            if ($parameter.ParameterType -eq [switch]) { $typeName = 'switch' }
            "``-$($parameter.Name) <$typeName>``"
        }
    }
    if (@($names).Count -eq 0) { return 'None.' }
    return (@($names) -join ', ') + '.'
}

$commands = @(Get-Command -Module NMM-PoShModule -CommandType Function | Sort-Object Name)
$lines = [System.Collections.Generic.List[string]]::new()
$lines.Add('# NMM-PoShModule')
$lines.Add('')
$lines.Add('PowerShell 7 module for the Nerdio Manager for MSP (NMM) REST API. The API commands and this reference are generated from `swagger.json`, keeping the module traceable to the API contract.')
$lines.Add('')
$lines.Add('## Installation')
$lines.Add('')
$lines.Add('```powershell')
$lines.Add('Import-Module ./NMM-PoShModule/NMM-PoShModule.psd1')
$lines.Add('```')
$lines.Add('')
$lines.Add('## Authentication')
$lines.Add('')
$lines.Add('Connect with an existing bearer token:')
$lines.Add('')
$lines.Add('```powershell')
$lines.Add("`$connection = Connect-NMMApi -BaseUri 'https://example.getnerdio.com' -AccessToken `$token")
$lines.Add('```')
$lines.Add('')
$lines.Add('Or use Microsoft Entra client credentials:')
$lines.Add('')
$lines.Add('```powershell')
$lines.Add("`$secret = Read-Host 'Client secret' -AsSecureString")
$lines.Add("`$connection = Connect-NMMApi -BaseUri 'https://example.getnerdio.com' ``")
$lines.Add('    -TenantId $tenantId -ClientId $clientId -ClientSecret $secret -Scope $scope')
$lines.Add('```')
$lines.Add('')
$lines.Add('The most recent connection becomes the module default. Use `-NoDefault` to avoid changing that state, and pass a connection explicitly with `-Connection`. Do not put literal secrets in scripts, history, or logs.')
$lines.Add('')
$lines.Add('## How to read this reference')
$lines.Add('')
$lines.Add('- **Required parameters** must be supplied in at least one parameter set. Commands with alternative parameter sets can have different requirements; check the displayed syntax or `Get-Help <command> -Full`.')
$lines.Add('- **Optional parameters** may be omitted. `-Connection` uses the current module connection when omitted. `-Filter` is client-side and accepts a script block or a single string expression.')
$lines.Add('- `-InputObject` supplies a request body as a hashtable, object, or JSON string. Its fields depend on the API operation; the linked detailed page includes specification notes when available.')
$lines.Add('- `Remove-`, `Set-`, and `Update-` examples use `-WhatIf` where supported. Remove it only after reviewing the operation.')
$lines.Add('- Standard PowerShell common parameters such as `-Verbose` and `-ErrorAction` are available but omitted below for readability.')
$lines.Add('')
$lines.Add('Account objects can be piped to account-scoped commands because their `Id` property binds to `AccountId`:')
$lines.Add('')
$lines.Add('```powershell')
$lines.Add('Get-NMMAccounts -Filter "name -eq ''Contoso Demo''" |')
$lines.Add('    Get-NMMAccountsByAccountIdSecureVariables')
$lines.Add('```')
$lines.Add('')
$lines.Add('## Command index')
$lines.Add('')
foreach ($group in $commands | Group-Object Verb) {
    $lines.Add("### $($group.Name) commands")
    $lines.Add('')
    foreach ($command in $group.Group) {
        $anchor = $command.Name.ToLowerInvariant()
        $synopsis = (Get-Help $command.Name).Synopsis
        $lines.Add("- [$($command.Name)](#$anchor) — $synopsis")
    }
    $lines.Add('')
}
$lines.Add('## Command reference')
$lines.Add('')
foreach ($command in $commands) {
    $help = Get-Help $command.Name -Full
    $operation = $operationByCommand[$command.Name]
    $docPath = "docs/Commands/$($command.Name).md"
    $lines.Add("### $($command.Name)")
    $lines.Add('')
    $lines.Add([string]$help.Synopsis)
    $lines.Add('')
    if ($null -ne $operation) {
        $lines.Add("**API operation:** ``$($operation.Method) $($operation.Path)``")
        $lines.Add('')
    }
    $lines.Add('**Syntax:**')
    $lines.Add('')
    $lines.Add('```text')
    foreach ($syntaxLine in @(Get-Command $command.Name -Syntax)) { $lines.Add($syntaxLine) }
    $lines.Add('```')
    $lines.Add('')
    $lines.Add("**Required parameters:** $(Get-ParameterSummary -Command $command -Mandatory $true)")
    $lines.Add('')
    $lines.Add("**Optional parameters:** $(Get-ParameterSummary -Command $command -Mandatory $false)")
    $lines.Add('')
    $lines.Add('```powershell')
    $lines.Add((Get-CommandExample -Command $command))
    $lines.Add('```')
    $lines.Add('')
    if (Test-Path (Join-Path $repositoryRoot $docPath)) {
        $lines.Add("[Detailed help and API notes]($docPath)")
        $lines.Add('')
    }
}
$lines.Add('## Regeneration')
$lines.Add('')
$lines.Add('After updating `swagger.json`, regenerate the module and this README:')
$lines.Add('')
$lines.Add('```powershell')
$lines.Add('./tools/Build-Module.ps1 -Verbose')
$lines.Add('./tools/Build-Readme.ps1')
$lines.Add('```')

$lines | Set-Content -LiteralPath $readmePath -Encoding utf8NoBOM
Write-Output "Generated README for $($commands.Count) commands at '$readmePath'."
