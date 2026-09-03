# Get-NMMAccountsByAccountIdUamRepoPrivateByRepoId

## Synopsis

List IDs of all apps stored in private repo.

## Syntax

~~~powershell
Get-NMMAccountsByAccountIdUamRepoPrivateByRepoId -RepoId <integer> -AccountId <string> [-Filter <object>] [-Connection <psobject>]
~~~

## Description

## Notes
- RepoId: ID of repository.

## API operation

GET /rest-api/v1/accounts/{accountId}/uam/repo/private/{repoId}
