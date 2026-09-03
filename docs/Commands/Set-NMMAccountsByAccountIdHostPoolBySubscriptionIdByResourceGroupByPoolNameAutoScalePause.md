# Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAutoScalePause

## Synopsis

Pause autoscale for host pool

## Syntax

~~~powershell
Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAutoScalePause -SubscriptionId <string> -ResourceGroup <string> -PoolName <string> -AccountId <string> [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes
- TimezoneId: Enter your time zone or use UTC.
- DateTime: Enter datetime until which autoscale will be paused.

## API operation

PUT /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/auto-scale-pause
