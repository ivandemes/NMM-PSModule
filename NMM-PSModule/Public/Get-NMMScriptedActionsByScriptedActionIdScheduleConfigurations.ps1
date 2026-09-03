function Get-NMMScriptedActionsByScriptedActionIdScheduleConfigurations {
    <#
.SYNOPSIS
Get Azure runbook msp scripted action schedule configurations.
.DESCRIPTION
No additional description is provided by the API specification.
.PARAMETER ScriptedActionId
No additional description is provided by the API specification.
.PARAMETER Filter
A client-side filter applied to each item returned by the API. Accepts a script block such as { $_.name -like 'Prod*' } or a string such as "name -like 'Prod*'". API-native query parameters should be preferred when available.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Get-NMMScriptedActionsByScriptedActionIdScheduleConfigurations -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/scripted-actions/{scriptedActionId}/schedule-configurations
#>
    [CmdletBinding(SupportsShouldProcess = $false)]
    param(
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [Alias('Id')]
        [int] $ScriptedActionId,

        [Parameter()]
        [ValidateScript({ $_ -is [scriptblock] -or ($_ -is [string] -and -not [string]::IsNullOrWhiteSpace($_)) })]
        [object] $Filter,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['scriptedActionId'] = $ScriptedActionId
        $queryValues = @{}

        $response = Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/scripted-actions/{scriptedActionId}/schedule-configurations' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
        if ($PSBoundParameters.ContainsKey('Filter')) {
            $filterScript = ConvertTo-NMMFilterScript -Filter $Filter
            $response | Where-Object -FilterScript $filterScript
        }
        else {
            $response
        }
    }
}
