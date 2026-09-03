function Get-NMMAccountsByAccountIdScriptedActionsByScriptedActionIdScheduleConfigurations {
    <#
.SYNOPSIS
Get Azure runbook account scripted action schedule configurations.
.DESCRIPTION
No additional description is provided by the API specification.
.PARAMETER ScriptedActionId
No additional description is provided by the API specification.
.PARAMETER AccountId
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Get-NMMAccountsByAccountIdScriptedActionsByScriptedActionIdScheduleConfigurations -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/scripted-actions/{scriptedActionId}/schedule-configurations
#>
    [CmdletBinding(SupportsShouldProcess = $false)]
    param(
        [Parameter(Mandatory = $true)]
        [int] $ScriptedActionId,

        [Parameter(Mandatory = $true)]
        [string] $AccountId,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['scriptedActionId'] = $ScriptedActionId
        $pathValues['accountId'] = $AccountId
        $queryValues = @{}

        Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/accounts/{accountId}/scripted-actions/{scriptedActionId}/schedule-configurations' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
    }
}
