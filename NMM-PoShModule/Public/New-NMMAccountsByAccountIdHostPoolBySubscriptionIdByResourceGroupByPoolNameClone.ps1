function New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameClone {
    <#
.SYNOPSIS
Clone chosen host pool.
.DESCRIPTION
## Notes
- WorkspaceId: This is a container for host pools and session hosts that provides desktops and RemoteApps to users. Go to Workspaces section and choose one. In case if there is no
workspaces - create a new one.
- Name: Name of new host pool.
- CopyAssignments: If true users will be assigned to the same app groups in cloned host pool.
- CopyAutoscaleSettings: If true created host pool will have exactly the same autoscale pool configuration as the source.
- Prefix: Need to be specified in case of CopyAutoscaleSettings = true. Cannot be the same as any existing host pools. 
Pattern characters must be enclosed in {} and can be # (for sequential numbers) and/or ? (for random alphanumeric characters). One # implies numbers from 0 to 9, two #s implies numbers of 0 to 99, etc.
Example 1: AVDHOST{###} (AVDHOST000..AVDHOST999). 
Example 2: AVDHOST-{???} (AVDHOST-d83, AVDHOST-7sl, etc.).
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
New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameClone -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/clone
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [string] $SubscriptionId,

        [Parameter(Mandatory = $true)]
        [string] $ResourceGroup,

        [Parameter(Mandatory = $true)]
        [string] $PoolName,

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
        $pathValues['poolName'] = $PoolName
        $pathValues['accountId'] = $AccountId
        $queryValues = @{}

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/clone', 'POST')) {
            Invoke-NMMApiRequest -Method 'POST' -Path '/rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/clone' -PathValues $pathValues -QueryValues $queryValues -Body $InputObject -BodyWasBound:$PSBoundParameters.ContainsKey('InputObject') -Connection $Connection
        }
    }
}
