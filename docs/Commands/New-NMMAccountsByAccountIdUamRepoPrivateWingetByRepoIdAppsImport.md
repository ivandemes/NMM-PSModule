# New-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsImport

## Synopsis

Import application from one WinGet repo to another.

## Syntax

~~~powershell
New-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsImport -RepoId <integer> -AccountId <string> [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes
- SourcePackageId: ID of app to be imported.
- TargetRepoId: ID of repo where the app should be imported to.
- NewPackageId: ID of new app to create. Must be of the following format: "^[a-zA-Z0-9$\\-_()]{1,32}(\\.[a-zA-Z0-9$\\-_()]{1,32}){1,7}$". For example: "62ca27c.7a18bf1". Leave empty if need to import versions to existing app.
- ExistingPackageId: ID of existing app to import versions to. Leave empty if need to create new app.
- VersionsToImport: app versions to import.
- EnableAutoImport: specify whether the latest version of the source package should be automatically imported.

## API operation

POST /rest-api/v1/accounts/{accountId}/uam/repo/private/winget/{repoId}/apps/import
