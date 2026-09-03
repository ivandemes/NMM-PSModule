# Remove-NMMUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersionInstallerByInstallerId

## Synopsis

Delete installer of specific version of WinGet application.

## Syntax

~~~powershell
Remove-NMMUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersionInstallerByInstallerId -RepoId <integer> -PackageId <string> -AppVersion <string> -InstallerId <string> [-Connection <psobject>]
~~~

## Description

No additional description is provided by the API specification.

## API operation

DELETE /rest-api/v1/uam/repo/private/winget/{repoId}/apps/{packageId}/version/{appVersion}/installer/{installerId}
