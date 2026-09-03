function Remove-NMMUamRepoPrivateByRepoIdAppsByExternalId {
    <#
.SYNOPSIS
Delete application from private repo.
.DESCRIPTION
No additional description is provided by the API specification.
.PARAMETER RepoId
No additional description is provided by the API specification.
.PARAMETER ExternalId
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Remove-NMMUamRepoPrivateByRepoIdAppsByExternalId -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/uam/repo/private/{repoId}/apps/{externalId}
#>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
    param(
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [int] $RepoId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [string] $ExternalId,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['repoId'] = $RepoId
        $pathValues['externalId'] = $ExternalId
        $queryValues = @{}

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/uam/repo/private/{repoId}/apps/{externalId}', 'DELETE')) {
            Invoke-NMMApiRequest -Method 'DELETE' -Path '/rest-api/v1/uam/repo/private/{repoId}/apps/{externalId}' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
        }
    }
}
