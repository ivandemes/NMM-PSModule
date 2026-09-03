function New-NMMAccountprovisioningConnectToExistingAd {
    <#
.SYNOPSIS
Step 3: Start Connect to existing AD step (add job).
.DESCRIPTION
## Notes
Use **/rest-api/v1/accountprovisioning/createNewAzureAdds** instead for creating new Azure AD DS.
            
- AccountId: account ID.
- DomainName: the name of your existing Active Directory domain.
- DomainAdminUsername: the username in UPN or DOMAIN\Username format, that has permissions to join VMs to the AD domain.
- DomainAdminPassword: the password of the Domain admin account.
- ActiveDirectoryType: Active Directory (AD) or Azure AD DS (AzureADDS).
- OuPath: a path in Distinguished Name (DN) format, to the OU where you want AVD host AD computer objects to be created. Leaving this field blank will place the computer objects in the default Computers container in AD.
.PARAMETER InputObject
The JSON request body. Objects and hashtables are serialized automatically.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
New-NMMAccountprovisioningConnectToExistingAd -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accountprovisioning/connectToExistingAd
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

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/accountprovisioning/connectToExistingAd', 'POST')) {
            Invoke-NMMApiRequest -Method 'POST' -Path '/rest-api/v1/accountprovisioning/connectToExistingAd' -PathValues $pathValues -QueryValues $queryValues -Body $InputObject -BodyWasBound:$PSBoundParameters.ContainsKey('InputObject') -Connection $Connection
        }
    }
}
