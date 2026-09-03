function Set-NMMSchedulesByScheduleId {
    <#
.SYNOPSIS
Update the global schedule profile
.DESCRIPTION
## Notes
- Name: Schedule name
- StartDate: Start date when operation can begin.
- StartHour and StartMinute: Start time when operation can begin.
- TimeZoneId: Enter your time zone or use UTC.
- ScheduleRecurrenceType: Specify whether to run this operation once or repeat it on recurring schedule.
- WeeklySettings: Specify in case of ScheduleRecurrenceType = Weekly.
    - Days: Days of week when the task will repeat.
    - Period: Period in weeks when the task will repeat. If Period is equal 1, the task will repeat every week.
- MonthlySettings: Specify in case of ScheduleRecurrenceType = Monthly.
    - MultiDaysMode: 
        - Days: Specific days of month when the task will repeat.
    - SingleDayMode: 
        - DayOfWeekNumber: The task will repeat every month on this day. 
        E.g. you want to repeat this operation monthly every Second Friday, then you choose DayOfWeekNumber = Second, DayOfWeek = Friday.
        - DayOfWeek: The task will run on this day of week.
    - Period: Period in months when the task will repeat. If Period is equal 1, the task will repeat every month.
.PARAMETER ScheduleId
No additional description is provided by the API specification.
.PARAMETER InputObject
The JSON request body. Objects and hashtables are serialized automatically.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Set-NMMSchedulesByScheduleId -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/schedules/{scheduleId}
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [int] $ScheduleId,

        [Parameter(Mandatory = $false, ValueFromPipeline = $true)]
        [AllowNull()]
        [object] $InputObject,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['scheduleId'] = $ScheduleId
        $queryValues = @{}

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/schedules/{scheduleId}', 'PUT')) {
            Invoke-NMMApiRequest -Method 'PUT' -Path '/rest-api/v1/schedules/{scheduleId}' -PathValues $pathValues -QueryValues $queryValues -Body $InputObject -BodyWasBound:$PSBoundParameters.ContainsKey('InputObject') -Connection $Connection
        }
    }
}
