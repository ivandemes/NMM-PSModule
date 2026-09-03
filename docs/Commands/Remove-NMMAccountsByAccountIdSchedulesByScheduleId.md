# Remove-NMMAccountsByAccountIdSchedulesByScheduleId

## Synopsis

Delete the account schedule profile by id

## Syntax

~~~powershell
Remove-NMMAccountsByAccountIdSchedulesByScheduleId -ScheduleId <integer> -AccountId <string> [-Connection <psobject>]
~~~

## Description

## Notes
- Id: Schedule profile id.

## API operation

DELETE /rest-api/v1/accounts/{accountId}/schedules/{scheduleId}
