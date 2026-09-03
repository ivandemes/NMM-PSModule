# Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameCapacityExtenderProperties

## Synopsis

Set host pool capacity extender properties

## Syntax

~~~powershell
Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameCapacityExtenderProperties -SubscriptionId <string> -ResourceGroup <string> -PoolName <string> -AccountId <string> [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes
- Enabled: Enabling Azure Capacity Extender allows administrators to specify additional VM sizes in the event that sufficient resources are not available in the Azure region to complete Create and Power On tasks with the preferred VM Size
- IsAutomatic: When enabling this function, VM size selection will be dynamically based upon the current running configured size of the Virtual machines in the pool
- PreferenceVmSizes: VM sizes in this list will be used in sequence if the default preferred VM size is not available.

## API operation

PUT /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/capacity-extender-properties
