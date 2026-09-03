# Remove-NMMUamRepoPrivateWingetByRepoId

## Synopsis

Delete private winget repository

## Syntax

~~~powershell
Remove-NMMUamRepoPrivateWingetByRepoId -RepoId <integer> [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes
- ShouldDeleteAppServicePlan - specify if should delete repository app service plan together with repo resources
- ShouldDeleteLaw - specify if should delete repository log analytics workspace together with repo resources
- ShouldDeleteStorageAccount - specify if should delete repository storage account together with repo resources

## API operation

DELETE /rest-api/v1/uam/repo/private/winget/{repoId}
