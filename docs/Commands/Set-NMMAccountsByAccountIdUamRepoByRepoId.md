# Set-NMMAccountsByAccountIdUamRepoByRepoId

## Synopsis

Update linked repository

## Syntax

~~~powershell
Set-NMMAccountsByAccountIdUamRepoByRepoId -RepoId <integer> -AccountId <string> [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes
- NewDisplayName: Friendly name for this repository within Nerdio Manager.
Available for WinGet repos only.

## API operation

PUT /rest-api/v1/accounts/{accountId}/uam/repo/{repoId}
