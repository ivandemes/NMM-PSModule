# Remove-NMMUamRepoByRepoIdAppsFavorite

## Synopsis

Unmark application as favorite.

## Syntax

~~~powershell
Remove-NMMUamRepoByRepoIdAppsFavorite -RepoId <integer> [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes
- ExternalId: ID of app to remove from favorites.

## API operation

DELETE /rest-api/v1/uam/repo/{repoId}/apps/favorite
