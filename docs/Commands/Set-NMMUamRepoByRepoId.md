# Set-NMMUamRepoByRepoId

## Synopsis

Update linked repository

## Syntax

~~~powershell
Set-NMMUamRepoByRepoId -RepoId <integer> [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes
- NewDisplayName: Friendly name for this repository within Nerdio Manager.
Available for WinGet repos only.

## API operation

PUT /rest-api/v1/uam/repo/{repoId}
