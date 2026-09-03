# Get-NMMAccountsByAccountIdUamApps

## Synopsis

Get applications available in certain account.

## Syntax

~~~powershell
Get-NMMAccountsByAccountIdUamApps -AccountId <string> [-Filter <object>] [-Connection <psobject>]
~~~

## Description

## Notes
Returns list of apps available to specified account, including:
- Apps assigned to the account.
- Mobile apps and Native Intune Windows apps from account's Intune tenant, assigned from MSP level. Note that mobile apps and Native Intune Windows apps from original repos are not included in this list.
- Apps from repos managed at Account level.
Use these apps to create deployment policies.

## API operation

GET /rest-api/v1/accounts/{accountId}/uam/apps
