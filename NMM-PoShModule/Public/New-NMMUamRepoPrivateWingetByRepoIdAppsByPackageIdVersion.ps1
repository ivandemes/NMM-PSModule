function New-NMMUamRepoPrivateWingetByRepoIdAppsByPackageIdVersion {
    <#
.SYNOPSIS
Add new version of WinGet application.
.DESCRIPTION
## Notes
- NewVersion: version to be created.
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
- Installer.Scope: installer scope for the package, the options are "user" or "machine". Please consult the vendor release notes for this information. .
- Installer.InstallModes: list of installation modes. Possible values are "interactive", "silent" and "silentWithProgress". 
- Installer.InstallerSwitches: installer switches. Refer to the vendor's documentation.
- Installer.NestedInstallerType: nested type of the installer nested within the ZIP file. For ZIP installer files only.
- Installer.ProductCode: product code is a GUID that is the principal identification of an application or product.
- Installer.PackageFamilyName: Package Family Name. For example, "Microsoft.WindowsAppRuntime.1.2_8wekyb3d8bbwe". For MSIX installers only.
- Installer.InstallerSuccessCodes: additional non-zero installer success exit codes other than known default values by the Windows Package Manager.
- Installer.AppsAndFeatures - various key values under installer's ARP entry.
- Installer.AppsAndFeatures.DisplayName: the DisplayName registry value.
- Installer.AppsAndFeatures.Publisher: the Publisher registry value.
- Installer.AppsAndFeatures.DisplayVersion: the DisplayVersion registry value.
- Installer.AppsAndFeatures.ProductCode: the ProductCode registry value.
- Installer.AppsAndFeatures.UpgradeCode: the UpgradeCode registry value.
- Installer.AppsAndFeatures.InstallerType: the InstallerType registry value.
More information can be found in this article: https://learn.microsoft.com/en-us/windows/package-manager/package/manifest?tabs=minschema%2cversion-example#minimal-required-schema.
.PARAMETER RepoId
No additional description is provided by the API specification.
.PARAMETER PackageId
No additional description is provided by the API specification.
.PARAMETER InputObject
The JSON request body. Objects and hashtables are serialized automatically.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
New-NMMUamRepoPrivateWingetByRepoIdAppsByPackageIdVersion -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/uam/repo/private/winget/{repoId}/apps/{packageId}/version
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [int] $RepoId,

        [Parameter(Mandatory = $true)]
        [string] $PackageId,

        [Parameter(Mandatory = $false, ValueFromPipeline = $true)]
        [AllowNull()]
        [object] $InputObject,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['repoId'] = $RepoId
        $pathValues['packageId'] = $PackageId
        $queryValues = @{}

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/uam/repo/private/winget/{repoId}/apps/{packageId}/version', 'POST')) {
            Invoke-NMMApiRequest -Method 'POST' -Path '/rest-api/v1/uam/repo/private/winget/{repoId}/apps/{packageId}/version' -PathValues $pathValues -QueryValues $queryValues -Body $InputObject -BodyWasBound:$PSBoundParameters.ContainsKey('InputObject') -Connection $Connection
        }
    }
}
