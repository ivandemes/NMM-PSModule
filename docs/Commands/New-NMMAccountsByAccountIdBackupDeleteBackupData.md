# New-NMMAccountsByAccountIdBackupDeleteBackupData

## Synopsis

Delete backup data

## Syntax

~~~powershell
New-NMMAccountsByAccountIdBackupDeleteBackupData -AccountId <string> [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

The resource will be removed from the backup vault. 
You will not be able to restore this resource.
## Notes
- SourceResourceId: Id of resource for which backup data will be deleted.

## API operation

POST /rest-api/v1/accounts/{accountId}/backup/deleteBackupData
