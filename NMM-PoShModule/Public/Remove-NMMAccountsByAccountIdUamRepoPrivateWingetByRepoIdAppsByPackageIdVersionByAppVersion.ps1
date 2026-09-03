function Remove-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersion {
    <#
.SYNOPSIS
Delete version of WinGet application.
.DESCRIPTION
No additional description is provided by the API specification.
.PARAMETER RepoId
No additional description is provided by the API specification.
.PARAMETER PackageId
No additional description is provided by the API specification.
.PARAMETER AppVersion
No additional description is provided by the API specification.
.PARAMETER AccountId
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Remove-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersion -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/uam/repo/private/winget/{repoId}/apps/{packageId}/version/{appVersion}
#>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
    param(
        [Parameter(Mandatory = $true)]
        [int] $RepoId,

        [Parameter(Mandatory = $true)]
        [string] $PackageId,

        [Parameter(Mandatory = $true)]
        [string] $AppVersion,

        [Parameter(Mandatory = $true)]
        [string] $AccountId,

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

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/accounts/{accountId}/uam/repo/private/winget/{repoId}/apps/{packageId}/version/{appVersion}', 'DELETE')) {
            Invoke-NMMApiRequest -Method 'DELETE' -Path '/rest-api/v1/accounts/{accountId}/uam/repo/private/winget/{repoId}/apps/{packageId}/version/{appVersion}' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
        }
    }
}
