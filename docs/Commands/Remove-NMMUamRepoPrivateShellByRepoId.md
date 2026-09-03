# Remove-NMMUamRepoPrivateShellByRepoId

## Synopsis

Delete shell repository

## Syntax

~~~powershell
Remove-NMMUamRepoPrivateShellByRepoId -RepoId <integer> [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes
- ShouldDeleteStorageAccount - specify if should delete repository storage account together with repo resources

## API operation

DELETE /rest-api/v1/uam/repo/private/shell/{repoId}
