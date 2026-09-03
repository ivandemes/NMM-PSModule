# Get-NMMAccountsByAccountIdSchedulesByScheduleIdConfigurations

## Synopsis

Get the list of related schedule configurations by account schedule profile id

## Syntax

~~~powershell
Get-NMMAccountsByAccountIdSchedulesByScheduleIdConfigurations -ScheduleId <integer> -AccountId <string> [-Filter <object>] [-Connection <psobject>]
~~~

## Description

## Notes
- Id: Schedule profile id.

## API operation

GET /rest-api/v1/accounts/{accountId}/schedules/{scheduleId}/configurations
