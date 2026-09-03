function New-NMMAccountprovisioningLinkTenant {
    <#
.SYNOPSIS
Step 1: Execute LinkTenant provision step, sync job
.DESCRIPTION
## Notes
- SubscriptionId: ID of subscription for account resources. Is optional for Windows 365 Business Cloud PC and Endpoint Management with Intune desktop deployment models.
- AzureAccessToken: access token for Azure Resource Manager API. The token should be given for the scope https://management.azure.com/user_impersonation,
- GraphAccessToken: access token for Microsoft Graph API. The token should be given for the scope https://graph.microsoft.com/Directory.AccessAsUser.All
- CompanyName: account name for this customer's deployment. This will be listed on the Accounts page.
- ActiveDirectoryType: type of Directory configuration that you'd like to use for this account. There are four available options to choose from:
    - New Azure AD DS (NewADDS)
    - Existing Azure AD DS (ExistingADDS)
    - Existing Active Directory (ExistingAD)
    - Azure AD (AzureAD)
- LimitedAccessEnabled: enable limited access mode for a new account.
- DesktopDeploymentOptions: specify one or more desktop deployment models. There are four available options:
    - Azure Virtual Desktop (Wvd)
    - Windows 365 Enterprise Cloud PC (EndpointManagedCloudPc)
    - Windows 365 Business Cloud PC (SelfManagedCloudPc)
    - Endpoint Management with Intune (EndpointManagedWithIntune)
            
The user from whom tokens are being taken must be Global Administrator and subscription Owner.
.PARAMETER InputObject
The JSON request body. Objects and hashtables are serialized automatically.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
New-NMMAccountprovisioningLinkTenant -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accountprovisioning/linkTenant
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $false, ValueFromPipeline = $true)]
        [AllowNull()]
        [object] $InputObject,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}

        $queryValues = @{}

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/accountprovisioning/linkTenant', 'POST')) {
            Invoke-NMMApiRequest -Method 'POST' -Path '/rest-api/v1/accountprovisioning/linkTenant' -PathValues $pathValues -QueryValues $queryValues -Body $InputObject -BodyWasBound:$PSBoundParameters.ContainsKey('InputObject') -Connection $Connection
        }
    }
}
