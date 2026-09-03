# Set-NMMSchedulesByScheduleId

## Synopsis

Update the global schedule profile

## Syntax

~~~powershell
Set-NMMSchedulesByScheduleId -ScheduleId <integer> [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

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

## API operation

PUT /rest-api/v1/schedules/{scheduleId}
