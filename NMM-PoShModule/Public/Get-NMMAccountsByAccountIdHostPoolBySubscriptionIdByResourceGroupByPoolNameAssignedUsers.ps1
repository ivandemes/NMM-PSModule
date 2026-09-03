function Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAssignedUsers {
    <#
.SYNOPSIS
List of users assigned to the pool
.DESCRIPTION
Returns users assigned to the host pool, including direct assignments and, optionally, users resolved from assigned groups.
Direct users are returned once with `GroupName = null`.
When `includeGroupAssignments` is `true`, group members are returned once for each assigned group they belong to,
and `GroupName` contains the corresponding group display name.
A user who is both directly assigned and assigned through one or more groups can appear multiple times.
.PARAMETER SubscriptionId
No additional description is provided by the API specification.
.PARAMETER ResourceGroup
No additional description is provided by the API specification.
.PARAMETER PoolName
No additional description is provided by the API specification.
.PARAMETER IncludeGroupAssignments
No additional description is provided by the API specification.
.PARAMETER AccountId
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAssignedUsers -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/assigned-users
#>
    [CmdletBinding(SupportsShouldProcess = $false)]
    param(
        [Parameter(Mandatory = $true)]
        [string] $SubscriptionId,

        [Parameter(Mandatory = $true)]
        [string] $ResourceGroup,

        [Parameter(Mandatory = $true)]
        [string] $PoolName,

        [Parameter(Mandatory = $false)]
        [bool] $IncludeGroupAssignments,

        [Parameter(Mandatory = $true)]
        [string] $AccountId,

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
        if ($PSBoundParameters.ContainsKey('IncludeGroupAssignments')) { $queryValues['includeGroupAssignments'] = $IncludeGroupAssignments }
        Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/assigned-users' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
    }
}
