# New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameRunScriptBulk

## Synopsis

Run script on all hosts in the pool

## Syntax

~~~powershell
New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameRunScriptBulk -SubscriptionId <string> -ResourceGroup <string> -PoolName <string> -AccountId <string> [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes
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
- Message and MinutesBeforeRemove: Send a message to all users on a session host before performing the operation. Session hosts will be placed into drain mode (deactivated) before the message is sent. Can be null.
- ScriptedActionsIds: Run the following scripted actions before set as image. List of int.
- DirectoryProfileId: ID of predefined configuration. Can be null.
- RestartVM: if true, VM will be restarted after script execution. Prefer setting this parameter to using any restarting Powershell commands as Custom Script extension will fail if script restarts the computer.

## API operation

POST /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/run-script-bulk
