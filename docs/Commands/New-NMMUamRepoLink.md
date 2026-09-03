# New-NMMUamRepoLink

## Synopsis

Link existing repository

## Syntax

~~~powershell
New-NMMUamRepoLink [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes
- Type: Type of repo.
- DisplayName: Friendly name for this repository within Nerdio Manager. For WinGet repos only.
- Url: URL address of the repository. For WinGet repos only.
- AuthKey: authentication key. For WinGet repos only.

## API operation

POST /rest-api/v1/uam/repo/link
