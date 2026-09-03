# Get-NMMUamRepoPrivateByRepoId

## Synopsis

List IDs of all apps stored in private repo.

## Syntax

~~~powershell
Get-NMMUamRepoPrivateByRepoId -RepoId <integer> [-Filter <object>] [-Connection <psobject>]
~~~

## Description

## Notes
- RepoId: ID of repository.

## API operation

GET /rest-api/v1/uam/repo/private/{repoId}
