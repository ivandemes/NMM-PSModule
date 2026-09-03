# Get-NMMAccountprovisioningPsaAccountConfigurationsByPsaAccountConfigurationIdCustomersLoadingState

## Synopsis

Get the loading state of a configured PSA system's customers

## Syntax

~~~powershell
Get-NMMAccountprovisioningPsaAccountConfigurationsByPsaAccountConfigurationIdCustomersLoadingState -PsaAccountConfigurationId <integer> [-Connection <psobject>]
~~~

## Description

## Notes
Use this endpoint to track the progress of the customers loading job started with
**/rest-api/v1/accountprovisioning/psaAccountConfigurations/{psaAccountConfigurationId}/customers/refresh**.
            
- IsLoading: indicates whether a customers loading job is currently in progress. Once it becomes false, the customers list is ready.
- LoadedCount / TotalCount: progress of the loading job. Available while IsLoading is true.
- LoadedUtc: UTC date and time when the customers cache was last successfully populated.
            
- psaAccountConfigurationId: identifier of the configured PSA system (see psaAccountConfigurations endpoint).

## API operation

GET /rest-api/v1/accountprovisioning/psaAccountConfigurations/{psaAccountConfigurationId}/customers/loading-state
