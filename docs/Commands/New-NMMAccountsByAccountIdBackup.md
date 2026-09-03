# New-NMMAccountsByAccountIdBackup

## Synopsis

Backup now

## Syntax

~~~powershell
New-NMMAccountsByAccountIdBackup -AccountId <string> [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

Execute backup of current resource.
## Notes
- SourceResourceId: Id of resource for which backup will be performed.

## API operation

POST /rest-api/v1/accounts/{accountId}/backup
