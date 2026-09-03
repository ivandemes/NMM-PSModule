# Set-NMMUamRepoPrivateWingetByRepoIdAppsByPackageIdUpdate

## Synopsis

Update WinGet application.

## Syntax

~~~powershell
Set-NMMUamRepoPrivateWingetByRepoIdAppsByPackageIdUpdate -RepoId <integer> -PackageId <string> [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes
- PackageName: new name of the application.
- Publisher: new name for vendor of the package.
- Detection: extension that allow to configure custom detection rules to detect status of app deployment. Detection.Items are required.
- Detection.Items: rules to check whether file, folder, registry key or registry value exists or missing after app deployment action. 
- Detection.Items[x].Type: Folder (1), File (2), RegKey(3), RegValue (4).
- Detection.Items[x].Folder: path to folder that should be created or deleted after app deployment action. Works with Item.Type (1).
- Detection.Items[x].File: path to file that should be created or deleted after app deployment action. Works with Item.Type (2).
- Detection.Items[x].FileVersion: file version that should be created or deleted after app deployment action. Works with Item.Type (2).
- Detection.Items[x].ProductVersion: product version that should be created or deleted after app deployment action. Works with Item.Type (2).
- Detection.Items[x].RegKey: registry key that should be created or deleted after app deployment action. Works with Item.Type (3).
- Detection.Items[x].RegValue: registry value that should be changed after app deployment action. Works with Item.Type (4).

## API operation

PUT /rest-api/v1/uam/repo/private/winget/{repoId}/apps/{packageId}/update
