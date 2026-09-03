function Get-NMMSchedulesByScheduleIdConfigurations {
    <#
.SYNOPSIS
Get the list of related schedule configurations by global schedule profile id
.DESCRIPTION
## Notes
- Id: Schedule profile id.
.PARAMETER ScheduleId
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Get-NMMSchedulesByScheduleIdConfigurations -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/schedules/{scheduleId}/configurations
#>
    [CmdletBinding(SupportsShouldProcess = $false)]
    param(
        [Parameter(Mandatory = $true)]
        [int] $ScheduleId,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['scheduleId'] = $ScheduleId
        $queryValues = @{}

        Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/schedules/{scheduleId}/configurations' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
    }
}
