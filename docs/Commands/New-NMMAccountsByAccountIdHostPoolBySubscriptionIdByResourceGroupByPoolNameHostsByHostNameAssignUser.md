# New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameAssignUser

## Synopsis

Assign, Unassign or Reassign user to host

## Syntax

~~~powershell
New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameAssignUser -SubscriptionId <string> -ResourceGroup <string> -PoolName <string> -HostName <string> [-UserObjectId <string>] -AccountId <string> [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes
Applies to personal host pools only. Allows assigning, reassigning or unassigning a user from a session host. 
By default user will be forced logged off (if logged in) and user will be unassigned from host pool.

## API operation

POST /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/hosts/{hostName}/assignUser
