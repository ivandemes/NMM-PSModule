function New-NMMAccountprovisioningLinkNetwork {
    <#
.SYNOPSIS
Step 2: Start Azure configuration step (add job)
.DESCRIPTION
## Notes
- AccountId: account ID.
- RegionName: Azure region (location) where you'd like to begin your initial deployment.
- ExistingResourceGroupName: this resource group will be used for the initial deployment of all resources. Specify null for creating a new resource group.
- NewResourceGroupName: this resource group will be used for the initial deployment of all resources. Specify null for using existing resource group.
- ExistingNetwork: specify an existing network if you're using an existing Active Directory or Azure AD DS environment. Specify null for creating a new network.
- NewNetwork: specify to create a new network if you are deploying a greenfield environment with new Azure AD DS or Azure AD. Specify null for using existing network.
.PARAMETER InputObject
The JSON request body. Objects and hashtables are serialized automatically.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
New-NMMAccountprovisioningLinkNetwork -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accountprovisioning/linkNetwork
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

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/accountprovisioning/linkNetwork', 'POST')) {
            Invoke-NMMApiRequest -Method 'POST' -Path '/rest-api/v1/accountprovisioning/linkNetwork' -PathValues $pathValues -QueryValues $queryValues -Body $InputObject -BodyWasBound:$PSBoundParameters.ContainsKey('InputObject') -Connection $Connection
        }
    }
}
