# New-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameOpenRdp

## Synopsis

Open RDP access

## Syntax

~~~powershell
New-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameOpenRdp -Name <string> -ResourceGroup <string> -SubscriptionId <string> -AccountId <string> [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes
- ClientIp: IP for which access will be opened
- AccessDuration: access duration value in minutes from 30 to 1440

## API operation

POST /rest-api/v1/accounts/{accountId}/desktop-image/{subscriptionId}/{resourceGroup}/{name}/open-rdp
