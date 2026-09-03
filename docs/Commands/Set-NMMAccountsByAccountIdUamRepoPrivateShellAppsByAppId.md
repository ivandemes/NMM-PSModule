# Set-NMMAccountsByAccountIdUamRepoPrivateShellAppsByAppId

## Synopsis

Update Shell application.

## Syntax

~~~powershell
Set-NMMAccountsByAccountIdUamRepoPrivateShellAppsByAppId -AppId <integer> -AccountId <string> [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes
- Id: Id of Shell application to update.
- Name: name of Shell application.
- Publisher: vendor of the Shell application.
- Description: description of the Shell application.
- IsPublic: is Shell app visible to unified app management.
- Actions: Shell apps are using PowerShell scripts for deployment. Three app deployment actions have to be specified :install action, uninstall action, detect action.
- Action.Install.Script: global install script that is used to install application if no override is specified for versions.
- Action.Uninstall.Script: script that is used to uninstall application.
- Action.Detect: custom detection rules to detect status of app deployment. Need to specify either Detection.Items for rules based detection or Detection.ScriptedDetection for script based detection. Both at same time are not allowed.
- Action.Detect.Items: rules to check whether file, folder, registry key or registry value exists or missing after app deployment action.
- Action.Detect.Items[x].Type: Folder (1), File (2), RegKey(3), RegValue (4).
- Action.Detect.Items[x].Folder: path to folder that should be created or deleted after app deployment action. Works with Item.Type (1).
- Action.Detect.Items[x].File: path to file that should be created or deleted after app deployment action. Works with Item.Type (2).
- Action.Detect.Items[x].FileVersion - file version that should be created or deleted after app deployment action. Works with Item.Type (2).
- Action.Detect.Items[x].ProductVersion - product version that should be created or deleted after app deployment action. Works with Item.Type (2).
- Action.Detect.Items[x].RegKey: registry key that should be created or deleted after app deployment action. Works with Item.Type (3).
- Action.Detect.Items[x].RegValue: registry value that should be changed after app deployment action. Works with Item.Type (4).
- Action.Detect.ScriptedDetection: detection rule using PowerShell script to check whether Shell app is installed.
- Action.Detect.ScriptedDetection.Script: script that is used to detect application.
- Versions: versions used by Shell application.
- Versions[x].Id: version ID.
- Versions[x].Name: version name.
- Version.IsPreview: preview versions are not available for UAM.
- Version.InstallScriptOverride: script that would be used INSTEAD of global install script.
- Version.File: binary file that can be used by version. Optional.
- Version.File.Name: name of the binary.
- Version.File.SourceUrl: URL to download the binary.
- Version.File.Size: size of the binary - in bytes.
- Version.File.Sha256: binary file hash.

## API operation

PUT /rest-api/v1/accounts/{accountId}/uam/repo/private/shell/apps/{appId}
