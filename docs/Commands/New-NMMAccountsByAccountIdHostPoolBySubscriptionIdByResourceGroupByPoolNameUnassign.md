# New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameUnassign

## Synopsis

No additional description is provided by the API specification.

## Syntax

~~~powershell
New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameUnassign -SubscriptionId <string> -ResourceGroup <string> -PoolName <string> -AccountId <string> [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes
- **Users** can be either an array of principals or GUIDs
- **Groups** can be an array of GUID only
- **AppGroups** can be unassigned only if host pool is not Personal

## API operation

POST /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/unassign
