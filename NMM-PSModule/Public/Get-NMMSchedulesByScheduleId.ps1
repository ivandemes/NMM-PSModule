function Get-NMMSchedulesByScheduleId {
    <#
.SYNOPSIS
Get the global schedule profile by id
.DESCRIPTION
## Notes
- Id: Schedule profile id.
.PARAMETER ScheduleId
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Get-NMMSchedulesByScheduleId -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/schedules/{scheduleId}
#>
    [CmdletBinding(SupportsShouldProcess = $false)]
    param(
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [Alias('Id')]
        [int] $ScheduleId,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['scheduleId'] = $ScheduleId
        $queryValues = @{}

        Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/schedules/{scheduleId}' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
    }
}
