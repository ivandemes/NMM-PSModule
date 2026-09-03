function Get-NMMScriptedActionsByScriptedActionIdScheduleConfigurations {
    <#
.SYNOPSIS
Get Azure runbook msp scripted action schedule configurations.
.DESCRIPTION
No additional description is provided by the API specification.
.PARAMETER ScriptedActionId
No additional description is provided by the API specification.
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
        [Parameter(Mandatory = $true)]
        [int] $ScriptedActionId,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['scriptedActionId'] = $ScriptedActionId
        $queryValues = @{}

        Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/scripted-actions/{scriptedActionId}/schedule-configurations' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
    }
}
