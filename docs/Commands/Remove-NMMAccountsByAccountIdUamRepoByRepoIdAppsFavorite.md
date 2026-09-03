# Remove-NMMAccountsByAccountIdUamRepoByRepoIdAppsFavorite

## Synopsis

Unmark application as favorite.

## Syntax

~~~powershell
Remove-NMMAccountsByAccountIdUamRepoByRepoIdAppsFavorite -RepoId <integer> -AccountId <string> [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes
- ExternalId: ID of app to remove from favorites.

## API operation

DELETE /rest-api/v1/accounts/{accountId}/uam/repo/{repoId}/apps/favorite
