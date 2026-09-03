function Get-NMMUamRepoWingetByRepoIdAppsMetadata {
    <#
.SYNOPSIS
Get metadata of WinGet application.
.DESCRIPTION
No additional description is provided by the API specification.
.PARAMETER RepoId
No additional description is provided by the API specification.
.PARAMETER PackageId
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Get-NMMUamRepoWingetByRepoIdAppsMetadata -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/uam/repo/winget/{repoId}/apps/metadata
#>
    [CmdletBinding(SupportsShouldProcess = $false)]
    param(
        [Parameter(Mandatory = $true)]
        [int] $RepoId,

        [Parameter(Mandatory = $false)]
        [string] $PackageId,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['repoId'] = $RepoId
        $queryValues = @{}
        if ($PSBoundParameters.ContainsKey('PackageId')) { $queryValues['packageId'] = $PackageId }
        Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/uam/repo/winget/{repoId}/apps/metadata' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
    }
}
