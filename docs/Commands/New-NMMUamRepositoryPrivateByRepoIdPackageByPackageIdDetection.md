# New-NMMUamRepositoryPrivateByRepoIdPackageByPackageIdDetection

## Synopsis

Allow to configure custom detection rules to detect status of WinGet app deployment.

## Syntax

~~~powershell
New-NMMUamRepositoryPrivateByRepoIdPackageByPackageIdDetection -RepoId <integer> -PackageId <string> [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes
- ScriptedDetection: PowerShell script to detect whether app is installed.
- Items: rules to check whether file, folder, registry key or registry value exists or missing after app deployment action. Detection.Items are required. 
- Items[x].Type - Folder (1), File (2), RegKey(3), RegValue (4)
- Items[x].Folder - path to folder that should be created or deleted after app deployment action. Works with Item.Type (1).
- Items[x].File - path to file that should be created or deleted after app deployment action. Works with Item.Type (2).
- Items[x].FileVersion - file version that should be created or deleted after app deployment action. Works with Item.Type (2).
- Items[x].ProductVersion - product version that should be created or deleted after app deployment action. Works with Item.Type (2).
- Items[x].RegKey - registry key that should be created or deleted after app deployment action. Works with Item.Type (3).
- Items[x].RegValue - registry value that should be changed after app deployment action. Works with Item.Type (4).

## API operation

POST /rest-api/v1/uam/repository/private/{repoId}/package/{packageId}/detection
