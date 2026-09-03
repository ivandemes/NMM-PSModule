function Set-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsByPackageIdUpdate {
    <#
.SYNOPSIS
Update WinGet application.
.DESCRIPTION
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
.PARAMETER RepoId
No additional description is provided by the API specification.
.PARAMETER PackageId
No additional description is provided by the API specification.
.PARAMETER AccountId
No additional description is provided by the API specification.
.PARAMETER InputObject
The JSON request body. Objects and hashtables are serialized automatically.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Set-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsByPackageIdUpdate -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/uam/repo/private/winget/{repoId}/apps/{packageId}/update
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [int] $RepoId,

        [Parameter(Mandatory = $true)]
        [string] $PackageId,

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
        $pathValues['repoId'] = $RepoId
        $pathValues['packageId'] = $PackageId
        $pathValues['accountId'] = $AccountId
        $queryValues = @{}

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/accounts/{accountId}/uam/repo/private/winget/{repoId}/apps/{packageId}/update', 'PUT')) {
            Invoke-NMMApiRequest -Method 'PUT' -Path '/rest-api/v1/accounts/{accountId}/uam/repo/private/winget/{repoId}/apps/{packageId}/update' -PathValues $pathValues -QueryValues $queryValues -Body $InputObject -BodyWasBound:$PSBoundParameters.ContainsKey('InputObject') -Connection $Connection
        }
    }
}
