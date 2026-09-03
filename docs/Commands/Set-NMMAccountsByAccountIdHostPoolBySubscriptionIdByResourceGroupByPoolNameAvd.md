# Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAvd

## Synopsis

Set the host pool properties

## Syntax

~~~powershell
Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAvd -SubscriptionId <string> -ResourceGroup <string> -PoolName <string> -AccountId <string> [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes
- Friendly Name: is visible to end-users.
- Description: is visible to administrators only. Description are limited to 512 characters.
- LoadBalancerType: Load balancing algorithm is used by the AVD Management Service to determine how to route a particular user’s desktop or RemoteApp connection.
Can be BreadthFirst, DepthFirst or Persistent. Should be specified if host pool is not personal and is not single host pool.
- Breadth first LB algorithm spreads users evenly across available session hosts.
- Depth first LB algorithm places users on a single host until the session limit is reached at which point users start being placed on the next host until the session limit is reached again.
- MaxSessionLimit: The number of sessions that a single host in the host pool can accept. Should be specified if host pool is not personal 
and is not single host pool.
- ValidationEnvironment: Validation host pools receive service updates at a faster cadence than non-validation host pools, allowing you to test service changes before they are deployed broadly to production.
- StartOnVmConnect: When enabled, stopped VMs will be automatically started when users attempt to connect.
See <a href="https://docs.microsoft.com/en-us/azure/virtual-desktop/start-virtual-machine-connect" target="_blank" rel="noopener noreferrer">this article</a> for more info.

## API operation

PUT /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/avd
