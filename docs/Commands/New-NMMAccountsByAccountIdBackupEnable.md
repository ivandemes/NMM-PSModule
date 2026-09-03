# New-NMMAccountsByAccountIdBackupEnable

## Synopsis

Enable backup

## Syntax

~~~powershell
New-NMMAccountsByAccountIdBackupEnable -AccountId <string> [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes
- SourceResourceId: Id of resource for which backup will be enabled.
- PolicyId: Id of recovery policy. Policy type should correspond with source resource type.

## API operation

POST /rest-api/v1/accounts/{accountId}/backup/enable
