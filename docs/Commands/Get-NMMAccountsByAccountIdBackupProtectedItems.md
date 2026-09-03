# Get-NMMAccountsByAccountIdBackupProtectedItems

## Synopsis

Get all protected items

## Syntax

~~~powershell
Get-NMMAccountsByAccountIdBackupProtectedItems -AccountId <string> [-Connection <psobject>]
~~~

## Description

## Notes
- Id: Protected item id.
- SourceResourceId: Id of resource that has enabled backup.
- ProtectionState: If Protected or IRPending - item is protected. If ProtectionStopped or ProtectionPaused - protection stopped for this item.
If SoftDeleted = true - item is soft deleted.

## API operation

GET /rest-api/v1/accounts/{accountId}/backup/protectedItems
