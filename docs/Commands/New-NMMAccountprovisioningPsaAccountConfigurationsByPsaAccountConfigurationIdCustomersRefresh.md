# New-NMMAccountprovisioningPsaAccountConfigurationsByPsaAccountConfigurationIdCustomersRefresh

## Synopsis

Start loading the customers of a configured PSA system (add job)

## Syntax

~~~powershell
New-NMMAccountprovisioningPsaAccountConfigurationsByPsaAccountConfigurationIdCustomersRefresh -PsaAccountConfigurationId <integer> [-Connection <psobject>]
~~~

## Description

## Notes
Triggers a background job that loads the list of customers from the PSA (Professional Services Automation) system into Nerdio Manager.
The loaded customers are required to obtain the PsaAccountId used in **/rest-api/v1/accountprovisioning/configurePsa**.
            
If a loading job is already in progress for this PSA system, the existing job is returned (a new one is not started).
Poll **/rest-api/v1/accountprovisioning/psaAccountConfigurations/{psaAccountConfigurationId}/customers/loading-state** to track progress,
then read the customers from **/rest-api/v1/accountprovisioning/psaAccountConfigurations/{psaAccountConfigurationId}/customers**.
            
- psaAccountConfigurationId: identifier of the configured PSA system (see psaAccountConfigurations endpoint).

## API operation

POST /rest-api/v1/accountprovisioning/psaAccountConfigurations/{psaAccountConfigurationId}/customers/refresh
