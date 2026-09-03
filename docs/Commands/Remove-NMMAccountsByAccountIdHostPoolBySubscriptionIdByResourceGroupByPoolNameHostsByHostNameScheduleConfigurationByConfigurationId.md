# Remove-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameScheduleConfigurationByConfigurationId

## Synopsis

Remove job schedule configuration by Id

## Syntax

~~~powershell
Remove-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameScheduleConfigurationByConfigurationId -SubscriptionId <string> -ResourceGroup <string> -PoolName <string> -HostName <string> -ConfigurationId <integer> -AccountId <string> [-Connection <psobject>]
~~~

## Description

No additional description is provided by the API specification.

## API operation

DELETE /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/hosts/{hostName}/schedule-configuration/{configurationId}
