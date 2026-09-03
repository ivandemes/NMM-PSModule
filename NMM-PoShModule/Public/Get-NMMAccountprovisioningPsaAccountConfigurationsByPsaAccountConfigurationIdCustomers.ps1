function Get-NMMAccountprovisioningPsaAccountConfigurationsByPsaAccountConfigurationIdCustomers {
    <#
.SYNOPSIS
Get the list of customers of a configured PSA system
.DESCRIPTION
## Notes
Returns the customers previously loaded from the PSA (Professional Services Automation) system.
Start the load with **/rest-api/v1/accountprovisioning/psaAccountConfigurations/{psaAccountConfigurationId}/customers/refresh** if the list is empty.
            
- Id: identifier of the customer in the PSA system. Provide this value as Configurations[].PsaAccountId when calling configurePsa.
- Name: display name of the customer in the PSA system.
            
- psaAccountConfigurationId: identifier of the configured PSA system (see psaAccountConfigurations endpoint).
- searchTerm: (optional) case-insensitive filter applied to the customer name.
- top: (optional) maximum number of customers to return. Must be between 1 and 10000 when specified.
.PARAMETER PsaAccountConfigurationId
No additional description is provided by the API specification.
.PARAMETER SearchTerm
No additional description is provided by the API specification.
.PARAMETER Top
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Get-NMMAccountprovisioningPsaAccountConfigurationsByPsaAccountConfigurationIdCustomers -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accountprovisioning/psaAccountConfigurations/{psaAccountConfigurationId}/customers
#>
    [CmdletBinding(SupportsShouldProcess = $false)]
    param(
        [Parameter(Mandatory = $true)]
        [int] $PsaAccountConfigurationId,

        [Parameter(Mandatory = $false)]
        [string] $SearchTerm,

        [Parameter(Mandatory = $false)]
        [ValidateRange(1, 10000)]
        [int] $Top,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['psaAccountConfigurationId'] = $PsaAccountConfigurationId
        $queryValues = @{}
        if ($PSBoundParameters.ContainsKey('SearchTerm')) { $queryValues['searchTerm'] = $SearchTerm }
        if ($PSBoundParameters.ContainsKey('Top')) { $queryValues['top'] = $Top }
        Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/accountprovisioning/psaAccountConfigurations/{psaAccountConfigurationId}/customers' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
    }
}
