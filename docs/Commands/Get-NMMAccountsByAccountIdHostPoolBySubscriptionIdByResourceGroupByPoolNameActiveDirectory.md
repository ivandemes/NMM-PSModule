# Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameActiveDirectory

## Synopsis

Get the host pool active directory

## Syntax

~~~powershell
Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameActiveDirectory -SubscriptionId <string> -ResourceGroup <string> -PoolName <string> -AccountId <string> [-Connection <psobject>]
~~~

## Description

## Notes
- Type can be Default, Predefined or Custom.
- ADIdentityType can be AD, AzureAD or AzureADDS.
- EnrollWithIntune: If Intune is configured in your Azure Active Directory tenant.

## API operation

GET /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/active-directory
