function Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameActiveDirectory {
    <#
.SYNOPSIS
Set the host pool active directory
.DESCRIPTION
## Notes
- Type: "Default" option will always use the global default AD configuration of the application. 
Using one of "Predefined" global configurations will allow always using the selected one even if the default changes. 
To provide custom configuration for the hostpool select "Custom" option.
- DirectoryProfileId: ID of predefined configuration. Must be specified if Type = Predefined, otherwise is ignored.
- Custom: Custom configuration. Must be specified if Type = Custom, otherwise is ignored.
- AdIdentityType: Select AD, Azure AD or Azure AD DS. 
**NB!** It is not possible to change type from or to Azure AD.
- Credentials: Must be specified if AdIdentityType != AzureAD, otherwise is ignored.
- Domain: The Active Directory domain for session host VMs to join.Must use FQDN format.
- Username: The admin user in FQDN format with permissions to create computer objects in OU specified below and ability to disable these AD computer objects when the VM leaves the AD domain
- OrganizationUnit: The OU in Distinguished Name (DN) format. This will be the OU where all session host VMs and Desktop Images AD computer objects will be created by default. 
Leaving this field blank will place all computer objects in the Computers AD container
- AzureADProfile: Must be specified if AdIdentityType = AzureAD, otherwise is ignored.
- AdJoinWaitingTimeInMinutes: (for AD only) wait for AD and AAD devices synchronization
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
Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameActiveDirectory -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/active-directory
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

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/active-directory', 'PUT')) {
            Invoke-NMMApiRequest -Method 'PUT' -Path '/rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/active-directory' -PathValues $pathValues -QueryValues $queryValues -Body $InputObject -BodyWasBound:$PSBoundParameters.ContainsKey('InputObject') -Connection $Connection
        }
    }
}
