function Get-NMMAccountsByAccountIdRecoveryVaultRegionpolicyinfoByRegion {
    <#
.SYNOPSIS
Get information about region protection by policies
.DESCRIPTION
Enter region name. The request will show what policies are protecting each resource type in current region.
Resource types: DesktopImageVm, ServerVm, SessionHostsInPersonalPool, SessionHostsInPooledPool, AzureFile.
.PARAMETER Region
No additional description is provided by the API specification.
.PARAMETER AccountId
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Get-NMMAccountsByAccountIdRecoveryVaultRegionpolicyinfoByRegion -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/recovery-vault/regionpolicyinfo/{region}
#>
    [CmdletBinding(SupportsShouldProcess = $false)]
    param(
        [Parameter(Mandatory = $true)]
        [string] $Region,

        [Parameter(Mandatory = $true)]
        [string] $AccountId,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['region'] = $Region
        $pathValues['accountId'] = $AccountId
        $queryValues = @{}

        Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/accounts/{accountId}/recovery-vault/regionpolicyinfo/{region}' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
    }
}
