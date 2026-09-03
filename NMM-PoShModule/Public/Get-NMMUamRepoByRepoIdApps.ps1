function Get-NMMUamRepoByRepoIdApps {
    <#
.SYNOPSIS
Get application by ID.
.DESCRIPTION
No additional description is provided by the API specification.
.PARAMETER RepoId
No additional description is provided by the API specification.
.PARAMETER ExternalId
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Get-NMMUamRepoByRepoIdApps -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/uam/repo/{repoId}/apps
#>
    [CmdletBinding(SupportsShouldProcess = $false)]
    param(
        [Parameter(Mandatory = $true)]
        [int] $RepoId,

        [Parameter(Mandatory = $false)]
        [string] $ExternalId,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['repoId'] = $RepoId
        $queryValues = @{}
        if ($PSBoundParameters.ContainsKey('ExternalId')) { $queryValues['externalId'] = $ExternalId }
        Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/uam/repo/{repoId}/apps' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
    }
}
