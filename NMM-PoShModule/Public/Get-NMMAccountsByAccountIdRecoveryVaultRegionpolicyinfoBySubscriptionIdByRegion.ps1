function Get-NMMAccountsByAccountIdRecoveryVaultRegionpolicyinfoBySubscriptionIdByRegion {
    <#
.SYNOPSIS
Get information about region protection by policies
.DESCRIPTION
Enter region name and subscription id. The request will show what policies are protecting each resource type in current region and subscription.
Resource types: DesktopImageVm, ServerVm, SessionHostsInPersonalPool, SessionHostsInPooledPool, AzureFile.
.PARAMETER SubscriptionId
No additional description is provided by the API specification.
.PARAMETER Region
No additional description is provided by the API specification.
.PARAMETER AccountId
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Get-NMMAccountsByAccountIdRecoveryVaultRegionpolicyinfoBySubscriptionIdByRegion -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/recovery-vault/regionpolicyinfo/{subscriptionId}/{region}
#>
    [CmdletBinding(SupportsShouldProcess = $false)]
    param(
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [string] $SubscriptionId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [string] $Region,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [string] $AccountId,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['subscriptionId'] = $SubscriptionId
        $pathValues['region'] = $Region
        $pathValues['accountId'] = $AccountId
        $queryValues = @{}

        Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/accounts/{accountId}/recovery-vault/regionpolicyinfo/{subscriptionId}/{region}' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
    }
}
