# New-NMMAccountsByAccountIdUamRepoPrivateShell

## Synopsis

Create new Shell Apps repository

## Syntax

~~~powershell
New-NMMAccountsByAccountIdUamRepoPrivateShell -AccountId <string> [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes
You can leave all fields empty to create repo without storage
- LinkedResourceGroupId: ID of linked Azure resource group where Shell Repo resources will be created.
- Region: Azure region where Shell Repo resources will be created.
- StorageAccountId: ID of existing storage account. Leave empty if need to create new storage account.
- StorageAccountName: Name of new storage account to be created. Leave empty if need to re-use existing storage account.

## API operation

POST /rest-api/v1/accounts/{accountId}/uam/repo/private/shell
