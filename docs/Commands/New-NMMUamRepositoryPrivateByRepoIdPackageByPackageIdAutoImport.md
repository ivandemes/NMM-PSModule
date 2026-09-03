# New-NMMUamRepositoryPrivateByRepoIdPackageByPackageIdAutoImport

## Synopsis

Setup source app to import new versions automatically.

## Syntax

~~~powershell
New-NMMUamRepositoryPrivateByRepoIdPackageByPackageIdAutoImport -RepoId <integer> -PackageId <string> [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes
- SourceAppId: source app ID. Set null to turn synchronization off.

## API operation

POST /rest-api/v1/uam/repository/private/{repoId}/package/{packageId}/auto-import
