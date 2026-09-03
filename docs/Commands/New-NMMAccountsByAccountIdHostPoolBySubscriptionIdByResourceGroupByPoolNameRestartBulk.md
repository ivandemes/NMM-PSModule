# New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameRestartBulk

## Synopsis

Restart all hosts in the pool

## Syntax

~~~powershell
New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameRestartBulk -SubscriptionId <string> -ResourceGroup <string> -PoolName <string> -AccountId <string> [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes
- LogOffUsers: All users will be logged off.
- Schedule: With the schedule set to null action will be performed immediately. With schedule turned ON and specified, the task will be 
performed according to the specified schedule. Can be null.
    - Id: Schedule id to edit. Can be null.
    - ProfileId: Global or Account schedule profile id. Can be null.
    - DisplayName: Friendly name of the schedule.
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
- BulkParameters: Must be specified.
- TaskParallelism: Specify the number of concurrent operations when performing this bulk action. 
Large number of concurrent operations will allow the process to complete quicker but if there is an issue with Azure many hosts may end 
up in an error state.
- CountFailedTaskToStopWork: Stop the process after this many failures. This setting can help prevent a problem on Azure from making 
all session hosts unavailable to users.

## API operation

POST /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/restart-bulk
