# Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAssignedUsers

## Synopsis

List of users assigned to the pool

## Syntax

~~~powershell
Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAssignedUsers -SubscriptionId <string> -ResourceGroup <string> -PoolName <string> [-IncludeGroupAssignments <boolean>] -AccountId <string> [-Connection <psobject>]
~~~

## Description

Returns users assigned to the host pool, including direct assignments and, optionally, users resolved from assigned groups.
Direct users are returned once with `GroupName = null`.
When `includeGroupAssignments` is `true`, group members are returned once for each assigned group they belong to,
and `GroupName` contains the corresponding group display name.
A user who is both directly assigned and assigned through one or more groups can appear multiple times.

## API operation

GET /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/assigned-users
