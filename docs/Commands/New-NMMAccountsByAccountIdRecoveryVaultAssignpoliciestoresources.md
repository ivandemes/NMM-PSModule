# New-NMMAccountsByAccountIdRecoveryVaultAssignpoliciestoresources

## Synopsis

Assign policies to resources.

## Syntax

~~~powershell
New-NMMAccountsByAccountIdRecoveryVaultAssignpoliciestoresources -AccountId <string> [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

Define what policies will protect each resource type in current region.
Resource types: DesktopImageVm, ServerVm, SessionHostsInPersonalPool, SessionHostsInPooledPool, AzureFile.

## API operation

POST /rest-api/v1/accounts/{accountId}/recovery-vault/assignpoliciestoresources
