function Get-NMMAccountsByAccountIdStorageAzureFilesBySubscriptionIdByResourceGroupByStorageAccountNameByShareNameAutoScale {
    <#
.SYNOPSIS
Get Azure Files autoscale
.DESCRIPTION
No additional description is provided by the API specification.
.PARAMETER SubscriptionId
No additional description is provided by the API specification.
.PARAMETER ResourceGroup
No additional description is provided by the API specification.
.PARAMETER StorageAccountName
No additional description is provided by the API specification.
.PARAMETER ShareName
No additional description is provided by the API specification.
.PARAMETER AccountId
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Get-NMMAccountsByAccountIdStorageAzureFilesBySubscriptionIdByResourceGroupByStorageAccountNameByShareNameAutoScale -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/storage/azure-files/{subscriptionId}/{resourceGroup}/{storageAccountName}/{shareName}/auto-scale
#>
    [CmdletBinding(SupportsShouldProcess = $false)]
    param(
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [string] $SubscriptionId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [string] $ResourceGroup,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [string] $StorageAccountName,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [string] $ShareName,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [string] $AccountId,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['subscriptionId'] = $SubscriptionId
        $pathValues['resourceGroup'] = $ResourceGroup
        $pathValues['storageAccountName'] = $StorageAccountName
        $pathValues['shareName'] = $ShareName
        $pathValues['accountId'] = $AccountId
        $queryValues = @{}

        Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/accounts/{accountId}/storage/azure-files/{subscriptionId}/{resourceGroup}/{storageAccountName}/{shareName}/auto-scale' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
    }
}
