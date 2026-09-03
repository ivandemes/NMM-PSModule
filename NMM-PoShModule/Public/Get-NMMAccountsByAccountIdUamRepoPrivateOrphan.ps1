function Get-NMMAccountsByAccountIdUamRepoPrivateOrphan {
    <#
.SYNOPSIS
List linkable private winget repositories
.DESCRIPTION
## Notes
Returns list of web applications available to be linked as private winget repository on account level
.PARAMETER AccountId
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Get-NMMAccountsByAccountIdUamRepoPrivateOrphan -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/uam/repo/private/orphan
#>
    [CmdletBinding(SupportsShouldProcess = $false)]
    param(
        [Parameter(Mandatory = $true)]
        [string] $AccountId,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['accountId'] = $AccountId
        $queryValues = @{}

        Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/accounts/{accountId}/uam/repo/private/orphan' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
    }
}
