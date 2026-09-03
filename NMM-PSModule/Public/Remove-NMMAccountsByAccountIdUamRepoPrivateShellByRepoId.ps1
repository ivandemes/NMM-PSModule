function Remove-NMMAccountsByAccountIdUamRepoPrivateShellByRepoId {
    <#
.SYNOPSIS
Delete shell repository
.DESCRIPTION
## Notes
- ShouldDeleteStorageAccount - specify if should delete repository storage account together with repo resources
.PARAMETER RepoId
No additional description is provided by the API specification.
.PARAMETER AccountId
No additional description is provided by the API specification.
.PARAMETER InputObject
The JSON request body. Objects and hashtables are serialized automatically.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Remove-NMMAccountsByAccountIdUamRepoPrivateShellByRepoId -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/uam/repo/private/shell/{repoId}
#>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
    param(
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [int] $RepoId,

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
        $pathValues['accountId'] = $AccountId
        $queryValues = @{}

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/accounts/{accountId}/uam/repo/private/shell/{repoId}', 'DELETE')) {
            Invoke-NMMApiRequest -Method 'DELETE' -Path '/rest-api/v1/accounts/{accountId}/uam/repo/private/shell/{repoId}' -PathValues $pathValues -QueryValues $queryValues -Body $InputObject -BodyWasBound:$PSBoundParameters.ContainsKey('InputObject') -Connection $Connection
        }
    }
}
