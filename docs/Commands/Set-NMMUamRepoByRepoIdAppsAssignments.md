# Set-NMMUamRepoByRepoIdAppsAssignments

## Synopsis

Update assignments of specific app.

## Syntax

~~~powershell
Set-NMMUamRepoByRepoIdAppsAssignments -RepoId <integer> [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes
- RepoId: ID of repo where apps is stored.
- ExternalId: ID of app to update assignment of.
- AccountAssignments: list of objects referring to accounts to assign app to.
- AccountAssignments[i].AccountId: account ID.
- AccountAssignments[i].KeepInSync: defines how app will be copied to account tenant - automatically or manually. Only for Intune Windows apps. 
- AccountAssignments[i].DirectAssignments: Direct assignments to customer tenant objects. Only for Intune Windows apps.
- AccountAssignments[i].DirectAssignments.RequiredAssignments: assignments for Required intent.
- AccountAssignments[i].DirectAssignments.AvailableAssignment: assignments for Available intent.
- AccountAssignments[i].DirectAssignments.UninstalAssignment: assignments for Uninstall intent.
- AccountAssignments[i].DirectAssignments.Assignment.IncludeAllUsers: setups "All users" Intune assignment.
- AccountAssignments[i].DirectAssignments.<...>Assignment.IncludeAllDevices: setups "All devices" Intune assignment.
- AccountAssignments[i].DirectAssignments.<...>Assignment.Filter: additional filter for Intune assignments.
- AccountAssignments[i].DirectAssignments.<...>Assignment.Filter.Type: type of filter. One of: None, Include, Exclude.
- AccountAssignments[i].DirectAssignments.<...>Assignment.Filter.FilterNMMId: NMM Assignment Filter ID.
- AllAccountsAssignment: defines whether to assign app to all accounts. Application will be automatically assigned to new accounts with Intune enabled.
- AllAccountsAssignment.Assigned: enabled assignment to all accounts.
- AllAccountsAssignment.KeepInSync: defines how app will be copied to account tenants - automatically or manually. Only for Intune Windows apps. 
- AllAccountsAssignment.DirectAssignments: Direct assignments to customer tenant objects. Only for Intune Windows apps. The same structure as for individual accounts.
- DeleteRelatedIntuneApps: Delete Intune apps from unassigned accounts. Only for Intune Windows apps.
- ForceRepublishIntuneApps: Republish app to customer tenants (if Manual sync type is selected in direct assignments). Only for Intune Windows apps.
Returns list of apps created in target accounts. This is for IOS app assignments only. For Android and Windows apps, there is always background job created, so 'payload' will be null. For WinGet apps, we don't create any additional apps at Account level, so payload will be an empty list.

## API operation

PUT /rest-api/v1/uam/repo/{repoId}/apps/assignments
