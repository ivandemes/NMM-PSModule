function Remove-NMMAccountsByAccountIdScriptedActionsByScriptedActionIdScheduleConfigurationByConfigurationId {
    <#
.SYNOPSIS
Delete Azure runbook account scripted action schedule configuration by Id
.DESCRIPTION
No additional description is provided by the API specification.
.PARAMETER ScriptedActionId
No additional description is provided by the API specification.
.PARAMETER ConfigurationId
No additional description is provided by the API specification.
.PARAMETER AccountId
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Remove-NMMAccountsByAccountIdScriptedActionsByScriptedActionIdScheduleConfigurationByConfigurationId -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/scripted-actions/{scriptedActionId}/schedule-configuration/{configurationId}
#>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
    param(
        [Parameter(Mandatory = $true)]
        [int] $ScriptedActionId,

        [Parameter(Mandatory = $true)]
        [int] $ConfigurationId,

        [Parameter(Mandatory = $true)]
        [string] $AccountId,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['scriptedActionId'] = $ScriptedActionId
        $pathValues['configurationId'] = $ConfigurationId
        $pathValues['accountId'] = $AccountId
        $queryValues = @{}

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/accounts/{accountId}/scripted-actions/{scriptedActionId}/schedule-configuration/{configurationId}', 'DELETE')) {
            Invoke-NMMApiRequest -Method 'DELETE' -Path '/rest-api/v1/accounts/{accountId}/scripted-actions/{scriptedActionId}/schedule-configuration/{configurationId}' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
        }
    }
}
