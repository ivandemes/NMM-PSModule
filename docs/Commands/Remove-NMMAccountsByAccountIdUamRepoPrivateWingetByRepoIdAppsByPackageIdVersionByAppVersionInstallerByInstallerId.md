# Remove-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersionInstallerByInstallerId

## Synopsis

Delete installer of specific version of WinGet application.

## Syntax

~~~powershell
Remove-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersionInstallerByInstallerId -RepoId <integer> -PackageId <string> -AppVersion <string> -InstallerId <string> -AccountId <string> [-Connection <psobject>]
~~~

## Description

No additional description is provided by the API specification.

## API operation

DELETE /rest-api/v1/accounts/{accountId}/uam/repo/private/winget/{repoId}/apps/{packageId}/version/{appVersion}/installer/{installerId}
