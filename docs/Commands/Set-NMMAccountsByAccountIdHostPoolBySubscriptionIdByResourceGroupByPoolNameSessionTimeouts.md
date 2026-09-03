# Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameSessionTimeouts

## Synopsis

Set the host pool session timeouts

## Syntax

~~~powershell
Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameSessionTimeouts -SubscriptionId <string> -ResourceGroup <string> -PoolName <string> -AccountId <string> [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes
- *fresetBroken*: 1 for log off, instead of disconnecting, ACTIVE and IDLE sessions; 0 otherwise; *null* for "not configured" option.
- *maxIdleTime*: disconnect IDLE sessions after *maxIdleTime* minutes; *null* for "not configured" option.
- *maxConnectionTime*: disconnect ACTIVE sessions after *maxConnectionTime* minutes; *null* for "not configured" option.
- *maxDisconnectionTime*: log off DISCONNECTED sessions after *maxDisconnectionTime* minutes; *null* for "not configured" option.
- *remoteAppLogoffTimeLimit*: 0 log off EMPTY REMOTEAPP sessions after *remoteAppLogoffTimeLimit* minutes; *null* for "not configured" option. Use for RemoteApp pools only.
- *applyToHostsParams*: nullable
- *taskParallelism*: need to be at least 1.
- *countFailedTaskToStopWork*: need to be at least 1.
- *minutesBeforeRemove*: leave it *null*.
- *message*: leave it *null*.
- *restartVms*: restart VMs or not.

## API operation

PUT /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/session-timeouts
