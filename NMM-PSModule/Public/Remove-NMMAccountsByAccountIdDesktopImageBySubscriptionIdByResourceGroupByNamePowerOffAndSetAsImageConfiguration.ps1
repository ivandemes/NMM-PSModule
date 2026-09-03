function Remove-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNamePowerOffAndSetAsImageConfiguration {
    <#
.SYNOPSIS
Remove 'set as image' schedule configuration
.DESCRIPTION
No additional description is provided by the API specification.
.PARAMETER Name
No additional description is provided by the API specification.
.PARAMETER ResourceGroup
No additional description is provided by the API specification.
.PARAMETER SubscriptionId
No additional description is provided by the API specification.
.PARAMETER AccountId
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Remove-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNamePowerOffAndSetAsImageConfiguration -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/desktop-image/{subscriptionId}/{resourceGroup}/{name}/power-off-and-set-as-image-configuration
#>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
    param(
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [string] $Name,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [string] $ResourceGroup,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [string] $SubscriptionId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [string] $AccountId,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['name'] = $Name
        $pathValues['resourceGroup'] = $ResourceGroup
        $pathValues['subscriptionId'] = $SubscriptionId
        $pathValues['accountId'] = $AccountId
        $queryValues = @{}

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/accounts/{accountId}/desktop-image/{subscriptionId}/{resourceGroup}/{name}/power-off-and-set-as-image-configuration', 'DELETE')) {
            Invoke-NMMApiRequest -Method 'DELETE' -Path '/rest-api/v1/accounts/{accountId}/desktop-image/{subscriptionId}/{resourceGroup}/{name}/power-off-and-set-as-image-configuration' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
        }
    }
}
