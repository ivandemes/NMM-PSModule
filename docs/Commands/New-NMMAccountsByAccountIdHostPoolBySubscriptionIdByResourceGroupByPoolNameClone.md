# New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameClone

## Synopsis

Clone chosen host pool.

## Syntax

~~~powershell
New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameClone -SubscriptionId <string> -ResourceGroup <string> -PoolName <string> -AccountId <string> [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes
- WorkspaceId: This is a container for host pools and session hosts that provides desktops and RemoteApps to users. Go to Workspaces section and choose one. In case if there is no
workspaces - create a new one.
- Name: Name of new host pool.
- CopyAssignments: If true users will be assigned to the same app groups in cloned host pool.
- CopyAutoscaleSettings: If true created host pool will have exactly the same autoscale pool configuration as the source.
- Prefix: Need to be specified in case of CopyAutoscaleSettings = true. Cannot be the same as any existing host pools. 
Pattern characters must be enclosed in {} and can be # (for sequential numbers) and/or ? (for random alphanumeric characters). One # implies numbers from 0 to 9, two #s implies numbers of 0 to 99, etc.
Example 1: AVDHOST{###} (AVDHOST000..AVDHOST999). 
Example 2: AVDHOST-{???} (AVDHOST-d83, AVDHOST-7sl, etc.).

## API operation

POST /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/clone
