# New-NMMAccountsByAccountIdUamRepoPrivateWingetLink

## Synopsis

Link private winget repository

## Syntax

~~~powershell
New-NMMAccountsByAccountIdUamRepoPrivateWingetLink -AccountId <string> [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes
- Type: Type of repo. Currently only winget is supported
- DisplayName: Friendly name for this repository within Nerdio Manager. For WinGet repos only.
- WebApplicationId: Azure resource id of linkable orphan repository

## API operation

POST /rest-api/v1/accounts/{accountId}/uam/repo/private/winget/link
