function Set-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersion {
    <#
.SYNOPSIS
Update version of WinGet application.
.DESCRIPTION
## Notes
- PackageName: name of the application.
- PackageLocale: package default locale. For example en-Us, en-Uk.
- Publisher: vendor of the package.
- ShortDescription: short description of the package.
- License: package license. Examples include Proprietary, MIT and Freeware. If unsure, enter Proprietary.
- Tags: List of additional package search terms.
More information can be found in this article: https://learn.microsoft.com/en-us/windows/package-manager/package/manifest?tabs=minschema%2cversion-example#minimal-required-schema.
.PARAMETER RepoId
No additional description is provided by the API specification.
.PARAMETER PackageId
No additional description is provided by the API specification.
.PARAMETER AppVersion
No additional description is provided by the API specification.
.PARAMETER AccountId
No additional description is provided by the API specification.
.PARAMETER InputObject
The JSON request body. Objects and hashtables are serialized automatically.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Set-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersion -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/uam/repo/private/winget/{repoId}/apps/{packageId}/version/{appVersion}
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [int] $RepoId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [string] $PackageId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [string] $AppVersion,

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
        $pathValues['packageId'] = $PackageId
        $pathValues['appVersion'] = $AppVersion
        $pathValues['accountId'] = $AccountId
        $queryValues = @{}

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/accounts/{accountId}/uam/repo/private/winget/{repoId}/apps/{packageId}/version/{appVersion}', 'PUT')) {
            Invoke-NMMApiRequest -Method 'PUT' -Path '/rest-api/v1/accounts/{accountId}/uam/repo/private/winget/{repoId}/apps/{packageId}/version/{appVersion}' -PathValues $pathValues -QueryValues $queryValues -Body $InputObject -BodyWasBound:$PSBoundParameters.ContainsKey('InputObject') -Connection $Connection
        }
    }
}
