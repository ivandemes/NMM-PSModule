# New-NMMUamRepoPrivateWinget

## Synopsis

Create new private WinGet repository

## Syntax

~~~powershell
New-NMMUamRepoPrivateWinget [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes
- DisplayName: Friendly name for this repository within Nerdio Manager.
- LinkedResourceGroupId: ID of linked Azure resource group where the WinGet resources will be created.
- Region: Azure region where the Winget resources will be created.
- AppServicePlanId: To limit cost, re-use the App Service Plan where Nerdio Manager for MSP is being hosted. Leave empty if need to create new plan.
- StorageAccountId: ID of existing storage account. Leave empty if need to create new storage account.
- LogAnalyticsWorkspaceId: ID of existing Log Analytics Workspace. Leave empty if need to create new LAW.
- AppServicePlanName: Name of new App Service Plan to be created. Leave empty if need to re-use existing plan.
- StorageAccountName: Name of new storage account to be created. Leave empty if need to re-use existing storage account.
- LogAnalyticsWorkspaceName: Name of new Log Analytics Workspace to be created. Leave empty if need to re-use existing LAW.
- KeyVaultName: Name of new Key Vault to be created.
- Cosmos account: Name of new Cosmos account to be created.
- WebAppName: Name of new Web application to be created.
- AppInsightsName: Name of new Application Insights to be created.

## API operation

POST /rest-api/v1/uam/repo/private/winget
