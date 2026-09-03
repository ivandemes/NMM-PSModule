# New-NMMAccountprovisioningConfigurePsa

## Synopsis

Step 5: Start Configure PSA account mapping step (add job)

## Syntax

~~~powershell
New-NMMAccountprovisioningConfigurePsa [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes
Map this account to a customer in one or more configured PSA (Professional Services Automation) systems.
Use **/rest-api/v1/accountprovisioning/psaAccountConfigurations** to get the list of available PSA systems and their identifiers.
            
- AccountId: account ID.
- Configurations: list of PSA account mappings. Specify an entry for each PSA system you want to enable or disable for this account.
    - PsaAccountConfigurationId: identifier of the configured PSA system (see psaAccountConfigurations endpoint).
    - Enabled: indicates whether this account is mapped to the PSA system.
    - PsaAccountId: identifier of the customer in the PSA system. Required when Enabled is true. Specify null to disable the mapping.

## API operation

POST /rest-api/v1/accountprovisioning/configurePsa
