# New-NMMAccountprovisioningLinkNetwork

## Synopsis

Step 2: Start Azure configuration step (add job)

## Syntax

~~~powershell
New-NMMAccountprovisioningLinkNetwork [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes
- AccountId: account ID.
- RegionName: Azure region (location) where you'd like to begin your initial deployment.
- ExistingResourceGroupName: this resource group will be used for the initial deployment of all resources. Specify null for creating a new resource group.
- NewResourceGroupName: this resource group will be used for the initial deployment of all resources. Specify null for using existing resource group.
- ExistingNetwork: specify an existing network if you're using an existing Active Directory or Azure AD DS environment. Specify null for creating a new network.
- NewNetwork: specify to create a new network if you are deploying a greenfield environment with new Azure AD DS or Azure AD. Specify null for using existing network.

## API operation

POST /rest-api/v1/accountprovisioning/linkNetwork
