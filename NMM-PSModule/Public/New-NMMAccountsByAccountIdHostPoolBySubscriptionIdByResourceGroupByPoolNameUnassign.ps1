function New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameUnassign {
    <#
.SYNOPSIS
No additional description is provided by the API specification.
.DESCRIPTION
## Notes
- **Users** can be either an array of principals or GUIDs
- **Groups** can be an array of GUID only
- **AppGroups** can be unassigned only if host pool is not Personal
.PARAMETER SubscriptionId
No additional description is provided by the API specification.
.PARAMETER ResourceGroup
No additional description is provided by the API specification.
.PARAMETER PoolName
No additional description is provided by the API specification.
.PARAMETER AccountId
No additional description is provided by the API specification.
.PARAMETER InputObject
The JSON request body. Objects and hashtables are serialized automatically.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameUnassign -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/unassign
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [string] $SubscriptionId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [string] $ResourceGroup,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [string] $PoolName,

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
        $pathValues['subscriptionId'] = $SubscriptionId
        $pathValues['resourceGroup'] = $ResourceGroup
        $pathValues['poolName'] = $PoolName
        $pathValues['accountId'] = $AccountId
        $queryValues = @{}

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/unassign', 'POST')) {
            Invoke-NMMApiRequest -Method 'POST' -Path '/rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/unassign' -PathValues $pathValues -QueryValues $queryValues -Body $InputObject -BodyWasBound:$PSBoundParameters.ContainsKey('InputObject') -Connection $Connection
        }
    }
}
