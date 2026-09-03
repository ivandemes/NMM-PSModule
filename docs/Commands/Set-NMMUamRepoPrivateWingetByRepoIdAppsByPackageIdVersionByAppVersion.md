# Set-NMMUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersion

## Synopsis

Update version of WinGet application.

## Syntax

~~~powershell
Set-NMMUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersion -RepoId <integer> -PackageId <string> -AppVersion <string> [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes
- PackageName: name of the application.
- PackageLocale: package default locale. For example en-Us, en-Uk.
- Publisher: vendor of the package.
- ShortDescription: short description of the package.
- License: package license. Examples include Proprietary, MIT and Freeware. If unsure, enter Proprietary.
- Tags: List of additional package search terms.
More information can be found in this article: https://learn.microsoft.com/en-us/windows/package-manager/package/manifest?tabs=minschema%2cversion-example#minimal-required-schema.

## API operation

PUT /rest-api/v1/uam/repo/private/winget/{repoId}/apps/{packageId}/version/{appVersion}
