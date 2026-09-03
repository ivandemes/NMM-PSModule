# Remove-NMMAccountsByAccountIdUamRepoPrivateShellByRepoId

## Synopsis

Delete shell repository

## Syntax

~~~powershell
Remove-NMMAccountsByAccountIdUamRepoPrivateShellByRepoId -RepoId <integer> -AccountId <string> [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes
- ShouldDeleteStorageAccount - specify if should delete repository storage account together with repo resources

## API operation

DELETE /rest-api/v1/accounts/{accountId}/uam/repo/private/shell/{repoId}
