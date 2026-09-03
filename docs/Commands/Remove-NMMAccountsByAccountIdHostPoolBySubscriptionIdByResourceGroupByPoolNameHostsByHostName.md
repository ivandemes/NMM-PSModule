# Remove-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostName

## Synopsis

Remove chosen host

## Syntax

~~~powershell
Remove-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostName -SubscriptionId <string> -ResourceGroup <string> -PoolName <string> -HostName <string> -AccountId <string> [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes
- SkipAdRemoval: Skip the domain un-join task during the removal process. Using this option is not recommended but may be necessary if the 
VM cannot be powered on or un-joined from the domain normally. If selecting this option be sure to manually remove the AD computer object 
associated with this session host VM.Using this option is not recommended. This option may be necessary if the VM cannot be powered on or 
if it’s in a broken state and cannot properly un-join the Active Directory.
- ForceRemoveWVDRecord: Remove AVD record only.
- RemoveUsedVmName: Checking this box will release the VM name and it will not be used again when new hosts are created automatically by 
auto-scale. Leaving this box unchecked will allow the same VM name to be used by auto-scale in the future.
- KeepDevices: Checking this box will keep Intune devices for the host enrolled with Intune.
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

## API operation

DELETE /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/hosts/{hostName}
