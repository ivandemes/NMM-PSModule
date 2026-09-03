# Set-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsByPackageIdUpdate

## Synopsis

Update WinGet application.

## Syntax

~~~powershell
Set-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsByPackageIdUpdate -RepoId <integer> -PackageId <string> -AccountId <string> [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes
- PackageName: new name of the application.
- Publisher: new name for vendor of the package.
- Detection: extension that allow to configure custom detection rules to detect status of app deployment. Detection.Items are required.
- Detection.Items: rules to check whether file, folder, registry key or registry value exists or missing after app deployment action.
- Detection.Item[x].Type: Folder (1), File (2), RegKey(3), RegValue (4).
- Detection.Item[x].Folder: path to folder that should be created or deleted after app deployment action. Works with Item.Type (1).
- Detection.Item[x].File: path to file that should be created or deleted after app deployment action. Works with Item.Type (2).
- Detection.Item[x].FileVersion: file version that should be created or deleted after app deployment action. Works with Item.Type (2).
- Detection.Item[x].ProductVersion: product version that should be created or deleted after app deployment action. Works with Item.Type (2).
- Detection.Item[x].RegKey: registry key that should be created or deleted after app deployment action. Works with Item.Type (3).
- Detection.Item[x].RegValue: registry value that should be changed after app deployment action. Works with Item.Type (4).

## API operation

PUT /rest-api/v1/accounts/{accountId}/uam/repo/private/winget/{repoId}/apps/{packageId}/update
