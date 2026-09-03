# New-NMMAccountsByAccountIdBackupDisable

## Synopsis

Disable backup

## Syntax

~~~powershell
New-NMMAccountsByAccountIdBackupDisable -AccountId <string> [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

The resource will be removed from the backup policy and we will no longer backup this resource. 
You will be able to restore only from any recovery points available so far.
## Notes
- SourceResourceId: Id of resource for which backup will be disabled.
- RemoveAllBackups: Destroy all previous backups of this item in addition to disabling all future backups.

## API operation

POST /rest-api/v1/accounts/{accountId}/backup/disable
