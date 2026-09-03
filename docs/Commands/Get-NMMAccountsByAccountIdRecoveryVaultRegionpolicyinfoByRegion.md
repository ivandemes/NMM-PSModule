# Get-NMMAccountsByAccountIdRecoveryVaultRegionpolicyinfoByRegion

## Synopsis

Get information about region protection by policies

## Syntax

~~~powershell
Get-NMMAccountsByAccountIdRecoveryVaultRegionpolicyinfoByRegion -Region <string> -AccountId <string> [-Connection <psobject>]
~~~

## Description

Enter region name. The request will show what policies are protecting each resource type in current region.
Resource types: DesktopImageVm, ServerVm, SessionHostsInPersonalPool, SessionHostsInPooledPool, AzureFile.

## API operation

GET /rest-api/v1/accounts/{accountId}/recovery-vault/regionpolicyinfo/{region}
