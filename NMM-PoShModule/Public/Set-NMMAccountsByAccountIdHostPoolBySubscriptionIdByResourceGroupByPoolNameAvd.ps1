function Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAvd {
    <#
.SYNOPSIS
Set the host pool properties
.DESCRIPTION
## Notes
- Friendly Name: is visible to end-users.
- Description: is visible to administrators only. Description are limited to 512 characters.
- LoadBalancerType: Load balancing algorithm is used by the AVD Management Service to determine how to route a particular user’s desktop or RemoteApp connection.
Can be BreadthFirst, DepthFirst or Persistent. Should be specified if host pool is not personal and is not single host pool.
- Breadth first LB algorithm spreads users evenly across available session hosts.
- Depth first LB algorithm places users on a single host until the session limit is reached at which point users start being placed on the next host until the session limit is reached again.
- MaxSessionLimit: The number of sessions that a single host in the host pool can accept. Should be specified if host pool is not personal 
and is not single host pool.
- ValidationEnvironment: Validation host pools receive service updates at a faster cadence than non-validation host pools, allowing you to test service changes before they are deployed broadly to production.
- StartOnVmConnect: When enabled, stopped VMs will be automatically started when users attempt to connect.
See <a href="https://docs.microsoft.com/en-us/azure/virtual-desktop/start-virtual-machine-connect" target="_blank" rel="noopener noreferrer">this article</a> for more info.
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
Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAvd -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/avd
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

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/avd', 'PUT')) {
            Invoke-NMMApiRequest -Method 'PUT' -Path '/rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/avd' -PathValues $pathValues -QueryValues $queryValues -Body $InputObject -BodyWasBound:$PSBoundParameters.ContainsKey('InputObject') -Connection $Connection
        }
    }
}
