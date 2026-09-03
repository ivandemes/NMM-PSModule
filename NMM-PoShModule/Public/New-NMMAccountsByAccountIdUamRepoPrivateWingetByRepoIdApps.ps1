function New-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdApps {
    <#
.SYNOPSIS
Create WinGet application.
.DESCRIPTION
## Notes
- NewPackageId: ID of new app to create. Must be of the following format: "^[a-zA-Z0-9$\\-_()]{1,32}(\\.[a-zA-Z0-9$\\-_()]{1,32}){1,7}$". For example: "62ca27c.7a18bf1".
- Version: initial version to be created.
- PackageName: name of the application.
- PackageLocale: package default locale. For example en-Us, en-Uk.
- Publisher: vendor of the package.
- ShortDescription: short description of the package.
- License: package license. Examples include Proprietary, MIT and Freeware. If unsure, enter Proprietary.
- Tags: List of additional package search terms.
- Installer.InstallerUrl: full path to the installer file including extension.
- Installer.InstallerSHA256: SHA256 hash. It can be discovered by running the following command against the package: certutil -hashfile[file location] SHA256.
- Installer.Architecture: supported platform of the package. X86 applications can be installed on Windows 32bit and 64bit machines. x64 applications can only be installed on 64bit machines. Please refer to the vendor's package details.
- Installer.InstallerLocale: installer locale. For example, en-Us, en-Uk.
- Installer.InstallerType: type of the installation package. This can be discovered from the properties of the installer file. If the extension type is EXE and you are unsure of the specific format, please use 'EXE'. Supported upload formats (please note, not all formats may be supported for deployment via Nerdio Manager currently): "msix", "msi", "appx", "exe", "inno", "nullsoft", "wix", "burn", "portable", "zip", "pwa", "msstore".
- Installer.Scope: installer scope for the package, the options are "user" or "machine". Please consult the vendor release notes for this information.
- Installer.InstallModes: list of installation modes. Possible values are "interactive", "silent" and "silentWithProgress". 
- Installer.InstallerSwitches: installer switches. Refer to the vendor's documentation.
- Installer.NestedInstallerType: nested type of the installer nested within the ZIP file. For ZIP installer files only.
- Installer.ProductCode: product code is a GUID that is the principal identification of an application or product.
- Installer.PackageFamilyName: Package Family Name. For example, "Microsoft.WindowsAppRuntime.1.2_8wekyb3d8bbwe". For MSIX installers only.
- Installer.InstallerSuccessCodes: additional non-zero installer success exit codes other than known default values by the Windows Package Manager.
- Installer.AppsAndFeatures: various key values under installer's ARP entry.
- Installer.AppsAndFeatures.DisplayName: the DisplayName registry value.
- Installer.AppsAndFeatures.Publisher: the Publisher registry value.
- Installer.AppsAndFeatures.DisplayVersion: the DisplayVersion registry value.
- Installer.AppsAndFeatures.ProductCode: the ProductCode registry value.
- Installer.AppsAndFeatures.UpgradeCode: the UpgradeCode registry value.
- Installer.AppsAndFeatures.InstallerType: the InstallerType registry value.
- Detection: extension that allow to configure custom detection rules to detect status of app deployment. Detection.Items are required.
- Detection.Items: rules to check whether file, folder, registry key or registry value exists or missing after app deployment action.
- Detection.Items[x].Type: Folder (1), File (2), RegKey(3), RegValue (4).
- Detection.Items[x].Folder: path to folder that should be created or deleted after app deployment action. Works with Item.Type (1).
- Detection.Items[x].File: path to file that should be created or deleted after app deployment action. Works with Item.Type (2).
- Detection.Items[x].FileVersion: file version that should be created or deleted after app deployment action. Works with Item.Type (2).
- Detection.Items[x].ProductVersion: product version that should be created or deleted after app deployment action. Works with Item.Type (2).
- Detection.Items[x].RegKey: registry key that should be created or deleted after app deployment action. Works with Item.Type (3).
- Detection.Items[x].RegValue: registry value that should be changed after app deployment action. Works with Item.Type (4).
More information can be found in this article: https://learn.microsoft.com/en-us/windows/package-manager/package/manifest?tabs=minschema%2cversion-example#minimal-required-schema.
.PARAMETER RepoId
No additional description is provided by the API specification.
.PARAMETER AccountId
No additional description is provided by the API specification.
.PARAMETER InputObject
The JSON request body. Objects and hashtables are serialized automatically.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
New-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdApps -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/uam/repo/private/winget/{repoId}/apps
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [int] $RepoId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [string] $AccountId,

        [Parameter(Mandatory = $false, ValueFromPipeline = $true)]
        [AllowNull()]
        [object] $InputObject,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['repoId'] = $RepoId
        $pathValues['accountId'] = $AccountId
        $queryValues = @{}

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/accounts/{accountId}/uam/repo/private/winget/{repoId}/apps', 'POST')) {
            Invoke-NMMApiRequest -Method 'POST' -Path '/rest-api/v1/accounts/{accountId}/uam/repo/private/winget/{repoId}/apps' -PathValues $pathValues -QueryValues $queryValues -Body $InputObject -BodyWasBound:$PSBoundParameters.ContainsKey('InputObject') -Connection $Connection
        }
    }
}
