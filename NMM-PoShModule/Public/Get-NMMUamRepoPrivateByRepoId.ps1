function Get-NMMUamRepoPrivateByRepoId {
    <#
.SYNOPSIS
List IDs of all apps stored in private repo.
.DESCRIPTION
## Notes
- RepoId: ID of repository.
.PARAMETER RepoId
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Get-NMMUamRepoPrivateByRepoId -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/uam/repo/private/{repoId}
#>
    [CmdletBinding(SupportsShouldProcess = $false)]
    param(
        [Parameter(Mandatory = $true)]
        [int] $RepoId,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['repoId'] = $RepoId
        $queryValues = @{}

        Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/uam/repo/private/{repoId}' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
    }
}
