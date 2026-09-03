function New-NMMAccountprovisioningCreateNewAzureAdds {
    <#
.SYNOPSIS
Step 3: Start Create new Azure AD DS step (add job)
.DESCRIPTION
## Notes
Use **/rest-api/v1/accountprovisioning/connectToExistingAd** instead for connecting to existing AD.
            
- AccountId: account ID.
- DomainName: the name for new domain. The DNS domain name can only include letters, numbers, periods, and hyphens. The DNS domain name must include at least two segments, and the first segment cannot be all numbers. The prefix of the DNS domain name must contain 15 or fewer characters. Each segment of the DNS domain name must start with a letter or number.
- DomainAdminUsername: username cannot contain special characters \/"[]:|<>+=;,?*@& or end with a dot. Usernames must not include reserved words. The value must be between 1 and 20 characters long.
- DomainAdminPassword: passwords must not include reserved words or unsupported characters. The value must be between 14 and 123 characters long. Password must have 3 of the following: 1 lower case character, 1 upper case character, 1 number, and 1 special character.
- IsCustomDomain: (optional) indicates that the DomainName is not one of the validated domains
- DomainServicesSubnet: (optional) Entra Domain Services subnet
    - Name: Subnet name
    - AddressPrefix: Subnet address prefix
.PARAMETER InputObject
The JSON request body. Objects and hashtables are serialized automatically.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
New-NMMAccountprovisioningCreateNewAzureAdds -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accountprovisioning/createNewAzureAdds
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

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/accountprovisioning/createNewAzureAdds', 'POST')) {
            Invoke-NMMApiRequest -Method 'POST' -Path '/rest-api/v1/accountprovisioning/createNewAzureAdds' -PathValues $pathValues -QueryValues $queryValues -Body $InputObject -BodyWasBound:$PSBoundParameters.ContainsKey('InputObject') -Connection $Connection
        }
    }
}
