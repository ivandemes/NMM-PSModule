# Get-NMMAccountsByAccountIdUamRepoPrivateOrphan

## Synopsis

List linkable private winget repositories

## Syntax

~~~powershell
Get-NMMAccountsByAccountIdUamRepoPrivateOrphan -AccountId <string> [-Connection <psobject>]
~~~

## Description

## Notes
Returns list of web applications available to be linked as private winget repository on account level

## API operation

GET /rest-api/v1/accounts/{accountId}/uam/repo/private/orphan
