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
.PARAMETER Filter
A client-side filter applied to each item returned by the API. Accepts a script block such as { $_.name -like 'Prod*' } or a string such as "name -like 'Prod*'". API-native query parameters should be preferred when available.
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
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [Alias('Id')]
        [int] $RepoId,

        [Parameter(Mandatory = $false)]
        [string] $SearchTerm,

        [Parameter()]
        [ValidateScript({ $_ -is [scriptblock] -or ($_ -is [string] -and -not [string]::IsNullOrWhiteSpace($_)) })]
        [object] $Filter,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['repoId'] = $RepoId
        $queryValues = @{}
        if ($PSBoundParameters.ContainsKey('SearchTerm')) { $queryValues['searchTerm'] = $SearchTerm }
        $response = Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/uam/repo/{repoId}/apps/search' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
        if ($PSBoundParameters.ContainsKey('Filter')) {
            $filterScript = ConvertTo-NMMFilterScript -Filter $Filter
            $response | Where-Object -FilterScript $filterScript
        }
        else {
            $response
        }
    }
}
