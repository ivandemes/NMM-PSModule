function Remove-NMMAccountsByAccountIdSchedulesByScheduleId {
    <#
.SYNOPSIS
Delete the account schedule profile by id
.DESCRIPTION
## Notes
- Id: Schedule profile id.
.PARAMETER ScheduleId
No additional description is provided by the API specification.
.PARAMETER AccountId
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Remove-NMMAccountsByAccountIdSchedulesByScheduleId -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/schedules/{scheduleId}
#>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
    param(
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [int] $ScheduleId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [string] $AccountId,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['scheduleId'] = $ScheduleId
        $pathValues['accountId'] = $AccountId
        $queryValues = @{}

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/accounts/{accountId}/schedules/{scheduleId}', 'DELETE')) {
            Invoke-NMMApiRequest -Method 'DELETE' -Path '/rest-api/v1/accounts/{accountId}/schedules/{scheduleId}' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
        }
    }
}
