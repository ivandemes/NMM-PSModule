function Get-NMMUamRepoByRepoIdAppsExtensions {
    <#
.SYNOPSIS
Get application extensions.
Extensions include app detection and auto-import configuration.
.DESCRIPTION
No additional description is provided by the API specification.
.PARAMETER RepoId
No additional description is provided by the API specification.
.PARAMETER PackageId
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Get-NMMUamRepoByRepoIdAppsExtensions -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/uam/repo/{repoId}/apps/extensions
#>
    [CmdletBinding(SupportsShouldProcess = $false)]
    param(
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [Alias('Id')]
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
        Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/uam/repo/{repoId}/apps/extensions' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
    }
}
