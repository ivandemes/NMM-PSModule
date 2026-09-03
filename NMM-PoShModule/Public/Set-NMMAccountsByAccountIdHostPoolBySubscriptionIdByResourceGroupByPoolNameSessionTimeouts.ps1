function Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameSessionTimeouts {
    <#
.SYNOPSIS
Set the host pool session timeouts
.DESCRIPTION
## Notes
- *fresetBroken*: 1 for log off, instead of disconnecting, ACTIVE and IDLE sessions; 0 otherwise; *null* for "not configured" option.
- *maxIdleTime*: disconnect IDLE sessions after *maxIdleTime* minutes; *null* for "not configured" option.
- *maxConnectionTime*: disconnect ACTIVE sessions after *maxConnectionTime* minutes; *null* for "not configured" option.
- *maxDisconnectionTime*: log off DISCONNECTED sessions after *maxDisconnectionTime* minutes; *null* for "not configured" option.
- *remoteAppLogoffTimeLimit*: 0 log off EMPTY REMOTEAPP sessions after *remoteAppLogoffTimeLimit* minutes; *null* for "not configured" option. Use for RemoteApp pools only.
- *applyToHostsParams*: nullable
- *taskParallelism*: need to be at least 1.
- *countFailedTaskToStopWork*: need to be at least 1.
- *minutesBeforeRemove*: leave it *null*.
- *message*: leave it *null*.
- *restartVms*: restart VMs or not.
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
Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameSessionTimeouts -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/session-timeouts
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

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/session-timeouts', 'PUT')) {
            Invoke-NMMApiRequest -Method 'PUT' -Path '/rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/session-timeouts' -PathValues $pathValues -QueryValues $queryValues -Body $InputObject -BodyWasBound:$PSBoundParameters.ContainsKey('InputObject') -Connection $Connection
        }
    }
}
