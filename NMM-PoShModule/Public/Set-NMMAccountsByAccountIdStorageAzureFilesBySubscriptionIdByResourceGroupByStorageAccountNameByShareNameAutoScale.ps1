function Set-NMMAccountsByAccountIdStorageAzureFilesBySubscriptionIdByResourceGroupByStorageAccountNameByShareNameAutoScale {
    <#
.SYNOPSIS
Update Azure Files autoscale
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
.PARAMETER InputObject
The JSON request body. Objects and hashtables are serialized automatically.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Set-NMMAccountsByAccountIdStorageAzureFilesBySubscriptionIdByResourceGroupByStorageAccountNameByShareNameAutoScale -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/storage/azure-files/{subscriptionId}/{resourceGroup}/{storageAccountName}/{shareName}/auto-scale
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [string] $SubscriptionId,

        [Parameter(Mandatory = $true)]
        [string] $ResourceGroup,

        [Parameter(Mandatory = $true)]
        [string] $StorageAccountName,

        [Parameter(Mandatory = $true)]
        [string] $ShareName,

        [Parameter(Mandatory = $true)]
        [string] $AccountId,

        [Parameter(Mandatory = $false, ValueFromPipeline = $true)]
        [AllowNull()]
        [object] $InputObject,

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

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/accounts/{accountId}/storage/azure-files/{subscriptionId}/{resourceGroup}/{storageAccountName}/{shareName}/auto-scale', 'PUT')) {
            Invoke-NMMApiRequest -Method 'PUT' -Path '/rest-api/v1/accounts/{accountId}/storage/azure-files/{subscriptionId}/{resourceGroup}/{storageAccountName}/{shareName}/auto-scale' -PathValues $pathValues -QueryValues $queryValues -Body $InputObject -BodyWasBound:$PSBoundParameters.ContainsKey('InputObject') -Connection $Connection
        }
    }
}
