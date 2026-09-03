function Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameFslogix {
    <#
.SYNOPSIS
Set the host pool FSLogix config
.DESCRIPTION
## Notes
- *FsLogixConfiguration*: Choose FSLogix configuration profile to be used when creating or re-imaging hosts within this host pool.
- Type: Can be Default = 0, Predefined = 1, Custom = 2, Disabled = 3.
- PredefinedConfigId: Must be specified in case if Type = Predefined. You can get config id from separate request FSLogix configs.
- AppSettings: List of string. FSLogix App Services settings that are not specific to profile or ODFC containers or Cloud Cache.
- CloudCacheSettings: List of string. Global Cloud Cache settings.
- ProfilesPaths: List of strings. Must be specified in case if Type = Custom. Specify the FSLogix storage location by selecting Azure Files share or type in a UNC path.
- RegistryOptions: Must be specified in case if Type = Custom. Specify FSLogix configuration that will be applied when a session host VM is provisioned and FSLogix is installed.
These settings can be set globally or per host pool.
- ODFCPaths: List of strings. Can be specified in case if Type = Custom. Specify the FSLogix storage location by selecting Azure Files share or type in a UNC path.
- ODFCRegistryOptions: Can be specified in case if Type = Custom. Specify FSLogix configuration that will be applied when a session host VM is provisioned and FSLogix is installed.
- UseCloudCache: Must be specified in case if Type = Custom. Enable FSLogix Cloud Cache.
See <a href="https://docs.microsoft.com/en-us/fslogix/cloud-cache-resiliency-availability-cncpt" target="_blank" rel="noopener noreferrer">this article</a> for more info.
- SetupRegistryForAADJoinedStorage : Must be specified in case if Type = Custom. Enable Azure AD Kerberos functionality and AAD account credentials loading.
- Version: The version of FSLogix. Specify null for the latest version.
- ExcludeNerdioAdmin: This option allows to prevent Nerdio admin's profile creation in FSLogix storage location.
- ExcludeDomainAdmin: This option allows to prevent domain admin's profile creation in FSLogix storage location.
- DomainAdminUsername: domain admin username for excluding. Specify null for using username from AD configuration.
- *ApplyToHostsParams*: Specify if you want to apply these settings to existing hosts of this pool.
- TaskParallelism: Specify the number of concurrent operations when performing this bulk action. 
Large number of concurrent operations will allow the process to complete quicker but if there is an issue with Azure many hosts may end 
up in an error state.
- CountFailedTaskToStopWork: Stop the process after this many failures. This setting can help prevent a problem on Azure from making 
all session hosts unavailable to users.
- Message: Send a message to all users on a session host before performing the operation. Session hosts will be placed into drain mode (deactivated) before 
the message is sent. Can be null.
- MinutesBeforeRemove: Number of minutes to wait after sending the message to all users and setting the host to drain mode before proceeding with the operation. 
Can be null.
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
Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameFslogix -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/fslogix
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

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/fslogix', 'PUT')) {
            Invoke-NMMApiRequest -Method 'PUT' -Path '/rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/fslogix' -PathValues $pathValues -QueryValues $queryValues -Body $InputObject -BodyWasBound:$PSBoundParameters.ContainsKey('InputObject') -Connection $Connection
        }
    }
}
