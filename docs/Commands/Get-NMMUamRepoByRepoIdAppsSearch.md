# Get-NMMUamRepoByRepoIdAppsSearch

## Synopsis

Search applications in the specific repository.

## Syntax

~~~powershell
Get-NMMUamRepoByRepoIdAppsSearch -RepoId <integer> [-SearchTerm <string>] [-Connection <psobject>]
~~~

## Description

## Notes
- SearchTerm: at least 3 characters to begin search.

## API operation

GET /rest-api/v1/uam/repo/{repoId}/apps/search
