# Get-NMMAccountprovisioningPsaAccountConfigurationsByPsaAccountConfigurationIdCustomers

## Synopsis

Get the list of customers of a configured PSA system

## Syntax

~~~powershell
Get-NMMAccountprovisioningPsaAccountConfigurationsByPsaAccountConfigurationIdCustomers -PsaAccountConfigurationId <integer> [-SearchTerm <string>] [-Top <integer>] [-Connection <psobject>]
~~~

## Description

## Notes
Returns the customers previously loaded from the PSA (Professional Services Automation) system.
Start the load with **/rest-api/v1/accountprovisioning/psaAccountConfigurations/{psaAccountConfigurationId}/customers/refresh** if the list is empty.
            
- Id: identifier of the customer in the PSA system. Provide this value as Configurations[].PsaAccountId when calling configurePsa.
- Name: display name of the customer in the PSA system.
            
- psaAccountConfigurationId: identifier of the configured PSA system (see psaAccountConfigurations endpoint).
- searchTerm: (optional) case-insensitive filter applied to the customer name.
- top: (optional) maximum number of customers to return. Must be between 1 and 10000 when specified.

## API operation

GET /rest-api/v1/accountprovisioning/psaAccountConfigurations/{psaAccountConfigurationId}/customers
