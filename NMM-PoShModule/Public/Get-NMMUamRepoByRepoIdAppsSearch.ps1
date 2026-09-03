function Get-NMMUamRepoByRepoIdAppsSearch {
    <#
.SYNOPSIS
Search applications in the specific repository.
.DESCRIPTION
## Notes
- SearchTerm: at least 3 characters to begin search.
.PARAMETER RepoId
No additional description is provided by the API specification.
.PARAMETER SearchTerm
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Get-NMMUamRepoByRepoIdAppsSearch -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/uam/repo/{repoId}/apps/search
#>
    [CmdletBinding(SupportsShouldProcess = $false)]
    param(
        [Parameter(Mandatory = $true)]
        [int] $RepoId,

        [Parameter(Mandatory = $false)]
        [string] $SearchTerm,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['repoId'] = $RepoId
        $queryValues = @{}
        if ($PSBoundParameters.ContainsKey('SearchTerm')) { $queryValues['searchTerm'] = $SearchTerm }
        Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/uam/repo/{repoId}/apps/search' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
    }
}
