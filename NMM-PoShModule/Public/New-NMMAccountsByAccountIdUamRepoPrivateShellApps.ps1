function New-NMMAccountsByAccountIdUamRepoPrivateShellApps {
    <#
.SYNOPSIS
Create Shell application.
.DESCRIPTION
## Notes
- Name: name of Shell application.
- Publisher: vendor of the Shell application.
- Description: description of the Shell application.
- IsPublic: is Shell app visible to unified app management.
- FileUnzip: setups if your zip file will be extracted into a temporary folder and the context will be set to that folder, so you will be able to use files from the archive directly. Option is available only for Shell apps with single version.
- Actions: Shell apps are using PowerShell scripts for deployment. Three app deployment actions have to be specified :install action, uninstall action, detect action.
- Actions.Install.Script: global install script that is used to install application if no override is specified for versions.
- Actions.Uninstall.Script: script that is used to uninstall application.
- Actions.Detect: custom detection rules to detect status of app deployment. Need to specify either Detection.Items for rules based detection or Detection.ScriptedDetection for script based detection. Both at same time are not allowed.
- Actions.Detect.Items: rules to check whether file, folder, registry key or registry value exists or missing after app deployment action.
- Actions.Detect.Items[x].Type: Folder (1), File (2), RegKey(3), RegValue (4).
- Actions.Detect.Items[x].Folder: path to folder that should be created or deleted after app deployment action. Works with Item.Type (1).
- Actions.Detect.Items[x].File: path to file that should be created or deleted after app deployment action. Works with Item.Type (2).
- Actions.Detect.Items[x].FileVersion: file version that should be created or deleted after app deployment action. Works with Item.Type (2).
- Actions.Detect.Items[x].ProductVersion: product version that should be created or deleted after app deployment action. Works with Item.Type (2).
- Actions.Detect.Items[x].RegKey: registry key that should be created or deleted after app deployment action. Works with Item.Type (3).
- Actions.Detect.Items[x].RegValue: registry value that should be changed after app deployment action. Works with Item.Type (4).
- Actions.Detect.ScriptedDetection: detection rule using PowerShell script to check whether Shell app is installed.
- Actions.Detect.ScriptedDetection.Script: script that is used to detect application.
- Versions: versions used by Shell application.
- Versions[x].Id: version ID.
- Versions[x].Name: version name.
- Versions[x].IsPreview: preview versions are not available for UAM.
- Versions[x].InstallScriptOverride: script that would be used INSTEAD of global install script.
- Versions[x].File: binary file that can be used by version. Optional.
- Versions[x].File.Name: name of the binary.
- Versions[x].File.SourceUrl: URL to download the binary.
- Versions[x].File.Size: size of the binary - in bytes.
- Versions[x].File.Sha256: binary file hash.
.PARAMETER AccountId
No additional description is provided by the API specification.
.PARAMETER InputObject
The JSON request body. Objects and hashtables are serialized automatically.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
New-NMMAccountsByAccountIdUamRepoPrivateShellApps -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/uam/repo/private/shell/apps
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [string] $AccountId,

        [Parameter(Mandatory = $false, ValueFromPipeline = $true)]
        [AllowNull()]
        [object] $InputObject,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['accountId'] = $AccountId
        $queryValues = @{}

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/accounts/{accountId}/uam/repo/private/shell/apps', 'POST')) {
            Invoke-NMMApiRequest -Method 'POST' -Path '/rest-api/v1/accounts/{accountId}/uam/repo/private/shell/apps' -PathValues $pathValues -QueryValues $queryValues -Body $InputObject -BodyWasBound:$PSBoundParameters.ContainsKey('InputObject') -Connection $Connection
        }
    }
}
