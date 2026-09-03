# Get-NMMAccountprovisioningPsaAccountConfigurations

## Synopsis

Get the list of configured PSA (Professional Services Automation) systems

## Syntax

~~~powershell
Get-NMMAccountprovisioningPsaAccountConfigurations [-Filter <object>] [-Connection <psobject>]
~~~

## Description

## Notes
Use this endpoint to discover the PSA systems that can be mapped in **/rest-api/v1/accountprovisioning/configurePsa**.
            
- PsaAccountConfigurationId: identifier of the configured PSA system. Provide this value as Configurations[].PsaAccountConfigurationId when calling configurePsa.
- DisplayName: display name of the configured PSA system.
- SystemType: type of the PSA system - Halo, Autotask or Connectwise.
- IsCredentialsConfigurationInvalid: when true, the PSA system's credentials are invalid and it cannot be mapped to an account until they are re-validated. Only configure a system with Enabled = true when this is false.

## API operation

GET /rest-api/v1/accountprovisioning/psaAccountConfigurations
