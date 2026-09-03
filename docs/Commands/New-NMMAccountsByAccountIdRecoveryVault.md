# New-NMMAccountsByAccountIdRecoveryVault

## Synopsis

Create new vault

## Syntax

~~~powershell
New-NMMAccountsByAccountIdRecoveryVault -AccountId <string> [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes
- VaultName: Must be less then 20 symbols.
- Location: Region for new vault. E.g. centralus, eastus.
- ReplicationType: Replication type for new vault. Should be LocallyRedundant, GeoRedundant or ZoneRedundant.
- The ZoneRedundant replication type supports a limited list of regions: https://learn.microsoft.com/en-us/azure/backup/backup-support-matrix#zone-redundant-storage-support

## API operation

POST /rest-api/v1/accounts/{accountId}/recovery-vault
