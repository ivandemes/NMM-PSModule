# Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameRunScript

## Synopsis

Run scripted actions on desktop image

## Syntax

~~~powershell
Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameRunScript -Name <string> -ResourceGroup <string> -SubscriptionId <string> -AccountId <string> [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes
- ScriptedActionsIds: Run the following scripted actions before set as image. List of int.
- DirectoryProfileId: ID of predefined configuration. Can be null.
- RestartVM: if true, VM will be restarted after script execution. Prefer setting this parameter to using any restarting Powershell commands as Custom Script extension will fail if script restarts the computer.
- ScheduleConfiguration: With the schedule set to null action will be performed immediately. With schedule turned ON and specified, the task will be 
performed according to the specified schedule. Can be null.
- StartDate: Start date when operation can begin.
- StartHour and StartMinute: Start time when operation can begin.
- TimeZoneId: Enter your time zone or use UTC.
- ScheduleRecurrenceType: Specify whether to run this operation once or repeat it on recurring schedule.
- DayOfWeekNumber: Specify in case of ScheduleRecurrenceType = Monthly.
This field means that operation will repeat every month on this day. 
E.g. you want to repeat this operation monthly every Second Friday. Then you choose ScheduleRecurrenceType = Monthly, DayOfWeekNumber = second, DayOfWeek = Friday.
- DayOfWeek: Specify in case of ScheduleRecurrenceType is equal Weekly or Monthly. This task will repeat every week on this day.

## API operation

PUT /rest-api/v1/accounts/{accountId}/desktop-image/{subscriptionId}/{resourceGroup}/{name}/run-script
