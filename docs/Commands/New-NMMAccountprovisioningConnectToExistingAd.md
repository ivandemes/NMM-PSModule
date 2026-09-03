# New-NMMAccountprovisioningConnectToExistingAd

## Synopsis

Step 3: Start Connect to existing AD step (add job).

## Syntax

~~~powershell
New-NMMAccountprovisioningConnectToExistingAd [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes
Use **/rest-api/v1/accountprovisioning/createNewAzureAdds** instead for creating new Azure AD DS.
            
- AccountId: account ID.
- DomainName: the name of your existing Active Directory domain.
- DomainAdminUsername: the username in UPN or DOMAIN\Username format, that has permissions to join VMs to the AD domain.
- DomainAdminPassword: the password of the Domain admin account.
- ActiveDirectoryType: Active Directory (AD) or Azure AD DS (AzureADDS).
- OuPath: a path in Distinguished Name (DN) format, to the OU where you want AVD host AD computer objects to be created. Leaving this field blank will place the computer objects in the default Computers container in AD.

## API operation

POST /rest-api/v1/accountprovisioning/connectToExistingAd
