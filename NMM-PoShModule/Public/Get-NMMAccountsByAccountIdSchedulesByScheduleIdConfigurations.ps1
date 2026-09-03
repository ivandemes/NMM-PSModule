function Get-NMMAccountsByAccountIdSchedulesByScheduleIdConfigurations {
    <#
.SYNOPSIS
Get the list of related schedule configurations by account schedule profile id
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
Get-NMMAccountsByAccountIdSchedulesByScheduleIdConfigurations -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/schedules/{scheduleId}/configurations
#>
    [CmdletBinding(SupportsShouldProcess = $false)]
    param(
        [Parameter(Mandatory = $true)]
        [int] $ScheduleId,

        [Parameter(Mandatory = $true)]
        [string] $AccountId,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['scheduleId'] = $ScheduleId
        $pathValues['accountId'] = $AccountId
        $queryValues = @{}

        Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/accounts/{accountId}/schedules/{scheduleId}/configurations' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
    }
}
