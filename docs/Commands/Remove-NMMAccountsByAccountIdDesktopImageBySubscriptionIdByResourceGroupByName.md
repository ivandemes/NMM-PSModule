# Remove-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByName

## Synopsis

Delete the desktop image

## Syntax

~~~powershell
Remove-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByName -Name <string> -ResourceGroup <string> -SubscriptionId <string> -AccountId <string> [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes
- SkipADRemoval: Skip the domain un-join task during the removal process. 
Using this option is not recommended but may be necessary if the VM cannot be powered on or un-joined from the domain normally. 
If selecting this option be sure to manually remove the AD computer object associated with this session host VM.

## API operation

DELETE /rest-api/v1/accounts/{accountId}/desktop-image/{subscriptionId}/{resourceGroup}/{name}
