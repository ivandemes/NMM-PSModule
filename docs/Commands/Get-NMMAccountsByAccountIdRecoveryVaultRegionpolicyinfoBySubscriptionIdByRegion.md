# Get-NMMAccountsByAccountIdRecoveryVaultRegionpolicyinfoBySubscriptionIdByRegion

## Synopsis

Get information about region protection by policies

## Syntax

~~~powershell
Get-NMMAccountsByAccountIdRecoveryVaultRegionpolicyinfoBySubscriptionIdByRegion -SubscriptionId <string> -Region <string> -AccountId <string> [-Connection <psobject>]
~~~

## Description

Enter region name and subscription id. The request will show what policies are protecting each resource type in current region and subscription.
Resource types: DesktopImageVm, ServerVm, SessionHostsInPersonalPool, SessionHostsInPooledPool, AzureFile.

## API operation

GET /rest-api/v1/accounts/{accountId}/recovery-vault/regionpolicyinfo/{subscriptionId}/{region}
