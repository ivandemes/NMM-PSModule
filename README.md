# NMM-PSModule

PowerShell 7 module for the Nerdio Manager for MSP (NMM) REST API. The API commands and this reference are generated from `swagger.json`, keeping the module traceable to the API contract.

## Installation

```powershell
Import-Module ./NMM-PSModule.psd1
```

## Authentication

Connect with an existing bearer token:

```powershell
$connection = Connect-NMMApi -BaseUri 'https://example.getnerdio.com' -AccessToken $token
```

Or use Microsoft Entra client credentials:

```powershell
$secret = Read-Host 'Client secret' -AsSecureString
$connection = Connect-NMMApi -BaseUri 'https://example.getnerdio.com' `
    -TenantId $tenantId -ClientId $clientId -ClientSecret $secret -Scope $scope
```

The most recent connection becomes the module default. Use `-NoDefault` to avoid changing that state, and pass a connection explicitly with `-Connection`. Do not put literal secrets in scripts, history, or logs.

## How to read this reference

- **Required parameters** must be supplied in at least one parameter set. Commands with alternative parameter sets can have different requirements; check the displayed syntax or `Get-Help <command> -Full`.
- **Optional parameters** may be omitted. `-Connection` uses the current module connection when omitted. `-Filter` is client-side and accepts a script block or a single string expression.
- `-InputObject` supplies a request body as a hashtable, object, or JSON string. Its fields depend on the API operation; the linked detailed page includes specification notes when available.
- `Remove-`, `Set-`, and `Update-` examples use `-WhatIf` where supported. Remove it only after reviewing the operation.
- Standard PowerShell common parameters such as `-Verbose` and `-ErrorAction` are available but omitted below for readability.

Account objects can be piped to account-scoped commands because their `Id` property binds to `AccountId`:

```powershell
Get-NMMAccounts -Filter "name -eq 'Contoso Demo'" |
    Get-NMMAccountsByAccountIdSecureVariables
```

## Command index

### Connect commands

- [Connect-NMMApi](#connect-nmmapi) — Creates and optionally saves an authenticated NMM API connection.

### Disconnect commands

- [Disconnect-NMMApi](#disconnect-nmmapi) — Clears the module's current NMM API connection.

### Get commands

- [Get-NMMAccountprovisioningPsaAccountConfigurations](#get-nmmaccountprovisioningpsaaccountconfigurations) — Get the list of configured PSA (Professional Services Automation) systems
- [Get-NMMAccountprovisioningPsaAccountConfigurationsByPsaAccountConfigurationIdCustomers](#get-nmmaccountprovisioningpsaaccountconfigurationsbypsaaccountconfigurationidcustomers) — Get the list of customers of a configured PSA system
- [Get-NMMAccountprovisioningPsaAccountConfigurationsByPsaAccountConfigurationIdCustomersLoadingState](#get-nmmaccountprovisioningpsaaccountconfigurationsbypsaaccountconfigurationidcustomersloadingstate) — Get the loading state of a configured PSA system's customers
- [Get-NMMAccounts](#get-nmmaccounts) — Get the list of accounts
- [Get-NMMAccountsByAccountIdAutoscaleProfiles](#get-nmmaccountsbyaccountidautoscaleprofiles) — Get the list of account auto-scale profiles
- [Get-NMMAccountsByAccountIdAutoscaleProfilesByProfileId](#get-nmmaccountsbyaccountidautoscaleprofilesbyprofileid) — Get the account auto-scale profile by id
- [Get-NMMAccountsByAccountIdBackupProtectedItems](#get-nmmaccountsbyaccountidbackupprotecteditems) — Get all protected items
- [Get-NMMAccountsByAccountIdBackupRecoveryPoints](#get-nmmaccountsbyaccountidbackuprecoverypoints) — Recovery points of protected item
- [Get-NMMAccountsByAccountIdDesktopImage](#get-nmmaccountsbyaccountiddesktopimage) — Get all desktop images
- [Get-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByName](#get-nmmaccountsbyaccountiddesktopimagebysubscriptionidbyresourcegroupbyname) — Get the desktop image in detail
- [Get-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameChangeLog](#get-nmmaccountsbyaccountiddesktopimagebysubscriptionidbyresourcegroupbynamechangelog) — List changes made to this image.
- [Get-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameScheduleConfigurations](#get-nmmaccountsbyaccountiddesktopimagebysubscriptionidbyresourcegroupbynamescheduleconfigurations) — Get Desktop image job schedule configurations.
- [Get-NMMAccountsByAccountIdDirectories](#get-nmmaccountsbyaccountiddirectories) — Get the list of directories
- [Get-NMMAccountsByAccountIdEnvironmentVariables](#get-nmmaccountsbyaccountidenvironmentvariables) — Get a list of account environment variables
- [Get-NMMAccountsByAccountIdFslogix](#get-nmmaccountsbyaccountidfslogix) — Get the list of existing FSLogix configs.
- [Get-NMMAccountsByAccountIdGroupsByGroupId](#get-nmmaccountsbyaccountidgroupsbygroupid) — Get details of a group by group identifier.
- [Get-NMMAccountsByAccountIdHostPool](#get-nmmaccountsbyaccountidhostpool) — Get all host pools in the account
- [Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameActiveDirectory](#get-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnameactivedirectory) — Get the host pool active directory
- [Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAssignedUsers](#get-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnameassignedusers) — List of users assigned to the pool
- [Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAutoscaleSettings](#get-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnameautoscalesettings) — Get the host pool current autoscale settings
- [Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAvd](#get-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnameavd) — Get the host pool properties
- [Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameFslogix](#get-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnamefslogix) — Get host pool FSLogix config
- [Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHosts](#get-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnamehosts) — Get all hosts of the host pool
- [Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameScheduleConfigurations](#get-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnamehostsbyhostnamescheduleconfigurations) — Get Session host job schedule configurations.
- [Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameRdpSettings](#get-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnamerdpsettings) — Get host pool RDP settings
- [Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameScheduleConfigurations](#get-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnamescheduleconfigurations) — Get host pool job schedule configurations.
- [Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameSessions](#get-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnamesessions) — Get host pool user sessions
- [Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameSessionTimeouts](#get-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnamesessiontimeouts) — Get the host pool session timeouts
- [Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameTags](#get-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnametags) — List the host pool tags
- [Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameVmDeployment](#get-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnamevmdeployment) — Get host pool VM deployment settings.
- [Get-NMMAccountsByAccountIdInheritedVariables](#get-nmmaccountsbyaccountidinheritedvariables) — Get a list of account inherited variables
- [Get-NMMAccountsByAccountIdLocationVariables](#get-nmmaccountsbyaccountidlocationvariables) — Get a list of account location variables
- [Get-NMMAccountsByAccountIdNetworks](#get-nmmaccountsbyaccountidnetworks) — Get the list of managed networks
- [Get-NMMAccountsByAccountIdNetworksAll](#get-nmmaccountsbyaccountidnetworksall) — Get the list of all available networks
- [Get-NMMAccountsByAccountIdRecoveryVault](#get-nmmaccountsbyaccountidrecoveryvault) — Get managed (linked) vaults
- [Get-NMMAccountsByAccountIdRecoveryVaultAllvaults](#get-nmmaccountsbyaccountidrecoveryvaultallvaults) — Get all vaults
- [Get-NMMAccountsByAccountIdRecoveryVaultPolicies](#get-nmmaccountsbyaccountidrecoveryvaultpolicies) — Get all policies in the vault
- [Get-NMMAccountsByAccountIdRecoveryVaultPolicy](#get-nmmaccountsbyaccountidrecoveryvaultpolicy) — Get full policy data
- [Get-NMMAccountsByAccountIdRecoveryVaultRegionpolicyinfoByRegion](#get-nmmaccountsbyaccountidrecoveryvaultregionpolicyinfobyregion) — Get information about region protection by policies
- [Get-NMMAccountsByAccountIdRecoveryVaultRegionpolicyinfoBySubscriptionIdByRegion](#get-nmmaccountsbyaccountidrecoveryvaultregionpolicyinfobysubscriptionidbyregion) — Get information about region protection by policies
- [Get-NMMAccountsByAccountIdReservations](#get-nmmaccountsbyaccountidreservations) — Get all local reservations
- [Get-NMMAccountsByAccountIdReservationsByReservationId](#get-nmmaccountsbyaccountidreservationsbyreservationid) — Get reservation by id
- [Get-NMMAccountsByAccountIdReservationsByReservationIdResources](#get-nmmaccountsbyaccountidreservationsbyreservationidresources) — Get resource names associated to reservation
- [Get-NMMAccountsByAccountIdReservedInstancesReservationDetails](#get-nmmaccountsbyaccountidreservedinstancesreservationdetails) — Get all reservations from Azure
- [Get-NMMAccountsByAccountIdReservedInstancesReservationDetailsByOrderId](#get-nmmaccountsbyaccountidreservedinstancesreservationdetailsbyorderid) — Get reservations from Azure by order id
- [Get-NMMAccountsByAccountIdReservedInstancesReservationRecommendations](#get-nmmaccountsbyaccountidreservedinstancesreservationrecommendations) — Get recommendations for purchasing reserved instances
- [Get-NMMAccountsByAccountIdResourceGroup](#get-nmmaccountsbyaccountidresourcegroup) — Get the list of managed resource groups
- [Get-NMMAccountsByAccountIdSchedules](#get-nmmaccountsbyaccountidschedules) — Get the list of account schedule profiles
- [Get-NMMAccountsByAccountIdSchedulesByScheduleId](#get-nmmaccountsbyaccountidschedulesbyscheduleid) — Get the account schedule profile by id
- [Get-NMMAccountsByAccountIdSchedulesByScheduleIdConfigurations](#get-nmmaccountsbyaccountidschedulesbyscheduleidconfigurations) — Get the list of related schedule configurations by account schedule profile id
- [Get-NMMAccountsByAccountIdScriptedActions](#get-nmmaccountsbyaccountidscriptedactions) — Get the list of account scripted actions.
- [Get-NMMAccountsByAccountIdScriptedActionsByScriptedActionIdScheduleConfigurations](#get-nmmaccountsbyaccountidscriptedactionsbyscriptedactionidscheduleconfigurations) — Get Azure runbook account scripted action schedule configurations.
- [Get-NMMAccountsByAccountIdSecureScoresRecommendedActions](#get-nmmaccountsbyaccountidsecurescoresrecommendedactions) — No additional description is provided by the API specification.
- [Get-NMMAccountsByAccountIdSecureScoresTotalByCategory](#get-nmmaccountsbyaccountidsecurescorestotalbycategory) — No additional description is provided by the API specification.
- [Get-NMMAccountsByAccountIdSecureVariables](#get-nmmaccountsbyaccountidsecurevariables) — Get a list of account secure variables
- [Get-NMMAccountsByAccountIdStorageAzureFilesBySubscriptionIdByResourceGroupByStorageAccountNameByShareNameAutoScale](#get-nmmaccountsbyaccountidstorageazurefilesbysubscriptionidbyresourcegroupbystorageaccountnamebysharenameautoscale) — Get Azure Files autoscale
- [Get-NMMAccountsByAccountIdUamAppGroup](#get-nmmaccountsbyaccountiduamappgroup) — Get app groups.
- [Get-NMMAccountsByAccountIdUamAppGroupById](#get-nmmaccountsbyaccountiduamappgroupbyid) — Get app group by ID.
- [Get-NMMAccountsByAccountIdUamApps](#get-nmmaccountsbyaccountiduamapps) — Get applications available in certain account.
- [Get-NMMAccountsByAccountIdUamPolicy](#get-nmmaccountsbyaccountiduampolicy) — Get app deployment policies.
- [Get-NMMAccountsByAccountIdUamPolicyById](#get-nmmaccountsbyaccountiduampolicybyid) — Get app deployment policy by ID.
- [Get-NMMAccountsByAccountIdUamPolicyByIdState](#get-nmmaccountsbyaccountiduampolicybyidstate) — Get app deployment policy execution details.
- [Get-NMMAccountsByAccountIdUamRepo](#get-nmmaccountsbyaccountiduamrepo) — Get list of repos managed at Account level.
- [Get-NMMAccountsByAccountIdUamRepoById](#get-nmmaccountsbyaccountiduamrepobyid) — Get Account level repo by ID.
- [Get-NMMAccountsByAccountIdUamRepoByRepoIdAppsExtensions](#get-nmmaccountsbyaccountiduamrepobyrepoidappsextensions) — Get application extensions.
Extensions include app detection and auto-import configuration.
- [Get-NMMAccountsByAccountIdUamRepoPrivateByRepoId](#get-nmmaccountsbyaccountiduamrepoprivatebyrepoid) — List IDs of all apps stored in private repo.
- [Get-NMMAccountsByAccountIdUamRepoPrivateOrphan](#get-nmmaccountsbyaccountiduamrepoprivateorphan) — List linkable private winget repositories
- [Get-NMMAccountsByAccountIdUamRepoPrivateShellApps](#get-nmmaccountsbyaccountiduamrepoprivateshellapps) — List account Shell apps.
- [Get-NMMAccountsByAccountIdUamRepoWingetByRepoIdAppsMetadata](#get-nmmaccountsbyaccountiduamrepowingetbyrepoidappsmetadata) — Get metadata of WinGet application.
- [Get-NMMAccountsByAccountIdUsages](#get-nmmaccountsbyaccountidusages) — Get usages
- [Get-NMMAccountsByAccountIdUsersByUserId](#get-nmmaccountsbyaccountidusersbyuserid) — Get details of a user by user identifier.
- [Get-NMMAccountsByAccountIdUsersMfaStatusByUserId](#get-nmmaccountsbyaccountidusersmfastatusbyuserid) — Get details of user MFA registration and per-user MFA state .
- [Get-NMMAccountsByAccountIdWorkspace](#get-nmmaccountsbyaccountidworkspace) — Get the list of available workspaces
- [Get-NMMAccountsByAccountIdWorkspaceBySubscriptionIdByResourceGroupByWorkspaceNameSessions](#get-nmmaccountsbyaccountidworkspacebysubscriptionidbyresourcegroupbyworkspacenamesessions) — Get workspace user sessions
- [Get-NMMAppRoleAssignments](#get-nmmapproleassignments) — Get the list of assigned principals.
- [Get-NMMAppRoleAssignmentsRoles](#get-nmmapproleassignmentsroles) — Get the list of app roles.
- [Get-NMMAutoscaleProfiles](#get-nmmautoscaleprofiles) — Get the list of global auto-scale profiles
- [Get-NMMAutoscaleProfilesByProfileId](#get-nmmautoscaleprofilesbyprofileid) — Get the global auto-scale profile by id
- [Get-NMMCostestimatorById](#get-nmmcostestimatorbyid) — Get the saved estimate by id
- [Get-NMMCostestimatorList](#get-nmmcostestimatorlist) — Get the list of saved estimates
- [Get-NMMDirectories](#get-nmmdirectories) — Get the list of directories
- [Get-NMMEnvironmentVariables](#get-nmmenvironmentvariables) — Get a list of msp environment variables
- [Get-NMMHealthStatus](#get-nmmhealthstatus) — A basic health check
- [Get-NMMInheritedVariables](#get-nmminheritedvariables) — Get a list of msp inherited variables
- [Get-NMMInvoices](#get-nmminvoices) — Get the list of invoices.
- [Get-NMMInvoicesById](#get-nmminvoicesbyid) — Get invoice details.
- [Get-NMMJobByJobId](#get-nmmjobbyjobid) — Get job information by id
- [Get-NMMJobByJobIdTasks](#get-nmmjobbyjobidtasks) — Get all tasks of job by jobId
- [Get-NMMLocationVariables](#get-nmmlocationvariables) — Get a list of msp location variables
- [Get-NMMResourceGroup](#get-nmmresourcegroup) — Get the list of managed resource groups
- [Get-NMMSchedules](#get-nmmschedules) — Get the list of global schedule profiles
- [Get-NMMSchedulesByScheduleId](#get-nmmschedulesbyscheduleid) — Get the global schedule profile by id
- [Get-NMMSchedulesByScheduleIdConfigurations](#get-nmmschedulesbyscheduleidconfigurations) — Get the list of related schedule configurations by global schedule profile id
- [Get-NMMScriptedActions](#get-nmmscriptedactions) — Get the list of msp scripted actions.
- [Get-NMMScriptedActionsByScriptedActionIdScheduleConfigurations](#get-nmmscriptedactionsbyscriptedactionidscheduleconfigurations) — Get Azure runbook msp scripted action schedule configurations.
- [Get-NMMSecureVariables](#get-nmmsecurevariables) — Get a list of msp secure variables
- [Get-NMMTest](#get-nmmtest) — Test request
- [Get-NMMTimezones](#get-nmmtimezones) — Timezones ids
- [Get-NMMUamAppGroup](#get-nmmuamappgroup) — Get app groups.
- [Get-NMMUamAppGroupById](#get-nmmuamappgroupbyid) — Get app group by ID.
- [Get-NMMUamAppsAssignments](#get-nmmuamappsassignments) — Get list of all app assignments.
- [Get-NMMUamAppsFavorite](#get-nmmuamappsfavorite) — Get list of apps marked as favorite.
- [Get-NMMUamAppslibraryShellapps](#get-nmmuamappslibraryshellapps) — Get Shell apps from Nerdio library.
- [Get-NMMUamPolicy](#get-nmmuampolicy) — Get MSP app deployment policies.
- [Get-NMMUamPolicyById](#get-nmmuampolicybyid) — Get MSP app deployment policy by ID.
- [Get-NMMUamPolicyByPolicyIdAccountByAccountIdDeploymentState](#get-nmmuampolicybypolicyidaccountbyaccountiddeploymentstate) — Get derived policy execution details on specific account.
- [Get-NMMUamPolicyByPolicyIdDerived](#get-nmmuampolicybypolicyidderived) — Get derived account-level policies from MSP policy.
- [Get-NMMUamPolicyByPolicyIdDerivedByDerivedPolicyIdState](#get-nmmuampolicybypolicyidderivedbyderivedpolicyidstate) — Get derived policy execution details.
- [Get-NMMUamRepo](#get-nmmuamrepo) — Get list of linked MSP repositories
- [Get-NMMUamRepoById](#get-nmmuamrepobyid) — Get linked MSP repo by ID
- [Get-NMMUamRepoByRepoIdApps](#get-nmmuamrepobyrepoidapps) — Get application by ID.
- [Get-NMMUamRepoByRepoIdAppsExtensions](#get-nmmuamrepobyrepoidappsextensions) — Get application extensions.
Extensions include app detection and auto-import configuration.
- [Get-NMMUamRepoByRepoIdAppsSearch](#get-nmmuamrepobyrepoidappssearch) — Search applications in the specific repository.
- [Get-NMMUamRepoPrivateByRepoId](#get-nmmuamrepoprivatebyrepoid) — List IDs of all apps stored in private repo.
- [Get-NMMUamRepoPrivateOrphan](#get-nmmuamrepoprivateorphan) — List Msp linkable private winget repositories
- [Get-NMMUamRepoPrivateShellApps](#get-nmmuamrepoprivateshellapps) — List MSP Shell apps.
- [Get-NMMUamRepoWingetByRepoIdAppsMetadata](#get-nmmuamrepowingetbyrepoidappsmetadata) — Get metadata of WinGet application.
- [Get-NMMUsages](#get-nmmusages) — Get usages
- [Get-NMMVulnerabilities](#get-nmmvulnerabilities) — Get the list of vulnerabilities
- [Get-NMMVulnerabilitiesByIdDetails](#get-nmmvulnerabilitiesbyiddetails) — Get details for specific vulnerability.

### New commands

- [New-NMMAccountprovisioningConfigureFileStorage](#new-nmmaccountprovisioningconfigurefilestorage) — Step 4: Start Configure file storage step (add job)
- [New-NMMAccountprovisioningConfigurePsa](#new-nmmaccountprovisioningconfigurepsa) — Step 5: Start Configure PSA account mapping step (add job)
- [New-NMMAccountprovisioningConnectToExistingAd](#new-nmmaccountprovisioningconnecttoexistingad) — Step 3: Start Connect to existing AD step (add job).
- [New-NMMAccountprovisioningCreateNewAzureAdds](#new-nmmaccountprovisioningcreatenewazureadds) — Step 3: Start Create new Azure AD DS step (add job)
- [New-NMMAccountprovisioningLinkNetwork](#new-nmmaccountprovisioninglinknetwork) — Step 2: Start Azure configuration step (add job)
- [New-NMMAccountprovisioningLinkTenant](#new-nmmaccountprovisioninglinktenant) — Step 1: Execute LinkTenant provision step, sync job
- [New-NMMAccountprovisioningPsaAccountConfigurationsByPsaAccountConfigurationIdCustomersRefresh](#new-nmmaccountprovisioningpsaaccountconfigurationsbypsaaccountconfigurationidcustomersrefresh) — Start loading the customers of a configured PSA system (add job)
- [New-NMMAccountsByAccountIdAutoscaleProfiles](#new-nmmaccountsbyaccountidautoscaleprofiles) — Create the account auto-scale profile
- [New-NMMAccountsByAccountIdAutoscaleProfilesByProfileIdAssignments](#new-nmmaccountsbyaccountidautoscaleprofilesbyprofileidassignments) — Create the account auto-scale profile assignment
- [New-NMMAccountsByAccountIdBackup](#new-nmmaccountsbyaccountidbackup) — Backup now
- [New-NMMAccountsByAccountIdBackupDeleteBackupData](#new-nmmaccountsbyaccountidbackupdeletebackupdata) — Delete backup data
- [New-NMMAccountsByAccountIdBackupDisable](#new-nmmaccountsbyaccountidbackupdisable) — Disable backup
- [New-NMMAccountsByAccountIdBackupEnable](#new-nmmaccountsbyaccountidbackupenable) — Enable backup
- [New-NMMAccountsByAccountIdBackupRestore](#new-nmmaccountsbyaccountidbackuprestore) — Restores a virtual machine from a backup recovery point
- [New-NMMAccountsByAccountIdBackupValidate](#new-nmmaccountsbyaccountidbackupvalidate) — Validate recovery point
- [New-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameClone](#new-nmmaccountsbyaccountiddesktopimagebysubscriptionidbyresourcegroupbynameclone) — Clone the desktop image
- [New-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameOpenRdp](#new-nmmaccountsbyaccountiddesktopimagebysubscriptionidbyresourcegroupbynameopenrdp) — Open RDP access
- [New-NMMAccountsByAccountIdDesktopImageCreateFromLibrary](#new-nmmaccountsbyaccountiddesktopimagecreatefromlibrary) — Create the desktop image from Azure library
- [New-NMMAccountsByAccountIdDesktopImageCreateFromVm](#new-nmmaccountsbyaccountiddesktopimagecreatefromvm) — Create the desktop image from Azure VM
- [New-NMMAccountsByAccountIdGroups](#new-nmmaccountsbyaccountidgroups) — Get a list of groups for the account.
- [New-NMMAccountsByAccountIdGroupsAdd](#new-nmmaccountsbyaccountidgroupsadd) — Create a new group in Entra ID or Active Directory.
- [New-NMMAccountsByAccountIdHostPool](#new-nmmaccountsbyaccountidhostpool) — Create host pool
- [New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAllowsessions](#new-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnameallowsessions) — Activate / Deactivate all hosts in the pool
- [New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAssign](#new-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnameassign) — No additional description is provided by the API specification.
- [New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameClone](#new-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnameclone) — Clone chosen host pool.
- [New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHosts](#new-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnamehosts) — Create host
- [New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameAllowsessions](#new-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnamehostsbyhostnameallowsessions) — Activate / Deactivate host
- [New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameAssignUser](#new-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnamehostsbyhostnameassignuser) — Assign, Unassign or Reassign user to host
- [New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameMessage](#new-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnamehostsbyhostnamemessage) — Send message to all sessions for session host
- [New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameReimage](#new-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnamehostsbyhostnamereimage) — Reimage host
- [New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameRestart](#new-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnamehostsbyhostnamerestart) — Restart chosen host
- [New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameSessionBySessionIdActionDisconnect](#new-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnamehostsbyhostnamesessionbysessionidactiondisconnect) — Perform disconnect action for host pool user session
- [New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameSessionBySessionIdActionLogoff](#new-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnamehostsbyhostnamesessionbysessionidactionlogoff) — Perform logoff action for host pool user session
- [New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameSessionBySessionIdActionSendMessage](#new-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnamehostsbyhostnamesessionbysessionidactionsendmessage) — Send message for host pool user session
- [New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameStart](#new-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnamehostsbyhostnamestart) — Power on chosen host
- [New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameStop](#new-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnamehostsbyhostnamestop) — Power off chosen host
- [New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameReimage](#new-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnamereimage) — Resize or reimage all hosts in the pool
- [New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameRestartBulk](#new-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnamerestartbulk) — Restart all hosts in the pool
- [New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameRunScriptBulk](#new-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnamerunscriptbulk) — Run script on all hosts in the pool
- [New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameStartBulk](#new-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnamestartbulk) — Power on all hosts in the pool
- [New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameStopBulk](#new-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnamestopbulk) — Power off all hosts in the pool
- [New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameUnassign](#new-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnameunassign) — No additional description is provided by the API specification.
- [New-NMMAccountsByAccountIdHostPoolGenerateDescription](#new-nmmaccountsbyaccountidhostpoolgeneratedescription) — Generate description with AI
- [New-NMMAccountsByAccountIdNetworksLink](#new-nmmaccountsbyaccountidnetworkslink) — Link existing network
- [New-NMMAccountsByAccountIdRecoveryVault](#new-nmmaccountsbyaccountidrecoveryvault) — Create new vault
- [New-NMMAccountsByAccountIdRecoveryVaultAssignpoliciestoresources](#new-nmmaccountsbyaccountidrecoveryvaultassignpoliciestoresources) — Assign policies to resources.
- [New-NMMAccountsByAccountIdRecoveryVaultCreateorupdatePolicy](#new-nmmaccountsbyaccountidrecoveryvaultcreateorupdatepolicy) — Create new or update existing policy
- [New-NMMAccountsByAccountIdRecoveryVaultLinkVault](#new-nmmaccountsbyaccountidrecoveryvaultlinkvault) — Link to existing vault
- [New-NMMAccountsByAccountIdRecoveryVaultUnlinkVault](#new-nmmaccountsbyaccountidrecoveryvaultunlinkvault) — Unlink vault
- [New-NMMAccountsByAccountIdReservations](#new-nmmaccountsbyaccountidreservations) — Add new reservation
- [New-NMMAccountsByAccountIdReservedInstancesCalculate](#new-nmmaccountsbyaccountidreservedinstancescalculate) — Calculate price for placing a `ReservationOrder`
- [New-NMMAccountsByAccountIdReservedInstancesPurchase](#new-nmmaccountsbyaccountidreservedinstancespurchase) — Purchase `ReservationOrder`
- [New-NMMAccountsByAccountIdResourceGroupLinked](#new-nmmaccountsbyaccountidresourcegrouplinked) — Link Azure resource group
- [New-NMMAccountsByAccountIdSchedules](#new-nmmaccountsbyaccountidschedules) — Create the account schedule profile
- [New-NMMAccountsByAccountIdScriptedActions](#new-nmmaccountsbyaccountidscriptedactions) — Create account scripted action.
- [New-NMMAccountsByAccountIdScriptedActionsByIdExecution](#new-nmmaccountsbyaccountidscriptedactionsbyidexecution) — Run Azure runbook account scripted action in Automation account.
- [New-NMMAccountsByAccountIdSecureScoresRecommendationsByIdStatus](#new-nmmaccountsbyaccountidsecurescoresrecommendationsbyidstatus) — No additional description is provided by the API specification.
- [New-NMMAccountsByAccountIdSecureVariables](#new-nmmaccountsbyaccountidsecurevariables) — Create account secure variable
- [New-NMMAccountsByAccountIdStorageAzureFilesBySubscriptionIdByResourceGroupByStorageAccountNameByShareNameAutoScaleEnabledByIsEnabled](#new-nmmaccountsbyaccountidstorageazurefilesbysubscriptionidbyresourcegroupbystorageaccountnamebysharenameautoscaleenabledbyisenabled) — Enable or disable Azure Files autoscale
- [New-NMMAccountsByAccountIdUamAppGroup](#new-nmmaccountsbyaccountiduamappgroup) — Create app group.
- [New-NMMAccountsByAccountIdUamPolicy](#new-nmmaccountsbyaccountiduampolicy) — Create app deployment policy.
- [New-NMMAccountsByAccountIdUamPolicyGenerateDescription](#new-nmmaccountsbyaccountiduampolicygeneratedescription) — Generate description with AI.
- [New-NMMAccountsByAccountIdUamRepoByRepoIdAppsFavorite](#new-nmmaccountsbyaccountiduamrepobyrepoidappsfavorite) — Mark application as favorite.
- [New-NMMAccountsByAccountIdUamRepoPrivateShell](#new-nmmaccountsbyaccountiduamrepoprivateshell) — Create new Shell Apps repository
- [New-NMMAccountsByAccountIdUamRepoPrivateShellApps](#new-nmmaccountsbyaccountiduamrepoprivateshellapps) — Create Shell application.
- [New-NMMAccountsByAccountIdUamRepoPrivateShellLinkstorage](#new-nmmaccountsbyaccountiduamrepoprivateshelllinkstorage) — Link storage to account shell repository
- [New-NMMAccountsByAccountIdUamRepoPrivateWinget](#new-nmmaccountsbyaccountiduamrepoprivatewinget) — Create new private WinGet repository
- [New-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdApps](#new-nmmaccountsbyaccountiduamrepoprivatewingetbyrepoidapps) — Create WinGet application.
- [New-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsByPackageIdVersion](#new-nmmaccountsbyaccountiduamrepoprivatewingetbyrepoidappsbypackageidversion) — Add new version of WinGet application.
- [New-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersionInstaller](#new-nmmaccountsbyaccountiduamrepoprivatewingetbyrepoidappsbypackageidversionbyappversioninstaller) — Add installer for specific version of WinGet application.
- [New-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsImport](#new-nmmaccountsbyaccountiduamrepoprivatewingetbyrepoidappsimport) — Import application from one WinGet repo to another.
- [New-NMMAccountsByAccountIdUamRepoPrivateWingetLink](#new-nmmaccountsbyaccountiduamrepoprivatewingetlink) — Link private winget repository
- [New-NMMAccountsByAccountIdUamRepositoryPrivateByRepoIdPackageByPackageIdAutoImport](#new-nmmaccountsbyaccountiduamrepositoryprivatebyrepoidpackagebypackageidautoimport) — Setup source app to import new versions automatically.
- [New-NMMAccountsByAccountIdUamRepositoryPrivateByRepoIdPackageByPackageIdDetection](#new-nmmaccountsbyaccountiduamrepositoryprivatebyrepoidpackagebypackageiddetection) — Allow to configure custom detection rules to detect status of WinGet app deployment.
- [New-NMMAccountsByAccountIdUsers](#new-nmmaccountsbyaccountidusers) — Get a paginated list of users for the account.
- [New-NMMAccountsByAccountIdUsersAdd](#new-nmmaccountsbyaccountidusersadd) — Create a new user in Entra ID or Active directory.
- [New-NMMAccountsByAccountIdUsersInvite](#new-nmmaccountsbyaccountidusersinvite) — Invite a new user into the account as a guest user in Entra ID, and optionally send an invitation email.
- [New-NMMAccountsByAccountIdWorkspace](#new-nmmaccountsbyaccountidworkspace) — Create workspace
- [New-NMMAppRoleAssignments](#new-nmmapproleassignments) — Assign app role to principals.
- [New-NMMAutoscaleProfiles](#new-nmmautoscaleprofiles) — Create the global auto-scale profile
- [New-NMMAutoscaleProfilesByProfileIdAssignments](#new-nmmautoscaleprofilesbyprofileidassignments) — Create the global auto-scale profile assignment
- [New-NMMInheritedVariables](#new-nmminheritedvariables) — Create msp inherited variable
- [New-NMMJobRestartByJobId](#new-nmmjobrestartbyjobid) — Restart job
- [New-NMMLocationVariables](#new-nmmlocationvariables) — Create msp location variable
- [New-NMMResourceGroupLinked](#new-nmmresourcegrouplinked) — Link Azure resource group
- [New-NMMSchedules](#new-nmmschedules) — Create the global schedule profile
- [New-NMMScriptedActions](#new-nmmscriptedactions) — Create msp scripted action.
- [New-NMMScriptedActionsByIdExecution](#new-nmmscriptedactionsbyidexecution) — Run Azure runbook msp scripted action in Automation account.
- [New-NMMSecureVariables](#new-nmmsecurevariables) — Create msp secure variable
- [New-NMMUamAppGroup](#new-nmmuamappgroup) — Create app group.
- [New-NMMUamPolicy](#new-nmmuampolicy) — Create MSP app deployment policy.
- [New-NMMUamRepoByRepoIdAppsFavorite](#new-nmmuamrepobyrepoidappsfavorite) — Mark application as favorite.
- [New-NMMUamRepoLink](#new-nmmuamrepolink) — Link existing repository
- [New-NMMUamRepoPrivateAndroidApps](#new-nmmuamrepoprivateandroidapps) — Import application from Google Play Store to NMM Android apps repo.
- [New-NMMUamRepoPrivateShell](#new-nmmuamrepoprivateshell) — Create new Shell Apps repository
- [New-NMMUamRepoPrivateShellApps](#new-nmmuamrepoprivateshellapps) — Create Shell application.
- [New-NMMUamRepoPrivateShellLinkstorage](#new-nmmuamrepoprivateshelllinkstorage) — Links storage to MSP Shell Apps repository
- [New-NMMUamRepoPrivateWinget](#new-nmmuamrepoprivatewinget) — Create new private WinGet repository
- [New-NMMUamRepoPrivateWingetByRepoIdApps](#new-nmmuamrepoprivatewingetbyrepoidapps) — Create WinGet application.
- [New-NMMUamRepoPrivateWingetByRepoIdAppsByPackageIdVersion](#new-nmmuamrepoprivatewingetbyrepoidappsbypackageidversion) — Add new version of WinGet application.
- [New-NMMUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersionInstaller](#new-nmmuamrepoprivatewingetbyrepoidappsbypackageidversionbyappversioninstaller) — Add installer for specific version of WinGet application.
- [New-NMMUamRepoPrivateWingetByRepoIdAppsImport](#new-nmmuamrepoprivatewingetbyrepoidappsimport) — Import application from one WinGet repo to another
- [New-NMMUamRepoPrivateWingetLink](#new-nmmuamrepoprivatewingetlink) — Link private winget repository
- [New-NMMUamRepositoryPrivateByRepoIdPackageByPackageIdAutoImport](#new-nmmuamrepositoryprivatebyrepoidpackagebypackageidautoimport) — Setup source app to import new versions automatically.
- [New-NMMUamRepositoryPrivateByRepoIdPackageByPackageIdDetection](#new-nmmuamrepositoryprivatebyrepoidpackagebypackageiddetection) — Allow to configure custom detection rules to detect status of WinGet app deployment.

### Remove commands

- [Remove-NMMAccountsByAccountIdAutoscaleProfilesByProfileId](#remove-nmmaccountsbyaccountidautoscaleprofilesbyprofileid) — Delete the account auto-scale profile by id
- [Remove-NMMAccountsByAccountIdAutoscaleProfilesByProfileIdAssignments](#remove-nmmaccountsbyaccountidautoscaleprofilesbyprofileidassignments) — Delete the account auto-scale profile assignment
- [Remove-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByName](#remove-nmmaccountsbyaccountiddesktopimagebysubscriptionidbyresourcegroupbyname) — Delete the desktop image
- [Remove-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNamePowerOffAndSetAsImageConfiguration](#remove-nmmaccountsbyaccountiddesktopimagebysubscriptionidbyresourcegroupbynamepoweroffandsetasimageconfiguration) — Remove 'set as image' schedule configuration
- [Remove-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameScheduleConfigurationByConfigurationId](#remove-nmmaccountsbyaccountiddesktopimagebysubscriptionidbyresourcegroupbynamescheduleconfigurationbyconfigurationid) — Remove job schedule configuration by Id
- [Remove-NMMAccountsByAccountIdGroupsByGroupId](#remove-nmmaccountsbyaccountidgroupsbygroupid) — Delete a group from Entra ID or Active Directory by group identifier.
- [Remove-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolName](#remove-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolname) — Remove chosen host pool
- [Remove-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAutoScalePause](#remove-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnameautoscalepause) — Remove autoscale pause for host pool
- [Remove-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameDeleteBulk](#remove-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnamedeletebulk) — Delete all hosts in the pool
- [Remove-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostName](#remove-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnamehostsbyhostname) — Remove chosen host
- [Remove-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameScheduleConfigurationByConfigurationId](#remove-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnamehostsbyhostnamescheduleconfigurationbyconfigurationid) — Remove job schedule configuration by Id
- [Remove-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameScheduleConfigurationByConfigurationId](#remove-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnamescheduleconfigurationbyconfigurationid) — Remove job schedule configuration by Id
- [Remove-NMMAccountsByAccountIdInheritedVariables](#remove-nmmaccountsbyaccountidinheritedvariables) — Delete account inherited variable
- [Remove-NMMAccountsByAccountIdLocationVariables](#remove-nmmaccountsbyaccountidlocationvariables) — Delete account location variable
- [Remove-NMMAccountsByAccountIdRecoveryVaultPolicy](#remove-nmmaccountsbyaccountidrecoveryvaultpolicy) — Delete policy from vault
- [Remove-NMMAccountsByAccountIdReservationsByReservationId](#remove-nmmaccountsbyaccountidreservationsbyreservationid) — Delete reservation by Id
- [Remove-NMMAccountsByAccountIdResourceGroupLinked](#remove-nmmaccountsbyaccountidresourcegrouplinked) — Unlink Azure resource group
- [Remove-NMMAccountsByAccountIdSchedulesByScheduleId](#remove-nmmaccountsbyaccountidschedulesbyscheduleid) — Delete the account schedule profile by id
- [Remove-NMMAccountsByAccountIdScriptedActionsById](#remove-nmmaccountsbyaccountidscriptedactionsbyid) — Delete account scripted action.
- [Remove-NMMAccountsByAccountIdScriptedActionsByScriptedActionIdScheduleConfigurationByConfigurationId](#remove-nmmaccountsbyaccountidscriptedactionsbyscriptedactionidscheduleconfigurationbyconfigurationid) — Delete Azure runbook account scripted action schedule configuration by Id
- [Remove-NMMAccountsByAccountIdSecureVariables](#remove-nmmaccountsbyaccountidsecurevariables) — Delete account secure variable
- [Remove-NMMAccountsByAccountIdUamAppGroupById](#remove-nmmaccountsbyaccountiduamappgroupbyid) — Delete app group.
- [Remove-NMMAccountsByAccountIdUamPolicyById](#remove-nmmaccountsbyaccountiduampolicybyid) — Delete app deployment policy.
- [Remove-NMMAccountsByAccountIdUamRepoByRepoId](#remove-nmmaccountsbyaccountiduamrepobyrepoid) — Unlink repository.
- [Remove-NMMAccountsByAccountIdUamRepoByRepoIdAppsFavorite](#remove-nmmaccountsbyaccountiduamrepobyrepoidappsfavorite) — Unmark application as favorite.
- [Remove-NMMAccountsByAccountIdUamRepoPrivateByRepoIdAppsByExternalId](#remove-nmmaccountsbyaccountiduamrepoprivatebyrepoidappsbyexternalid) — Delete application from private repo.
- [Remove-NMMAccountsByAccountIdUamRepoPrivateShellAppsByAppId](#remove-nmmaccountsbyaccountiduamrepoprivateshellappsbyappid) — Delete Shell application.
- [Remove-NMMAccountsByAccountIdUamRepoPrivateShellByRepoId](#remove-nmmaccountsbyaccountiduamrepoprivateshellbyrepoid) — Delete shell repository
- [Remove-NMMAccountsByAccountIdUamRepoPrivateShellByRepoIdUnlinkstorage](#remove-nmmaccountsbyaccountiduamrepoprivateshellbyrepoidunlinkstorage) — Unlink account shell repository storage
- [Remove-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoId](#remove-nmmaccountsbyaccountiduamrepoprivatewingetbyrepoid) — Delete private winget repository
- [Remove-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersion](#remove-nmmaccountsbyaccountiduamrepoprivatewingetbyrepoidappsbypackageidversionbyappversion) — Delete version of WinGet application.
- [Remove-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersionInstallerByInstallerId](#remove-nmmaccountsbyaccountiduamrepoprivatewingetbyrepoidappsbypackageidversionbyappversioninstallerbyinstallerid) — Delete installer of specific version of WinGet application.
- [Remove-NMMAccountsByAccountIdUsersByUserId](#remove-nmmaccountsbyaccountidusersbyuserid) — Delete a user from Entra ID or Active directory by user identifier.
- [Remove-NMMAccountsByAccountIdUsersMfaRegistrationByUserId](#remove-nmmaccountsbyaccountidusersmfaregistrationbyuserid) — Reset MFA registration for user.
- [Remove-NMMAccountsByAccountIdUsersSignInSessionsByUserId](#remove-nmmaccountsbyaccountiduserssigninsessionsbyuserid) — Revoke all sign-in sessions for user.
- [Remove-NMMAppRoleAssignments](#remove-nmmapproleassignments) — Unassign app role from principals.
- [Remove-NMMAutoscaleProfilesByProfileId](#remove-nmmautoscaleprofilesbyprofileid) — Delete the global auto-scale profile by id
- [Remove-NMMAutoscaleProfilesByProfileIdAssignments](#remove-nmmautoscaleprofilesbyprofileidassignments) — Delete the global auto-scale profile assignment
- [Remove-NMMInheritedVariables](#remove-nmminheritedvariables) — Delete msp inherited variable
- [Remove-NMMLocationVariables](#remove-nmmlocationvariables) — Delete msp location variable
- [Remove-NMMResourceGroupLinked](#remove-nmmresourcegrouplinked) — Unlink Azure resource group
- [Remove-NMMSchedulesByScheduleId](#remove-nmmschedulesbyscheduleid) — Delete the global schedule profile by id
- [Remove-NMMScriptedActionsById](#remove-nmmscriptedactionsbyid) — Delete msp scripted action.
- [Remove-NMMScriptedActionsByScriptedActionIdScheduleConfigurationByConfigurationId](#remove-nmmscriptedactionsbyscriptedactionidscheduleconfigurationbyconfigurationid) — Delete Azure runbook msp scripted action schedule configuration by Id
- [Remove-NMMSecureVariables](#remove-nmmsecurevariables) — Delete msp secure variable
- [Remove-NMMUamAppGroupById](#remove-nmmuamappgroupbyid) — Delete app group.
- [Remove-NMMUamPolicyById](#remove-nmmuampolicybyid) — Delete MSP app deployment policy.
- [Remove-NMMUamRepoByRepoId](#remove-nmmuamrepobyrepoid) — Unlink repository.
- [Remove-NMMUamRepoByRepoIdAppsFavorite](#remove-nmmuamrepobyrepoidappsfavorite) — Unmark application as favorite.
- [Remove-NMMUamRepoPrivateByRepoIdAppsByExternalId](#remove-nmmuamrepoprivatebyrepoidappsbyexternalid) — Delete application from private repo.
- [Remove-NMMUamRepoPrivateShellAppsByAppId](#remove-nmmuamrepoprivateshellappsbyappid) — Delete Shell application.
- [Remove-NMMUamRepoPrivateShellByRepoId](#remove-nmmuamrepoprivateshellbyrepoid) — Delete shell repository
- [Remove-NMMUamRepoPrivateShellByRepoIdUnlinkstorage](#remove-nmmuamrepoprivateshellbyrepoidunlinkstorage) — Unlinks storage to MSP Shell Apps repository
- [Remove-NMMUamRepoPrivateWingetByRepoId](#remove-nmmuamrepoprivatewingetbyrepoid) — Delete private winget repository
- [Remove-NMMUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersion](#remove-nmmuamrepoprivatewingetbyrepoidappsbypackageidversionbyappversion) — Delete version of WinGet application.
- [Remove-NMMUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersionInstallerByInstallerId](#remove-nmmuamrepoprivatewingetbyrepoidappsbypackageidversionbyappversioninstallerbyinstallerid) — Delete installer of specific version of WinGet application.

### Set commands

- [Set-NMMAccountsByAccountIdAutoscaleProfilesByProfileId](#set-nmmaccountsbyaccountidautoscaleprofilesbyprofileid) — Update the account auto-scale profile
- [Set-NMMAccountsByAccountIdAutoscaleProfilesByProfileIdAssignments](#set-nmmaccountsbyaccountidautoscaleprofilesbyprofileidassignments) — Update an auto-scale configuration schedule
- [Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameRestart](#set-nmmaccountsbyaccountiddesktopimagebysubscriptionidbyresourcegroupbynamerestart) — Restart current desktop image
- [Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameRunScript](#set-nmmaccountsbyaccountiddesktopimagebysubscriptionidbyresourcegroupbynamerunscript) — Run scripted actions on desktop image
- [Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameScheduleRunScript](#set-nmmaccountsbyaccountiddesktopimagebysubscriptionidbyresourcegroupbynameschedulerunscript) — Run scripted actions on desktop image
- [Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameScheduleSetAsImage](#set-nmmaccountsbyaccountiddesktopimagebysubscriptionidbyresourcegroupbynameschedulesetasimage) — Power off and set as image
- [Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameScheduleStart](#set-nmmaccountsbyaccountiddesktopimagebysubscriptionidbyresourcegroupbynameschedulestart) — Power on current desktop image
- [Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameSetAsImage](#set-nmmaccountsbyaccountiddesktopimagebysubscriptionidbyresourcegroupbynamesetasimage) — Power off and set as image
- [Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameStart](#set-nmmaccountsbyaccountiddesktopimagebysubscriptionidbyresourcegroupbynamestart) — Power on current desktop image
- [Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameStop](#set-nmmaccountsbyaccountiddesktopimagebysubscriptionidbyresourcegroupbynamestop) — Power off current desktop image
- [Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameValidate](#set-nmmaccountsbyaccountiddesktopimagebysubscriptionidbyresourcegroupbynamevalidate) — Validate current desktop image
- [Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameActiveDirectory](#set-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnameactivedirectory) — Set the host pool active directory
- [Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAutoScaleEnable](#set-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnameautoscaleenable) — Enable/Disable autoscale for host pool with current configuration
- [Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAutoScalePause](#set-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnameautoscalepause) — Pause autoscale for host pool
- [Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAutoscaleSettings](#set-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnameautoscalesettings) — Update host pool current autoscale settings
- [Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAvd](#set-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnameavd) — Set the host pool properties
- [Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameCapacityExtenderProperties](#set-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnamecapacityextenderproperties) — Set host pool capacity extender properties
- [Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameDisconnect](#set-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnamedisconnect) — Disconnect all users from host pool.
- [Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameFslogix](#set-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnamefslogix) — Set the host pool FSLogix config
- [Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameRunScript](#set-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnamehostsbyhostnamerunscript) — Run scripted actions on host
- [Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameLogoff](#set-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnamelogoff) — Log off all users.
- [Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameRdpSettings](#set-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnamerdpsettings) — Set host pool RDP settings
- [Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameSendMessage](#set-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnamesendmessage) — Send message to all sessions for host pool.
- [Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameSessionTimeouts](#set-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnamesessiontimeouts) — Set the host pool session timeouts
- [Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameTags](#set-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnametags) — Update the host pool tags
- [Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameVmDeployment](#set-nmmaccountsbyaccountidhostpoolbysubscriptionidbyresourcegroupbypoolnamevmdeployment) — Set host pool VM deployment settings
- [Set-NMMAccountsByAccountIdInheritedVariables](#set-nmmaccountsbyaccountidinheritedvariables) — Set account inherited variable value
- [Set-NMMAccountsByAccountIdLocationVariables](#set-nmmaccountsbyaccountidlocationvariables) — Set account location variable value
- [Set-NMMAccountsByAccountIdReservationsByReservationId](#set-nmmaccountsbyaccountidreservationsbyreservationid) — Update existing reservation
- [Set-NMMAccountsByAccountIdResourceGroupSetDefault](#set-nmmaccountsbyaccountidresourcegroupsetdefault) — Set Azure resource group as default
- [Set-NMMAccountsByAccountIdSchedulesByScheduleId](#set-nmmaccountsbyaccountidschedulesbyscheduleid) — Update the account schedule profile
- [Set-NMMAccountsByAccountIdScriptedActionsById](#set-nmmaccountsbyaccountidscriptedactionsbyid) — Update account scripted action.
- [Set-NMMAccountsByAccountIdSecureVariables](#set-nmmaccountsbyaccountidsecurevariables) — Update account secure variable
- [Set-NMMAccountsByAccountIdStorageAzureFilesBySubscriptionIdByResourceGroupByStorageAccountNameByShareNameAutoScale](#set-nmmaccountsbyaccountidstorageazurefilesbysubscriptionidbyresourcegroupbystorageaccountnamebysharenameautoscale) — Update Azure Files autoscale
- [Set-NMMAccountsByAccountIdUamAppGroupById](#set-nmmaccountsbyaccountiduamappgroupbyid) — Update app group.
- [Set-NMMAccountsByAccountIdUamPolicyById](#set-nmmaccountsbyaccountiduampolicybyid) — Update app deployment policy.
- [Set-NMMAccountsByAccountIdUamPolicyByIdActivate](#set-nmmaccountsbyaccountiduampolicybyidactivate) — Activate app deployment policy.
- [Set-NMMAccountsByAccountIdUamPolicyByIdDeactivate](#set-nmmaccountsbyaccountiduampolicybyiddeactivate) — Deactivate app deployment policy.
- [Set-NMMAccountsByAccountIdUamPolicyByIdRun](#set-nmmaccountsbyaccountiduampolicybyidrun) — Force run app deployment policy.
- [Set-NMMAccountsByAccountIdUamRepoByRepoId](#set-nmmaccountsbyaccountiduamrepobyrepoid) — Update linked repository
- [Set-NMMAccountsByAccountIdUamRepoPrivateShellAppsByAppId](#set-nmmaccountsbyaccountiduamrepoprivateshellappsbyappid) — Update Shell application.
- [Set-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsByPackageIdUpdate](#set-nmmaccountsbyaccountiduamrepoprivatewingetbyrepoidappsbypackageidupdate) — Update WinGet application.
- [Set-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersion](#set-nmmaccountsbyaccountiduamrepoprivatewingetbyrepoidappsbypackageidversionbyappversion) — Update version of WinGet application.
- [Set-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersionInstallerByInstallerId](#set-nmmaccountsbyaccountiduamrepoprivatewingetbyrepoidappsbypackageidversionbyappversioninstallerbyinstallerid) — Update installer of specific version of WinGet application.
- [Set-NMMAccountsByAccountIdUsersPerUserMfaStateByUserId](#set-nmmaccountsbyaccountidusersperusermfastatebyuserid) — Update per-user MFA state for user.
- [Set-NMMAppRoleAssignments](#set-nmmapproleassignments) — Update app role for principal.
- [Set-NMMAutoscaleProfilesByProfileId](#set-nmmautoscaleprofilesbyprofileid) — Update the global auto-scale profile
- [Set-NMMAutoscaleProfilesByProfileIdAssignments](#set-nmmautoscaleprofilesbyprofileidassignments) — Update an auto-scale configuration schedule
- [Set-NMMInheritedVariables](#set-nmminheritedvariables) — Update msp inherited variable
- [Set-NMMLocationVariables](#set-nmmlocationvariables) — Update msp location variable
- [Set-NMMResourceGroupSetDefault](#set-nmmresourcegroupsetdefault) — Set Azure resource group as default
- [Set-NMMSchedulesByScheduleId](#set-nmmschedulesbyscheduleid) — Update the global schedule profile
- [Set-NMMScriptedActionsById](#set-nmmscriptedactionsbyid) — Update msp scripted action.
- [Set-NMMSecureVariables](#set-nmmsecurevariables) — Update msp secure variable
- [Set-NMMUamAppGroupById](#set-nmmuamappgroupbyid) — Update app group.
- [Set-NMMUamAppGroupByIdAssign](#set-nmmuamappgroupbyidassign) — Assign app group.
- [Set-NMMUamPolicyById](#set-nmmuampolicybyid) — Update MSP app deployment policy.
- [Set-NMMUamPolicyByIdActivate](#set-nmmuampolicybyidactivate) — Activate MSP app deployment policy.
- [Set-NMMUamPolicyByIdDeactivate](#set-nmmuampolicybyiddeactivate) — Deactivate MSP app deployment policy.
- [Set-NMMUamPolicyByIdRun](#set-nmmuampolicybyidrun) — Force run MSP app deployment policy.
- [Set-NMMUamRepoByRepoId](#set-nmmuamrepobyrepoid) — Update linked repository
- [Set-NMMUamRepoByRepoIdAppsAssignments](#set-nmmuamrepobyrepoidappsassignments) — Update assignments of specific app.
- [Set-NMMUamRepoPrivateShellAppsByAppId](#set-nmmuamrepoprivateshellappsbyappid) — Update Shell application.
- [Set-NMMUamRepoPrivateWingetByRepoIdAppsByPackageIdUpdate](#set-nmmuamrepoprivatewingetbyrepoidappsbypackageidupdate) — Update WinGet application.
- [Set-NMMUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersion](#set-nmmuamrepoprivatewingetbyrepoidappsbypackageidversionbyappversion) — Update version of WinGet application.
- [Set-NMMUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersionInstallerByInstallerId](#set-nmmuamrepoprivatewingetbyrepoidappsbypackageidversionbyappversioninstallerbyinstallerid) — Update installer of specific version of WinGet application.

### Update commands

- [Update-NMMAccountsByAccountIdGroupsByGroupId](#update-nmmaccountsbyaccountidgroupsbygroupid) — Update a group from Entra ID or Active Directory by group identifier.
- [Update-NMMAccountsByAccountIdUsersByUserId](#update-nmmaccountsbyaccountidusersbyuserid) — Update a user from Entra ID or Active directory by user identifier.

## Command reference

### Connect-NMMApi

Creates and optionally saves an authenticated NMM API connection.

**Syntax:**

```text

Connect-NMMApi -BaseUri <uri> -AccessToken <string> [-NoDefault] [<CommonParameters>]

Connect-NMMApi -BaseUri <uri> -ClientId <string> -ClientSecret <Object> [-TenantId <string>] [-OAuthTokenUri <uri>] [-TokenPath <string>] [-Scope <string>] [-NoDefault] [<CommonParameters>]

```

**Required parameters:** `-AccessToken <String>`, `-BaseUri <Uri>`, `-ClientId <String>`, `-ClientSecret <Object>`.

**Optional parameters:** `-NoDefault <switch>`, `-OAuthTokenUri <Uri>`, `-Scope <String>`, `-TenantId <String>`, `-TokenPath <String>`.

```powershell
Connect-NMMApi -BaseUri 'https://example.getnerdio.com' -AccessToken $token
```

### Disconnect-NMMApi

Clears the module's current NMM API connection.

**Syntax:**

```text

Disconnect-NMMApi [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Confirm <switch>`, `-WhatIf <switch>`.

```powershell
Disconnect-NMMApi
```

### Get-NMMAccountprovisioningPsaAccountConfigurations

Get the list of configured PSA (Professional Services Automation) systems

**API operation:** `GET /rest-api/v1/accountprovisioning/psaAccountConfigurations`

**Syntax:**

```text

Get-NMMAccountprovisioningPsaAccountConfigurations [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMAccountprovisioningPsaAccountConfigurations -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountprovisioningPsaAccountConfigurations.md)

### Get-NMMAccountprovisioningPsaAccountConfigurationsByPsaAccountConfigurationIdCustomers

Get the list of customers of a configured PSA system

**API operation:** `GET /rest-api/v1/accountprovisioning/psaAccountConfigurations/{psaAccountConfigurationId}/customers`

**Syntax:**

```text

Get-NMMAccountprovisioningPsaAccountConfigurationsByPsaAccountConfigurationIdCustomers [-PsaAccountConfigurationId] <int> [[-SearchTerm] <string>] [[-Top] <int>] [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-PsaAccountConfigurationId <Int32>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`, `-SearchTerm <String>`, `-Top <Int32>`.

```powershell
Get-NMMAccountprovisioningPsaAccountConfigurationsByPsaAccountConfigurationIdCustomers -PsaAccountConfigurationId '<PsaAccountConfigurationId>' -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountprovisioningPsaAccountConfigurationsByPsaAccountConfigurationIdCustomers.md)

### Get-NMMAccountprovisioningPsaAccountConfigurationsByPsaAccountConfigurationIdCustomersLoadingState

Get the loading state of a configured PSA system's customers

**API operation:** `GET /rest-api/v1/accountprovisioning/psaAccountConfigurations/{psaAccountConfigurationId}/customers/loading-state`

**Syntax:**

```text

Get-NMMAccountprovisioningPsaAccountConfigurationsByPsaAccountConfigurationIdCustomersLoadingState [-PsaAccountConfigurationId] <int> [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-PsaAccountConfigurationId <Int32>`.

**Optional parameters:** `-Connection <PSObject>`.

```powershell
Get-NMMAccountprovisioningPsaAccountConfigurationsByPsaAccountConfigurationIdCustomersLoadingState -PsaAccountConfigurationId '<PsaAccountConfigurationId>' -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountprovisioningPsaAccountConfigurationsByPsaAccountConfigurationIdCustomersLoadingState.md)

### Get-NMMAccounts

Get the list of accounts

**API operation:** `GET /rest-api/v1/accounts`

**Syntax:**

```text

Get-NMMAccounts [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMAccounts -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccounts.md)

### Get-NMMAccountsByAccountIdAutoscaleProfiles

Get the list of account auto-scale profiles

**API operation:** `GET /rest-api/v1/accounts/{accountId}/autoscale-profiles`

**Syntax:**

```text

Get-NMMAccountsByAccountIdAutoscaleProfiles [-AccountId] <string> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMAccountsByAccountIdAutoscaleProfiles -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdAutoscaleProfiles.md)

### Get-NMMAccountsByAccountIdAutoscaleProfilesByProfileId

Get the account auto-scale profile by id

**API operation:** `GET /rest-api/v1/accounts/{accountId}/autoscale-profiles/{profileId}`

**Syntax:**

```text

Get-NMMAccountsByAccountIdAutoscaleProfilesByProfileId [-ProfileId] <int> [-AccountId] <string> [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-ProfileId <Int32>`.

**Optional parameters:** `-Connection <PSObject>`.

```powershell
Get-NMMAccountsByAccountIdAutoscaleProfilesByProfileId -ProfileId '<ProfileId>' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdAutoscaleProfilesByProfileId.md)

### Get-NMMAccountsByAccountIdBackupProtectedItems

Get all protected items

**API operation:** `GET /rest-api/v1/accounts/{accountId}/backup/protectedItems`

**Syntax:**

```text

Get-NMMAccountsByAccountIdBackupProtectedItems [-AccountId] <string> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMAccountsByAccountIdBackupProtectedItems -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdBackupProtectedItems.md)

### Get-NMMAccountsByAccountIdBackupRecoveryPoints

Recovery points of protected item

**API operation:** `GET /rest-api/v1/accounts/{accountId}/backup/recoveryPoints`

**Syntax:**

```text

Get-NMMAccountsByAccountIdBackupRecoveryPoints [-ProtectedItemId] <string> [-AccountId] <string> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-ProtectedItemId <String>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMAccountsByAccountIdBackupRecoveryPoints -ProtectedItemId '<ProtectedItemId>' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdBackupRecoveryPoints.md)

### Get-NMMAccountsByAccountIdDesktopImage

Get all desktop images

**API operation:** `GET /rest-api/v1/accounts/{accountId}/desktop-image`

**Syntax:**

```text

Get-NMMAccountsByAccountIdDesktopImage [-AccountId] <string> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMAccountsByAccountIdDesktopImage -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdDesktopImage.md)

### Get-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByName

Get the desktop image in detail

**API operation:** `GET /rest-api/v1/accounts/{accountId}/desktop-image/{subscriptionId}/{resourceGroup}/{name}`

**Syntax:**

```text

Get-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByName [-Name] <string> [-ResourceGroup] <string> [-SubscriptionId] <string> [-AccountId] <string> [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-Name <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Connection <PSObject>`.

```powershell
Get-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByName -Name '<Name>' -ResourceGroup 'rg-avd-production' -SubscriptionId $subscriptionId -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByName.md)

### Get-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameChangeLog

List changes made to this image.

**API operation:** `GET /rest-api/v1/accounts/{accountId}/desktop-image/{subscriptionId}/{resourceGroup}/{name}/change-log`

**Syntax:**

```text

Get-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameChangeLog [-Name] <string> [-ResourceGroup] <string> [-SubscriptionId] <string> [-AccountId] <string> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-Name <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameChangeLog -Name '<Name>' -ResourceGroup 'rg-avd-production' -SubscriptionId $subscriptionId -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameChangeLog.md)

### Get-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameScheduleConfigurations

Get Desktop image job schedule configurations.

**API operation:** `GET /rest-api/v1/accounts/{accountId}/desktop-image/{subscriptionId}/{resourceGroup}/{name}/schedule-configurations`

**Syntax:**

```text

Get-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameScheduleConfigurations [-Name] <string> [-ResourceGroup] <string> [-SubscriptionId] <string> [-AccountId] <string> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-Name <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameScheduleConfigurations -Name '<Name>' -ResourceGroup 'rg-avd-production' -SubscriptionId $subscriptionId -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameScheduleConfigurations.md)

### Get-NMMAccountsByAccountIdDirectories

Get the list of directories

**API operation:** `GET /rest-api/v1/accounts/{accountId}/directories`

**Syntax:**

```text

Get-NMMAccountsByAccountIdDirectories [-AccountId] <string> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMAccountsByAccountIdDirectories -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdDirectories.md)

### Get-NMMAccountsByAccountIdEnvironmentVariables

Get a list of account environment variables

**API operation:** `GET /rest-api/v1/accounts/{accountId}/environment-variables`

**Syntax:**

```text

Get-NMMAccountsByAccountIdEnvironmentVariables [-AccountId] <string> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMAccountsByAccountIdEnvironmentVariables -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdEnvironmentVariables.md)

### Get-NMMAccountsByAccountIdFslogix

Get the list of existing FSLogix configs.

**API operation:** `GET /rest-api/v1/accounts/{accountId}/fslogix`

**Syntax:**

```text

Get-NMMAccountsByAccountIdFslogix [-AccountId] <string> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMAccountsByAccountIdFslogix -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdFslogix.md)

### Get-NMMAccountsByAccountIdGroupsByGroupId

Get details of a group by group identifier.

**API operation:** `GET /rest-api/v1/accounts/{accountId}/groups/{groupId}`

**Syntax:**

```text

Get-NMMAccountsByAccountIdGroupsByGroupId [-GroupId] <string> [-AccountId] <string> [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-GroupId <String>`.

**Optional parameters:** `-Connection <PSObject>`.

```powershell
Get-NMMAccountsByAccountIdGroupsByGroupId -GroupId $groupId -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdGroupsByGroupId.md)

### Get-NMMAccountsByAccountIdHostPool

Get all host pools in the account

**API operation:** `GET /rest-api/v1/accounts/{accountId}/host-pool`

**Syntax:**

```text

Get-NMMAccountsByAccountIdHostPool [-AccountId] <string> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMAccountsByAccountIdHostPool -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdHostPool.md)

### Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameActiveDirectory

Get the host pool active directory

**API operation:** `GET /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/active-directory`

**Syntax:**

```text

Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameActiveDirectory [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-AccountId] <string> [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Connection <PSObject>`.

```powershell
Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameActiveDirectory -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameActiveDirectory.md)

### Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAssignedUsers

List of users assigned to the pool

**API operation:** `GET /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/assigned-users`

**Syntax:**

```text

Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAssignedUsers [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [[-IncludeGroupAssignments] <bool>] [-AccountId] <string> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`, `-IncludeGroupAssignments <Boolean>`.

```powershell
Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAssignedUsers -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAssignedUsers.md)

### Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAutoscaleSettings

Get the host pool current autoscale settings

**API operation:** `GET /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/autoscale-settings`

**Syntax:**

```text

Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAutoscaleSettings [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-AccountId] <string> [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Connection <PSObject>`.

```powershell
Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAutoscaleSettings -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAutoscaleSettings.md)

### Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAvd

Get the host pool properties

**API operation:** `GET /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/avd`

**Syntax:**

```text

Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAvd [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-AccountId] <string> [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Connection <PSObject>`.

```powershell
Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAvd -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAvd.md)

### Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameFslogix

Get host pool FSLogix config

**API operation:** `GET /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/fslogix`

**Syntax:**

```text

Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameFslogix [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-AccountId] <string> [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Connection <PSObject>`.

```powershell
Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameFslogix -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameFslogix.md)

### Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHosts

Get all hosts of the host pool

**API operation:** `GET /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/hosts`

**Syntax:**

```text

Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHosts [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-AccountId] <string> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHosts -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHosts.md)

### Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameScheduleConfigurations

Get Session host job schedule configurations.

**API operation:** `GET /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/hosts/{hostName}/schedule-configurations`

**Syntax:**

```text

Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameScheduleConfigurations [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-HostName] <string> [-AccountId] <string> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-HostName <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameScheduleConfigurations -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -HostName 'avd-host-01' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameScheduleConfigurations.md)

### Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameRdpSettings

Get host pool RDP settings

**API operation:** `GET /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/rdp-settings`

**Syntax:**

```text

Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameRdpSettings [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-AccountId] <string> [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Connection <PSObject>`.

```powershell
Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameRdpSettings -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameRdpSettings.md)

### Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameScheduleConfigurations

Get host pool job schedule configurations.

**API operation:** `GET /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/schedule-configurations`

**Syntax:**

```text

Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameScheduleConfigurations [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-AccountId] <string> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameScheduleConfigurations -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameScheduleConfigurations.md)

### Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameSessions

Get host pool user sessions

**API operation:** `GET /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/sessions`

**Syntax:**

```text

Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameSessions [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-AccountId] <string> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameSessions -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameSessions.md)

### Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameSessionTimeouts

Get the host pool session timeouts

**API operation:** `GET /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/session-timeouts`

**Syntax:**

```text

Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameSessionTimeouts [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-AccountId] <string> [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Connection <PSObject>`.

```powershell
Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameSessionTimeouts -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameSessionTimeouts.md)

### Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameTags

List the host pool tags

**API operation:** `GET /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/tags`

**Syntax:**

```text

Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameTags [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-AccountId] <string> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameTags -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameTags.md)

### Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameVmDeployment

Get host pool VM deployment settings.

**API operation:** `GET /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/vm-deployment`

**Syntax:**

```text

Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameVmDeployment [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-AccountId] <string> [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Connection <PSObject>`.

```powershell
Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameVmDeployment -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameVmDeployment.md)

### Get-NMMAccountsByAccountIdInheritedVariables

Get a list of account inherited variables

**API operation:** `GET /rest-api/v1/accounts/{accountId}/inherited-variables`

**Syntax:**

```text

Get-NMMAccountsByAccountIdInheritedVariables [-AccountId] <string> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMAccountsByAccountIdInheritedVariables -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdInheritedVariables.md)

### Get-NMMAccountsByAccountIdLocationVariables

Get a list of account location variables

**API operation:** `GET /rest-api/v1/accounts/{accountId}/location-variables`

**Syntax:**

```text

Get-NMMAccountsByAccountIdLocationVariables [-AccountId] <string> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMAccountsByAccountIdLocationVariables -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdLocationVariables.md)

### Get-NMMAccountsByAccountIdNetworks

Get the list of managed networks

**API operation:** `GET /rest-api/v1/accounts/{accountId}/networks`

**Syntax:**

```text

Get-NMMAccountsByAccountIdNetworks [-AccountId] <string> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMAccountsByAccountIdNetworks -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdNetworks.md)

### Get-NMMAccountsByAccountIdNetworksAll

Get the list of all available networks

**API operation:** `GET /rest-api/v1/accounts/{accountId}/networks/all`

**Syntax:**

```text

Get-NMMAccountsByAccountIdNetworksAll [-AccountId] <string> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMAccountsByAccountIdNetworksAll -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdNetworksAll.md)

### Get-NMMAccountsByAccountIdRecoveryVault

Get managed (linked) vaults

**API operation:** `GET /rest-api/v1/accounts/{accountId}/recovery-vault`

**Syntax:**

```text

Get-NMMAccountsByAccountIdRecoveryVault [-AccountId] <string> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMAccountsByAccountIdRecoveryVault -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdRecoveryVault.md)

### Get-NMMAccountsByAccountIdRecoveryVaultAllvaults

Get all vaults

**API operation:** `GET /rest-api/v1/accounts/{accountId}/recovery-vault/allvaults`

**Syntax:**

```text

Get-NMMAccountsByAccountIdRecoveryVaultAllvaults [-AccountId] <string> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMAccountsByAccountIdRecoveryVaultAllvaults -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdRecoveryVaultAllvaults.md)

### Get-NMMAccountsByAccountIdRecoveryVaultPolicies

Get all policies in the vault

**API operation:** `GET /rest-api/v1/accounts/{accountId}/recovery-vault/policies`

**Syntax:**

```text

Get-NMMAccountsByAccountIdRecoveryVaultPolicies [-VaultId] <string> [-AccountId] <string> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-VaultId <String>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMAccountsByAccountIdRecoveryVaultPolicies -VaultId '<VaultId>' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdRecoveryVaultPolicies.md)

### Get-NMMAccountsByAccountIdRecoveryVaultPolicy

Get full policy data

**API operation:** `GET /rest-api/v1/accounts/{accountId}/recovery-vault/policy`

**Syntax:**

```text

Get-NMMAccountsByAccountIdRecoveryVaultPolicy [-VaultId] <string> [-PolicyName] <string> [-AccountId] <string> [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-PolicyName <String>`, `-VaultId <String>`.

**Optional parameters:** `-Connection <PSObject>`.

```powershell
Get-NMMAccountsByAccountIdRecoveryVaultPolicy -VaultId '<VaultId>' -PolicyName '<PolicyName>' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdRecoveryVaultPolicy.md)

### Get-NMMAccountsByAccountIdRecoveryVaultRegionpolicyinfoByRegion

Get information about region protection by policies

**API operation:** `GET /rest-api/v1/accounts/{accountId}/recovery-vault/regionpolicyinfo/{region}`

**Syntax:**

```text

Get-NMMAccountsByAccountIdRecoveryVaultRegionpolicyinfoByRegion [-Region] <string> [-AccountId] <string> [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-Region <String>`.

**Optional parameters:** `-Connection <PSObject>`.

```powershell
Get-NMMAccountsByAccountIdRecoveryVaultRegionpolicyinfoByRegion -Region '<Region>' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdRecoveryVaultRegionpolicyinfoByRegion.md)

### Get-NMMAccountsByAccountIdRecoveryVaultRegionpolicyinfoBySubscriptionIdByRegion

Get information about region protection by policies

**API operation:** `GET /rest-api/v1/accounts/{accountId}/recovery-vault/regionpolicyinfo/{subscriptionId}/{region}`

**Syntax:**

```text

Get-NMMAccountsByAccountIdRecoveryVaultRegionpolicyinfoBySubscriptionIdByRegion [-SubscriptionId] <string> [-Region] <string> [-AccountId] <string> [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-Region <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Connection <PSObject>`.

```powershell
Get-NMMAccountsByAccountIdRecoveryVaultRegionpolicyinfoBySubscriptionIdByRegion -SubscriptionId $subscriptionId -Region '<Region>' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdRecoveryVaultRegionpolicyinfoBySubscriptionIdByRegion.md)

### Get-NMMAccountsByAccountIdReservations

Get all local reservations

**API operation:** `GET /rest-api/v1/accounts/{accountId}/reservations`

**Syntax:**

```text

Get-NMMAccountsByAccountIdReservations [-AccountId] <string> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMAccountsByAccountIdReservations -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdReservations.md)

### Get-NMMAccountsByAccountIdReservationsByReservationId

Get reservation by id

**API operation:** `GET /rest-api/v1/accounts/{accountId}/reservations/{reservationId}`

**Syntax:**

```text

Get-NMMAccountsByAccountIdReservationsByReservationId [-ReservationId] <int> [-AccountId] <string> [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-ReservationId <Int32>`.

**Optional parameters:** `-Connection <PSObject>`.

```powershell
Get-NMMAccountsByAccountIdReservationsByReservationId -ReservationId '<ReservationId>' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdReservationsByReservationId.md)

### Get-NMMAccountsByAccountIdReservationsByReservationIdResources

Get resource names associated to reservation

**API operation:** `GET /rest-api/v1/accounts/{accountId}/reservations/{reservationId}/resources`

**Syntax:**

```text

Get-NMMAccountsByAccountIdReservationsByReservationIdResources [-ReservationId] <int> [-AccountId] <string> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-ReservationId <Int32>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMAccountsByAccountIdReservationsByReservationIdResources -ReservationId '<ReservationId>' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdReservationsByReservationIdResources.md)

### Get-NMMAccountsByAccountIdReservedInstancesReservationDetails

Get all reservations from Azure

**API operation:** `GET /rest-api/v1/accounts/{accountId}/reservedInstances/reservationDetails`

**Syntax:**

```text

Get-NMMAccountsByAccountIdReservedInstancesReservationDetails [-AccountId] <string> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMAccountsByAccountIdReservedInstancesReservationDetails -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdReservedInstancesReservationDetails.md)

### Get-NMMAccountsByAccountIdReservedInstancesReservationDetailsByOrderId

Get reservations from Azure by order id

**API operation:** `GET /rest-api/v1/accounts/{accountId}/reservedInstances/reservationDetails/{orderId}`

**Syntax:**

```text

Get-NMMAccountsByAccountIdReservedInstancesReservationDetailsByOrderId [-OrderId] <string> [-AccountId] <string> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-OrderId <String>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMAccountsByAccountIdReservedInstancesReservationDetailsByOrderId -OrderId '<OrderId>' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdReservedInstancesReservationDetailsByOrderId.md)

### Get-NMMAccountsByAccountIdReservedInstancesReservationRecommendations

Get recommendations for purchasing reserved instances

**API operation:** `GET /rest-api/v1/accounts/{accountId}/reservedInstances/reservationRecommendations`

**Syntax:**

```text

Get-NMMAccountsByAccountIdReservedInstancesReservationRecommendations [-AccountId] <string> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMAccountsByAccountIdReservedInstancesReservationRecommendations -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdReservedInstancesReservationRecommendations.md)

### Get-NMMAccountsByAccountIdResourceGroup

Get the list of managed resource groups

**API operation:** `GET /rest-api/v1/accounts/{accountId}/resource-group`

**Syntax:**

```text

Get-NMMAccountsByAccountIdResourceGroup [-AccountId] <string> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMAccountsByAccountIdResourceGroup -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdResourceGroup.md)

### Get-NMMAccountsByAccountIdSchedules

Get the list of account schedule profiles

**API operation:** `GET /rest-api/v1/accounts/{accountId}/schedules`

**Syntax:**

```text

Get-NMMAccountsByAccountIdSchedules [-AccountId] <string> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMAccountsByAccountIdSchedules -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdSchedules.md)

### Get-NMMAccountsByAccountIdSchedulesByScheduleId

Get the account schedule profile by id

**API operation:** `GET /rest-api/v1/accounts/{accountId}/schedules/{scheduleId}`

**Syntax:**

```text

Get-NMMAccountsByAccountIdSchedulesByScheduleId [-ScheduleId] <int> [-AccountId] <string> [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-ScheduleId <Int32>`.

**Optional parameters:** `-Connection <PSObject>`.

```powershell
Get-NMMAccountsByAccountIdSchedulesByScheduleId -ScheduleId '<ScheduleId>' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdSchedulesByScheduleId.md)

### Get-NMMAccountsByAccountIdSchedulesByScheduleIdConfigurations

Get the list of related schedule configurations by account schedule profile id

**API operation:** `GET /rest-api/v1/accounts/{accountId}/schedules/{scheduleId}/configurations`

**Syntax:**

```text

Get-NMMAccountsByAccountIdSchedulesByScheduleIdConfigurations [-ScheduleId] <int> [-AccountId] <string> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-ScheduleId <Int32>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMAccountsByAccountIdSchedulesByScheduleIdConfigurations -ScheduleId '<ScheduleId>' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdSchedulesByScheduleIdConfigurations.md)

### Get-NMMAccountsByAccountIdScriptedActions

Get the list of account scripted actions.

**API operation:** `GET /rest-api/v1/accounts/{accountId}/scripted-actions`

**Syntax:**

```text

Get-NMMAccountsByAccountIdScriptedActions [-AccountId] <string> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMAccountsByAccountIdScriptedActions -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdScriptedActions.md)

### Get-NMMAccountsByAccountIdScriptedActionsByScriptedActionIdScheduleConfigurations

Get Azure runbook account scripted action schedule configurations.

**API operation:** `GET /rest-api/v1/accounts/{accountId}/scripted-actions/{scriptedActionId}/schedule-configurations`

**Syntax:**

```text

Get-NMMAccountsByAccountIdScriptedActionsByScriptedActionIdScheduleConfigurations [-ScriptedActionId] <int> [-AccountId] <string> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-ScriptedActionId <Int32>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMAccountsByAccountIdScriptedActionsByScriptedActionIdScheduleConfigurations -ScriptedActionId '<ScriptedActionId>' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdScriptedActionsByScriptedActionIdScheduleConfigurations.md)

### Get-NMMAccountsByAccountIdSecureScoresRecommendedActions

No additional description is provided by the API specification.

**API operation:** `GET /rest-api/v1/accounts/{accountId}/secure-scores/recommended-actions`

**Syntax:**

```text

Get-NMMAccountsByAccountIdSecureScoresRecommendedActions [-AccountId] <string> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMAccountsByAccountIdSecureScoresRecommendedActions -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdSecureScoresRecommendedActions.md)

### Get-NMMAccountsByAccountIdSecureScoresTotalByCategory

No additional description is provided by the API specification.

**API operation:** `GET /rest-api/v1/accounts/{accountId}/secure-scores/total-by-category`

**Syntax:**

```text

Get-NMMAccountsByAccountIdSecureScoresTotalByCategory [-AccountId] <string> [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Connection <PSObject>`.

```powershell
Get-NMMAccountsByAccountIdSecureScoresTotalByCategory -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdSecureScoresTotalByCategory.md)

### Get-NMMAccountsByAccountIdSecureVariables

Get a list of account secure variables

**API operation:** `GET /rest-api/v1/accounts/{accountId}/secure-variables`

**Syntax:**

```text

Get-NMMAccountsByAccountIdSecureVariables [-AccountId] <string> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMAccountsByAccountIdSecureVariables -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdSecureVariables.md)

### Get-NMMAccountsByAccountIdStorageAzureFilesBySubscriptionIdByResourceGroupByStorageAccountNameByShareNameAutoScale

Get Azure Files autoscale

**API operation:** `GET /rest-api/v1/accounts/{accountId}/storage/azure-files/{subscriptionId}/{resourceGroup}/{storageAccountName}/{shareName}/auto-scale`

**Syntax:**

```text

Get-NMMAccountsByAccountIdStorageAzureFilesBySubscriptionIdByResourceGroupByStorageAccountNameByShareNameAutoScale [-SubscriptionId] <string> [-ResourceGroup] <string> [-StorageAccountName] <string> [-ShareName] <string> [-AccountId] <string> [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-ResourceGroup <String>`, `-ShareName <String>`, `-StorageAccountName <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Connection <PSObject>`.

```powershell
Get-NMMAccountsByAccountIdStorageAzureFilesBySubscriptionIdByResourceGroupByStorageAccountNameByShareNameAutoScale -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -StorageAccountName '<StorageAccountName>' -ShareName '<ShareName>' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdStorageAzureFilesBySubscriptionIdByResourceGroupByStorageAccountNameByShareNameAutoScale.md)

### Get-NMMAccountsByAccountIdUamAppGroup

Get app groups.

**API operation:** `GET /rest-api/v1/accounts/{accountId}/uam/appGroup`

**Syntax:**

```text

Get-NMMAccountsByAccountIdUamAppGroup [-AccountId] <string> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMAccountsByAccountIdUamAppGroup -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdUamAppGroup.md)

### Get-NMMAccountsByAccountIdUamAppGroupById

Get app group by ID.

**API operation:** `GET /rest-api/v1/accounts/{accountId}/uam/appGroup/{id}`

**Syntax:**

```text

Get-NMMAccountsByAccountIdUamAppGroupById [-Id] <int> [-AccountId] <string> [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-Id <Int32>`.

**Optional parameters:** `-Connection <PSObject>`.

```powershell
Get-NMMAccountsByAccountIdUamAppGroupById -Id '<Id>' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdUamAppGroupById.md)

### Get-NMMAccountsByAccountIdUamApps

Get applications available in certain account.

**API operation:** `GET /rest-api/v1/accounts/{accountId}/uam/apps`

**Syntax:**

```text

Get-NMMAccountsByAccountIdUamApps [-AccountId] <string> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMAccountsByAccountIdUamApps -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdUamApps.md)

### Get-NMMAccountsByAccountIdUamPolicy

Get app deployment policies.

**API operation:** `GET /rest-api/v1/accounts/{accountId}/uam/policy`

**Syntax:**

```text

Get-NMMAccountsByAccountIdUamPolicy [[-IncludeRecurrent] <bool>] [[-IncludeOneTime] <bool>] [-AccountId] <string> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`, `-IncludeOneTime <Boolean>`, `-IncludeRecurrent <Boolean>`.

```powershell
Get-NMMAccountsByAccountIdUamPolicy -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdUamPolicy.md)

### Get-NMMAccountsByAccountIdUamPolicyById

Get app deployment policy by ID.

**API operation:** `GET /rest-api/v1/accounts/{accountId}/uam/policy/{id}`

**Syntax:**

```text

Get-NMMAccountsByAccountIdUamPolicyById [-Id] <int> [-AccountId] <string> [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-Id <Int32>`.

**Optional parameters:** `-Connection <PSObject>`.

```powershell
Get-NMMAccountsByAccountIdUamPolicyById -Id '<Id>' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdUamPolicyById.md)

### Get-NMMAccountsByAccountIdUamPolicyByIdState

Get app deployment policy execution details.

**API operation:** `GET /rest-api/v1/accounts/{accountId}/uam/policy/{id}/state`

**Syntax:**

```text

Get-NMMAccountsByAccountIdUamPolicyByIdState [-Id] <int> [-AccountId] <string> [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-Id <Int32>`.

**Optional parameters:** `-Connection <PSObject>`.

```powershell
Get-NMMAccountsByAccountIdUamPolicyByIdState -Id '<Id>' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdUamPolicyByIdState.md)

### Get-NMMAccountsByAccountIdUamRepo

Get list of repos managed at Account level.

**API operation:** `GET /rest-api/v1/accounts/{accountId}/uam/repo`

**Syntax:**

```text

Get-NMMAccountsByAccountIdUamRepo [-AccountId] <string> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMAccountsByAccountIdUamRepo -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdUamRepo.md)

### Get-NMMAccountsByAccountIdUamRepoById

Get Account level repo by ID.

**API operation:** `GET /rest-api/v1/accounts/{accountId}/uam/repo/{id}`

**Syntax:**

```text

Get-NMMAccountsByAccountIdUamRepoById [-Id] <int> [-AccountId] <string> [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-Id <Int32>`.

**Optional parameters:** `-Connection <PSObject>`.

```powershell
Get-NMMAccountsByAccountIdUamRepoById -Id '<Id>' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdUamRepoById.md)

### Get-NMMAccountsByAccountIdUamRepoByRepoIdAppsExtensions

Get application extensions.
Extensions include app detection and auto-import configuration.

**API operation:** `GET /rest-api/v1/accounts/{accountId}/uam/repo/{repoId}/apps/extensions`

**Syntax:**

```text

Get-NMMAccountsByAccountIdUamRepoByRepoIdAppsExtensions [-RepoId] <int> [[-PackageId] <string>] [-AccountId] <string> [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-RepoId <Int32>`.

**Optional parameters:** `-Connection <PSObject>`, `-PackageId <String>`.

```powershell
Get-NMMAccountsByAccountIdUamRepoByRepoIdAppsExtensions -RepoId '<RepoId>' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdUamRepoByRepoIdAppsExtensions.md)

### Get-NMMAccountsByAccountIdUamRepoPrivateByRepoId

List IDs of all apps stored in private repo.

**API operation:** `GET /rest-api/v1/accounts/{accountId}/uam/repo/private/{repoId}`

**Syntax:**

```text

Get-NMMAccountsByAccountIdUamRepoPrivateByRepoId [-RepoId] <int> [-AccountId] <string> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-RepoId <Int32>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMAccountsByAccountIdUamRepoPrivateByRepoId -RepoId '<RepoId>' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdUamRepoPrivateByRepoId.md)

### Get-NMMAccountsByAccountIdUamRepoPrivateOrphan

List linkable private winget repositories

**API operation:** `GET /rest-api/v1/accounts/{accountId}/uam/repo/private/orphan`

**Syntax:**

```text

Get-NMMAccountsByAccountIdUamRepoPrivateOrphan [-AccountId] <string> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMAccountsByAccountIdUamRepoPrivateOrphan -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdUamRepoPrivateOrphan.md)

### Get-NMMAccountsByAccountIdUamRepoPrivateShellApps

List account Shell apps.

**API operation:** `GET /rest-api/v1/accounts/{accountId}/uam/repo/private/shell/apps`

**Syntax:**

```text

Get-NMMAccountsByAccountIdUamRepoPrivateShellApps [-AccountId] <string> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMAccountsByAccountIdUamRepoPrivateShellApps -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdUamRepoPrivateShellApps.md)

### Get-NMMAccountsByAccountIdUamRepoWingetByRepoIdAppsMetadata

Get metadata of WinGet application.

**API operation:** `GET /rest-api/v1/accounts/{accountId}/uam/repo/winget/{repoId}/apps/metadata`

**Syntax:**

```text

Get-NMMAccountsByAccountIdUamRepoWingetByRepoIdAppsMetadata [-RepoId] <int> [[-PackageId] <string>] [-AccountId] <string> [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-RepoId <Int32>`.

**Optional parameters:** `-Connection <PSObject>`, `-PackageId <String>`.

```powershell
Get-NMMAccountsByAccountIdUamRepoWingetByRepoIdAppsMetadata -RepoId '<RepoId>' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdUamRepoWingetByRepoIdAppsMetadata.md)

### Get-NMMAccountsByAccountIdUsages

Get usages

**API operation:** `GET /rest-api/v1/accounts/{accountId}/usages`

**Syntax:**

```text

Get-NMMAccountsByAccountIdUsages [[-StartDate] <datetime>] [[-EndDate] <datetime>] [[-WithDetails] <bool>] [-AccountId] <string> [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Connection <PSObject>`, `-EndDate <DateTime>`, `-StartDate <DateTime>`, `-WithDetails <Boolean>`.

```powershell
Get-NMMAccountsByAccountIdUsages -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdUsages.md)

### Get-NMMAccountsByAccountIdUsersByUserId

Get details of a user by user identifier.

**API operation:** `GET /rest-api/v1/accounts/{accountId}/users/{userId}`

**Syntax:**

```text

Get-NMMAccountsByAccountIdUsersByUserId [-UserId] <string> [-AccountId] <string> [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-UserId <String>`.

**Optional parameters:** `-Connection <PSObject>`.

```powershell
Get-NMMAccountsByAccountIdUsersByUserId -UserId $userId -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdUsersByUserId.md)

### Get-NMMAccountsByAccountIdUsersMfaStatusByUserId

Get details of user MFA registration and per-user MFA state .

**API operation:** `GET /rest-api/v1/accounts/{accountId}/users/mfaStatus/{userId}`

**Syntax:**

```text

Get-NMMAccountsByAccountIdUsersMfaStatusByUserId [-UserId] <string> [-AccountId] <string> [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-UserId <String>`.

**Optional parameters:** `-Connection <PSObject>`.

```powershell
Get-NMMAccountsByAccountIdUsersMfaStatusByUserId -UserId $userId -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdUsersMfaStatusByUserId.md)

### Get-NMMAccountsByAccountIdWorkspace

Get the list of available workspaces

**API operation:** `GET /rest-api/v1/accounts/{accountId}/workspace`

**Syntax:**

```text

Get-NMMAccountsByAccountIdWorkspace [-AccountId] <string> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMAccountsByAccountIdWorkspace -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdWorkspace.md)

### Get-NMMAccountsByAccountIdWorkspaceBySubscriptionIdByResourceGroupByWorkspaceNameSessions

Get workspace user sessions

**API operation:** `GET /rest-api/v1/accounts/{accountId}/workspace/{subscriptionId}/{resourceGroup}/{workspaceName}/sessions`

**Syntax:**

```text

Get-NMMAccountsByAccountIdWorkspaceBySubscriptionIdByResourceGroupByWorkspaceNameSessions [-SubscriptionId] <string> [-ResourceGroup] <string> [-WorkspaceName] <string> [-AccountId] <string> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`, `-WorkspaceName <String>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMAccountsByAccountIdWorkspaceBySubscriptionIdByResourceGroupByWorkspaceNameSessions -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -WorkspaceName '<WorkspaceName>' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAccountsByAccountIdWorkspaceBySubscriptionIdByResourceGroupByWorkspaceNameSessions.md)

### Get-NMMAppRoleAssignments

Get the list of assigned principals.

**API operation:** `GET /rest-api/v1/app-role-assignments`

**Syntax:**

```text

Get-NMMAppRoleAssignments [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMAppRoleAssignments -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAppRoleAssignments.md)

### Get-NMMAppRoleAssignmentsRoles

Get the list of app roles.

**API operation:** `GET /rest-api/v1/app-role-assignments/roles`

**Syntax:**

```text

Get-NMMAppRoleAssignmentsRoles [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMAppRoleAssignmentsRoles -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAppRoleAssignmentsRoles.md)

### Get-NMMAutoscaleProfiles

Get the list of global auto-scale profiles

**API operation:** `GET /rest-api/v1/autoscale-profiles`

**Syntax:**

```text

Get-NMMAutoscaleProfiles [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMAutoscaleProfiles -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAutoscaleProfiles.md)

### Get-NMMAutoscaleProfilesByProfileId

Get the global auto-scale profile by id

**API operation:** `GET /rest-api/v1/autoscale-profiles/{profileId}`

**Syntax:**

```text

Get-NMMAutoscaleProfilesByProfileId [-ProfileId] <int> [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-ProfileId <Int32>`.

**Optional parameters:** `-Connection <PSObject>`.

```powershell
Get-NMMAutoscaleProfilesByProfileId -ProfileId '<ProfileId>' -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMAutoscaleProfilesByProfileId.md)

### Get-NMMCostestimatorById

Get the saved estimate by id

**API operation:** `GET /rest-api/v1/costestimator/{id}`

**Syntax:**

```text

Get-NMMCostestimatorById [-Id] <int> [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-Id <Int32>`.

**Optional parameters:** `-Connection <PSObject>`.

```powershell
Get-NMMCostestimatorById -Id '<Id>' -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMCostestimatorById.md)

### Get-NMMCostestimatorList

Get the list of saved estimates

**API operation:** `GET /rest-api/v1/costestimator/list`

**Syntax:**

```text

Get-NMMCostestimatorList [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMCostestimatorList -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMCostestimatorList.md)

### Get-NMMDirectories

Get the list of directories

**API operation:** `GET /rest-api/v1/directories`

**Syntax:**

```text

Get-NMMDirectories [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMDirectories -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMDirectories.md)

### Get-NMMEnvironmentVariables

Get a list of msp environment variables

**API operation:** `GET /rest-api/v1/environment-variables`

**Syntax:**

```text

Get-NMMEnvironmentVariables [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMEnvironmentVariables -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMEnvironmentVariables.md)

### Get-NMMHealthStatus

A basic health check

**API operation:** `GET /rest-api/v1/health-status`

**Syntax:**

```text

Get-NMMHealthStatus [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Connection <PSObject>`.

```powershell
Get-NMMHealthStatus -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMHealthStatus.md)

### Get-NMMInheritedVariables

Get a list of msp inherited variables

**API operation:** `GET /rest-api/v1/inherited-variables`

**Syntax:**

```text

Get-NMMInheritedVariables [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMInheritedVariables -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMInheritedVariables.md)

### Get-NMMInvoices

Get the list of invoices.

**API operation:** `GET /rest-api/v1/invoices`

**Syntax:**

```text

Get-NMMInvoices [[-PeriodStart] <datetime>] [[-PeriodEnd] <datetime>] [[-HidePaid] <bool>] [[-HideUnpaid] <bool>] [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`, `-HidePaid <Boolean>`, `-HideUnpaid <Boolean>`, `-PeriodEnd <DateTime>`, `-PeriodStart <DateTime>`.

```powershell
Get-NMMInvoices -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMInvoices.md)

### Get-NMMInvoicesById

Get invoice details.

**API operation:** `GET /rest-api/v1/invoices/{id}`

**Syntax:**

```text

Get-NMMInvoicesById [-Id] <int> [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-Id <Int32>`.

**Optional parameters:** `-Connection <PSObject>`.

```powershell
Get-NMMInvoicesById -Id '<Id>' -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMInvoicesById.md)

### Get-NMMJobByJobId

Get job information by id

**API operation:** `GET /rest-api/v1/job/{jobId}`

**Syntax:**

```text

Get-NMMJobByJobId [-JobId] <int> [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-JobId <Int32>`.

**Optional parameters:** `-Connection <PSObject>`.

```powershell
Get-NMMJobByJobId -JobId '<JobId>' -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMJobByJobId.md)

### Get-NMMJobByJobIdTasks

Get all tasks of job by jobId

**API operation:** `GET /rest-api/v1/job/{jobId}/tasks`

**Syntax:**

```text

Get-NMMJobByJobIdTasks [-JobId] <int> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-JobId <Int32>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMJobByJobIdTasks -JobId '<JobId>' -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMJobByJobIdTasks.md)

### Get-NMMLocationVariables

Get a list of msp location variables

**API operation:** `GET /rest-api/v1/location-variables`

**Syntax:**

```text

Get-NMMLocationVariables [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMLocationVariables -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMLocationVariables.md)

### Get-NMMResourceGroup

Get the list of managed resource groups

**API operation:** `GET /rest-api/v1/resource-group`

**Syntax:**

```text

Get-NMMResourceGroup [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMResourceGroup -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMResourceGroup.md)

### Get-NMMSchedules

Get the list of global schedule profiles

**API operation:** `GET /rest-api/v1/schedules`

**Syntax:**

```text

Get-NMMSchedules [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMSchedules -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMSchedules.md)

### Get-NMMSchedulesByScheduleId

Get the global schedule profile by id

**API operation:** `GET /rest-api/v1/schedules/{scheduleId}`

**Syntax:**

```text

Get-NMMSchedulesByScheduleId [-ScheduleId] <int> [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-ScheduleId <Int32>`.

**Optional parameters:** `-Connection <PSObject>`.

```powershell
Get-NMMSchedulesByScheduleId -ScheduleId '<ScheduleId>' -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMSchedulesByScheduleId.md)

### Get-NMMSchedulesByScheduleIdConfigurations

Get the list of related schedule configurations by global schedule profile id

**API operation:** `GET /rest-api/v1/schedules/{scheduleId}/configurations`

**Syntax:**

```text

Get-NMMSchedulesByScheduleIdConfigurations [-ScheduleId] <int> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-ScheduleId <Int32>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMSchedulesByScheduleIdConfigurations -ScheduleId '<ScheduleId>' -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMSchedulesByScheduleIdConfigurations.md)

### Get-NMMScriptedActions

Get the list of msp scripted actions.

**API operation:** `GET /rest-api/v1/scripted-actions`

**Syntax:**

```text

Get-NMMScriptedActions [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMScriptedActions -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMScriptedActions.md)

### Get-NMMScriptedActionsByScriptedActionIdScheduleConfigurations

Get Azure runbook msp scripted action schedule configurations.

**API operation:** `GET /rest-api/v1/scripted-actions/{scriptedActionId}/schedule-configurations`

**Syntax:**

```text

Get-NMMScriptedActionsByScriptedActionIdScheduleConfigurations [-ScriptedActionId] <int> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-ScriptedActionId <Int32>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMScriptedActionsByScriptedActionIdScheduleConfigurations -ScriptedActionId '<ScriptedActionId>' -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMScriptedActionsByScriptedActionIdScheduleConfigurations.md)

### Get-NMMSecureVariables

Get a list of msp secure variables

**API operation:** `GET /rest-api/v1/secure-variables`

**Syntax:**

```text

Get-NMMSecureVariables [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMSecureVariables -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMSecureVariables.md)

### Get-NMMTest

Test request

**API operation:** `GET /rest-api/v1/test`

**Syntax:**

```text

Get-NMMTest [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Connection <PSObject>`.

```powershell
Get-NMMTest -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMTest.md)

### Get-NMMTimezones

Timezones ids

**API operation:** `GET /rest-api/v1/timezones`

**Syntax:**

```text

Get-NMMTimezones [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMTimezones -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMTimezones.md)

### Get-NMMUamAppGroup

Get app groups.

**API operation:** `GET /rest-api/v1/uam/appGroup`

**Syntax:**

```text

Get-NMMUamAppGroup [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMUamAppGroup -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMUamAppGroup.md)

### Get-NMMUamAppGroupById

Get app group by ID.

**API operation:** `GET /rest-api/v1/uam/appGroup/{id}`

**Syntax:**

```text

Get-NMMUamAppGroupById [-Id] <int> [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-Id <Int32>`.

**Optional parameters:** `-Connection <PSObject>`.

```powershell
Get-NMMUamAppGroupById -Id '<Id>' -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMUamAppGroupById.md)

### Get-NMMUamAppsAssignments

Get list of all app assignments.

**API operation:** `GET /rest-api/v1/uam/apps/assignments`

**Syntax:**

```text

Get-NMMUamAppsAssignments [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMUamAppsAssignments -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMUamAppsAssignments.md)

### Get-NMMUamAppsFavorite

Get list of apps marked as favorite.

**API operation:** `GET /rest-api/v1/uam/apps/favorite`

**Syntax:**

```text

Get-NMMUamAppsFavorite [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMUamAppsFavorite -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMUamAppsFavorite.md)

### Get-NMMUamAppslibraryShellapps

Get Shell apps from Nerdio library.

**API operation:** `GET /rest-api/v1/uam/appslibrary/shellapps`

**Syntax:**

```text

Get-NMMUamAppslibraryShellapps [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMUamAppslibraryShellapps -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMUamAppslibraryShellapps.md)

### Get-NMMUamPolicy

Get MSP app deployment policies.

**API operation:** `GET /rest-api/v1/uam/policy`

**Syntax:**

```text

Get-NMMUamPolicy [[-IncludeRecurrent] <bool>] [[-IncludeOneTime] <bool>] [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`, `-IncludeOneTime <Boolean>`, `-IncludeRecurrent <Boolean>`.

```powershell
Get-NMMUamPolicy -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMUamPolicy.md)

### Get-NMMUamPolicyById

Get MSP app deployment policy by ID.

**API operation:** `GET /rest-api/v1/uam/policy/{id}`

**Syntax:**

```text

Get-NMMUamPolicyById [-Id] <int> [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-Id <Int32>`.

**Optional parameters:** `-Connection <PSObject>`.

```powershell
Get-NMMUamPolicyById -Id '<Id>' -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMUamPolicyById.md)

### Get-NMMUamPolicyByPolicyIdAccountByAccountIdDeploymentState

Get derived policy execution details on specific account.

**API operation:** `GET /rest-api/v1/uam/policy/{policyId}/account/{accountId}/deploymentState`

**Syntax:**

```text

Get-NMMUamPolicyByPolicyIdAccountByAccountIdDeploymentState [-PolicyId] <int> [-AccountId] <int> [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-AccountId <Int32>`, `-PolicyId <Int32>`.

**Optional parameters:** `-Connection <PSObject>`.

```powershell
Get-NMMUamPolicyByPolicyIdAccountByAccountIdDeploymentState -PolicyId '<PolicyId>' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMUamPolicyByPolicyIdAccountByAccountIdDeploymentState.md)

### Get-NMMUamPolicyByPolicyIdDerived

Get derived account-level policies from MSP policy.

**API operation:** `GET /rest-api/v1/uam/policy/{policyId}/derived`

**Syntax:**

```text

Get-NMMUamPolicyByPolicyIdDerived [-PolicyId] <int> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-PolicyId <Int32>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMUamPolicyByPolicyIdDerived -PolicyId '<PolicyId>' -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMUamPolicyByPolicyIdDerived.md)

### Get-NMMUamPolicyByPolicyIdDerivedByDerivedPolicyIdState

Get derived policy execution details.

**API operation:** `GET /rest-api/v1/uam/policy/{policyId}/derived/{derivedPolicyId}/state`

**Syntax:**

```text

Get-NMMUamPolicyByPolicyIdDerivedByDerivedPolicyIdState [-PolicyId] <int> [-DerivedPolicyId] <int> [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-DerivedPolicyId <Int32>`, `-PolicyId <Int32>`.

**Optional parameters:** `-Connection <PSObject>`.

```powershell
Get-NMMUamPolicyByPolicyIdDerivedByDerivedPolicyIdState -PolicyId '<PolicyId>' -DerivedPolicyId '<DerivedPolicyId>' -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMUamPolicyByPolicyIdDerivedByDerivedPolicyIdState.md)

### Get-NMMUamRepo

Get list of linked MSP repositories

**API operation:** `GET /rest-api/v1/uam/repo`

**Syntax:**

```text

Get-NMMUamRepo [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMUamRepo -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMUamRepo.md)

### Get-NMMUamRepoById

Get linked MSP repo by ID

**API operation:** `GET /rest-api/v1/uam/repo/{id}`

**Syntax:**

```text

Get-NMMUamRepoById [-Id] <int> [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-Id <Int32>`.

**Optional parameters:** `-Connection <PSObject>`.

```powershell
Get-NMMUamRepoById -Id '<Id>' -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMUamRepoById.md)

### Get-NMMUamRepoByRepoIdApps

Get application by ID.

**API operation:** `GET /rest-api/v1/uam/repo/{repoId}/apps`

**Syntax:**

```text

Get-NMMUamRepoByRepoIdApps [-RepoId] <int> [[-ExternalId] <string>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-RepoId <Int32>`.

**Optional parameters:** `-Connection <PSObject>`, `-ExternalId <String>`.

```powershell
Get-NMMUamRepoByRepoIdApps -RepoId '<RepoId>' -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMUamRepoByRepoIdApps.md)

### Get-NMMUamRepoByRepoIdAppsExtensions

Get application extensions.
Extensions include app detection and auto-import configuration.

**API operation:** `GET /rest-api/v1/uam/repo/{repoId}/apps/extensions`

**Syntax:**

```text

Get-NMMUamRepoByRepoIdAppsExtensions [-RepoId] <int> [[-PackageId] <string>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-RepoId <Int32>`.

**Optional parameters:** `-Connection <PSObject>`, `-PackageId <String>`.

```powershell
Get-NMMUamRepoByRepoIdAppsExtensions -RepoId '<RepoId>' -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMUamRepoByRepoIdAppsExtensions.md)

### Get-NMMUamRepoByRepoIdAppsSearch

Search applications in the specific repository.

**API operation:** `GET /rest-api/v1/uam/repo/{repoId}/apps/search`

**Syntax:**

```text

Get-NMMUamRepoByRepoIdAppsSearch [-RepoId] <int> [[-SearchTerm] <string>] [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-RepoId <Int32>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`, `-SearchTerm <String>`.

```powershell
Get-NMMUamRepoByRepoIdAppsSearch -RepoId '<RepoId>' -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMUamRepoByRepoIdAppsSearch.md)

### Get-NMMUamRepoPrivateByRepoId

List IDs of all apps stored in private repo.

**API operation:** `GET /rest-api/v1/uam/repo/private/{repoId}`

**Syntax:**

```text

Get-NMMUamRepoPrivateByRepoId [-RepoId] <int> [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-RepoId <Int32>`.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMUamRepoPrivateByRepoId -RepoId '<RepoId>' -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMUamRepoPrivateByRepoId.md)

### Get-NMMUamRepoPrivateOrphan

List Msp linkable private winget repositories

**API operation:** `GET /rest-api/v1/uam/repo/private/orphan`

**Syntax:**

```text

Get-NMMUamRepoPrivateOrphan [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMUamRepoPrivateOrphan -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMUamRepoPrivateOrphan.md)

### Get-NMMUamRepoPrivateShellApps

List MSP Shell apps.

**API operation:** `GET /rest-api/v1/uam/repo/private/shell/apps`

**Syntax:**

```text

Get-NMMUamRepoPrivateShellApps [[-Filter] <Object>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Connection <PSObject>`, `-Filter <Object>`.

```powershell
Get-NMMUamRepoPrivateShellApps -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMUamRepoPrivateShellApps.md)

### Get-NMMUamRepoWingetByRepoIdAppsMetadata

Get metadata of WinGet application.

**API operation:** `GET /rest-api/v1/uam/repo/winget/{repoId}/apps/metadata`

**Syntax:**

```text

Get-NMMUamRepoWingetByRepoIdAppsMetadata [-RepoId] <int> [[-PackageId] <string>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-RepoId <Int32>`.

**Optional parameters:** `-Connection <PSObject>`, `-PackageId <String>`.

```powershell
Get-NMMUamRepoWingetByRepoIdAppsMetadata -RepoId '<RepoId>' -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMUamRepoWingetByRepoIdAppsMetadata.md)

### Get-NMMUsages

Get usages

**API operation:** `GET /rest-api/v1/usages`

**Syntax:**

```text

Get-NMMUsages [[-StartDate] <datetime>] [[-EndDate] <datetime>] [[-WithDetails] <bool>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Connection <PSObject>`, `-EndDate <DateTime>`, `-StartDate <DateTime>`, `-WithDetails <Boolean>`.

```powershell
Get-NMMUsages -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMUsages.md)

### Get-NMMVulnerabilities

Get the list of vulnerabilities

**API operation:** `GET /rest-api/v1/vulnerabilities`

**Syntax:**

```text

Get-NMMVulnerabilities [[-MinAffectedAccount] <int>] [[-MinCvssV3] <int>] [[-MinAffectedEndpoints] <int>] [[-Severity] <string>] [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Connection <PSObject>`, `-MinAffectedAccount <Int32>`, `-MinAffectedEndpoints <Int32>`, `-MinCvssV3 <Int32>`, `-Severity <String>`.

```powershell
Get-NMMVulnerabilities -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMVulnerabilities.md)

### Get-NMMVulnerabilitiesByIdDetails

Get details for specific vulnerability.

**API operation:** `GET /rest-api/v1/vulnerabilities/{id}/details`

**Syntax:**

```text

Get-NMMVulnerabilitiesByIdDetails [-Id] <string> [[-Connection] <psobject>] [<CommonParameters>]

```

**Required parameters:** `-Id <String>`.

**Optional parameters:** `-Connection <PSObject>`.

```powershell
Get-NMMVulnerabilitiesByIdDetails -Id '<Id>' -Connection $connection
```

[Detailed help and API notes](docs/Commands/Get-NMMVulnerabilitiesByIdDetails.md)

### New-NMMAccountprovisioningConfigureFileStorage

Step 4: Start Configure file storage step (add job)

**API operation:** `POST /rest-api/v1/accountprovisioning/configureFileStorage`

**Syntax:**

```text

New-NMMAccountprovisioningConfigureFileStorage [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountprovisioningConfigureFileStorage -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountprovisioningConfigureFileStorage.md)

### New-NMMAccountprovisioningConfigurePsa

Step 5: Start Configure PSA account mapping step (add job)

**API operation:** `POST /rest-api/v1/accountprovisioning/configurePsa`

**Syntax:**

```text

New-NMMAccountprovisioningConfigurePsa [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountprovisioningConfigurePsa -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountprovisioningConfigurePsa.md)

### New-NMMAccountprovisioningConnectToExistingAd

Step 3: Start Connect to existing AD step (add job).

**API operation:** `POST /rest-api/v1/accountprovisioning/connectToExistingAd`

**Syntax:**

```text

New-NMMAccountprovisioningConnectToExistingAd [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountprovisioningConnectToExistingAd -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountprovisioningConnectToExistingAd.md)

### New-NMMAccountprovisioningCreateNewAzureAdds

Step 3: Start Create new Azure AD DS step (add job)

**API operation:** `POST /rest-api/v1/accountprovisioning/createNewAzureAdds`

**Syntax:**

```text

New-NMMAccountprovisioningCreateNewAzureAdds [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountprovisioningCreateNewAzureAdds -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountprovisioningCreateNewAzureAdds.md)

### New-NMMAccountprovisioningLinkNetwork

Step 2: Start Azure configuration step (add job)

**API operation:** `POST /rest-api/v1/accountprovisioning/linkNetwork`

**Syntax:**

```text

New-NMMAccountprovisioningLinkNetwork [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountprovisioningLinkNetwork -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountprovisioningLinkNetwork.md)

### New-NMMAccountprovisioningLinkTenant

Step 1: Execute LinkTenant provision step, sync job

**API operation:** `POST /rest-api/v1/accountprovisioning/linkTenant`

**Syntax:**

```text

New-NMMAccountprovisioningLinkTenant [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountprovisioningLinkTenant -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountprovisioningLinkTenant.md)

### New-NMMAccountprovisioningPsaAccountConfigurationsByPsaAccountConfigurationIdCustomersRefresh

Start loading the customers of a configured PSA system (add job)

**API operation:** `POST /rest-api/v1/accountprovisioning/psaAccountConfigurations/{psaAccountConfigurationId}/customers/refresh`

**Syntax:**

```text

New-NMMAccountprovisioningPsaAccountConfigurationsByPsaAccountConfigurationIdCustomersRefresh [-PsaAccountConfigurationId] <int> [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-PsaAccountConfigurationId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountprovisioningPsaAccountConfigurationsByPsaAccountConfigurationIdCustomersRefresh -PsaAccountConfigurationId '<PsaAccountConfigurationId>' -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountprovisioningPsaAccountConfigurationsByPsaAccountConfigurationIdCustomersRefresh.md)

### New-NMMAccountsByAccountIdAutoscaleProfiles

Create the account auto-scale profile

**API operation:** `POST /rest-api/v1/accounts/{accountId}/autoscale-profiles`

**Syntax:**

```text

New-NMMAccountsByAccountIdAutoscaleProfiles [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdAutoscaleProfiles -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdAutoscaleProfiles.md)

### New-NMMAccountsByAccountIdAutoscaleProfilesByProfileIdAssignments

Create the account auto-scale profile assignment

**API operation:** `POST /rest-api/v1/accounts/{accountId}/autoscale-profiles/{profileId}/assignments`

**Syntax:**

```text

New-NMMAccountsByAccountIdAutoscaleProfilesByProfileIdAssignments [-ProfileId] <int> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-ProfileId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdAutoscaleProfilesByProfileIdAssignments -ProfileId '<ProfileId>' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdAutoscaleProfilesByProfileIdAssignments.md)

### New-NMMAccountsByAccountIdBackup

Backup now

**API operation:** `POST /rest-api/v1/accounts/{accountId}/backup`

**Syntax:**

```text

New-NMMAccountsByAccountIdBackup [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdBackup -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdBackup.md)

### New-NMMAccountsByAccountIdBackupDeleteBackupData

Delete backup data

**API operation:** `POST /rest-api/v1/accounts/{accountId}/backup/deleteBackupData`

**Syntax:**

```text

New-NMMAccountsByAccountIdBackupDeleteBackupData [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdBackupDeleteBackupData -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdBackupDeleteBackupData.md)

### New-NMMAccountsByAccountIdBackupDisable

Disable backup

**API operation:** `POST /rest-api/v1/accounts/{accountId}/backup/disable`

**Syntax:**

```text

New-NMMAccountsByAccountIdBackupDisable [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdBackupDisable -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdBackupDisable.md)

### New-NMMAccountsByAccountIdBackupEnable

Enable backup

**API operation:** `POST /rest-api/v1/accounts/{accountId}/backup/enable`

**Syntax:**

```text

New-NMMAccountsByAccountIdBackupEnable [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdBackupEnable -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdBackupEnable.md)

### New-NMMAccountsByAccountIdBackupRestore

Restores a virtual machine from a backup recovery point

**API operation:** `POST /rest-api/v1/accounts/{accountId}/backup/restore`

**Syntax:**

```text

New-NMMAccountsByAccountIdBackupRestore [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdBackupRestore -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdBackupRestore.md)

### New-NMMAccountsByAccountIdBackupValidate

Validate recovery point

**API operation:** `POST /rest-api/v1/accounts/{accountId}/backup/validate`

**Syntax:**

```text

New-NMMAccountsByAccountIdBackupValidate [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdBackupValidate -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdBackupValidate.md)

### New-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameClone

Clone the desktop image

**API operation:** `POST /rest-api/v1/accounts/{accountId}/desktop-image/{subscriptionId}/{resourceGroup}/{name}/clone`

**Syntax:**

```text

New-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameClone [-Name] <string> [-ResourceGroup] <string> [-SubscriptionId] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-Name <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameClone -Name '<Name>' -ResourceGroup 'rg-avd-production' -SubscriptionId $subscriptionId -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameClone.md)

### New-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameOpenRdp

Open RDP access

**API operation:** `POST /rest-api/v1/accounts/{accountId}/desktop-image/{subscriptionId}/{resourceGroup}/{name}/open-rdp`

**Syntax:**

```text

New-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameOpenRdp [-Name] <string> [-ResourceGroup] <string> [-SubscriptionId] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-Name <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameOpenRdp -Name '<Name>' -ResourceGroup 'rg-avd-production' -SubscriptionId $subscriptionId -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameOpenRdp.md)

### New-NMMAccountsByAccountIdDesktopImageCreateFromLibrary

Create the desktop image from Azure library

**API operation:** `POST /rest-api/v1/accounts/{accountId}/desktop-image/create-from-library`

**Syntax:**

```text

New-NMMAccountsByAccountIdDesktopImageCreateFromLibrary [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdDesktopImageCreateFromLibrary -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdDesktopImageCreateFromLibrary.md)

### New-NMMAccountsByAccountIdDesktopImageCreateFromVm

Create the desktop image from Azure VM

**API operation:** `POST /rest-api/v1/accounts/{accountId}/desktop-image/create-from-vm`

**Syntax:**

```text

New-NMMAccountsByAccountIdDesktopImageCreateFromVm [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdDesktopImageCreateFromVm -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdDesktopImageCreateFromVm.md)

### New-NMMAccountsByAccountIdGroups

Get a list of groups for the account.

**API operation:** `POST /rest-api/v1/accounts/{accountId}/groups`

**Syntax:**

```text

New-NMMAccountsByAccountIdGroups [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdGroups -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdGroups.md)

### New-NMMAccountsByAccountIdGroupsAdd

Create a new group in Entra ID or Active Directory.

**API operation:** `POST /rest-api/v1/accounts/{accountId}/groups/add`

**Syntax:**

```text

New-NMMAccountsByAccountIdGroupsAdd [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdGroupsAdd -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdGroupsAdd.md)

### New-NMMAccountsByAccountIdHostPool

Create host pool

**API operation:** `POST /rest-api/v1/accounts/{accountId}/host-pool`

**Syntax:**

```text

New-NMMAccountsByAccountIdHostPool [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdHostPool -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdHostPool.md)

### New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAllowsessions

Activate / Deactivate all hosts in the pool

**API operation:** `POST /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/allowsessions`

**Syntax:**

```text

New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAllowsessions [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAllowsessions -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAllowsessions.md)

### New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAssign

No additional description is provided by the API specification.

**API operation:** `POST /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/assign`

**Syntax:**

```text

New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAssign [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAssign -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAssign.md)

### New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameClone

Clone chosen host pool.

**API operation:** `POST /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/clone`

**Syntax:**

```text

New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameClone [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameClone -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameClone.md)

### New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHosts

Create host

**API operation:** `POST /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/hosts`

**Syntax:**

```text

New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHosts [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHosts -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHosts.md)

### New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameAllowsessions

Activate / Deactivate host

**API operation:** `POST /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/hosts/{hostName}/allowsessions`

**Syntax:**

```text

New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameAllowsessions [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-HostName] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-HostName <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameAllowsessions -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -HostName 'avd-host-01' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameAllowsessions.md)

### New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameAssignUser

Assign, Unassign or Reassign user to host

**API operation:** `POST /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/hosts/{hostName}/assignUser`

**Syntax:**

```text

New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameAssignUser [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-HostName] <string> [[-UserObjectId] <string>] [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-HostName <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-UserObjectId <String>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameAssignUser -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -HostName 'avd-host-01' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameAssignUser.md)

### New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameMessage

Send message to all sessions for session host

**API operation:** `POST /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/hosts/{hostName}/message`

**Syntax:**

```text

New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameMessage [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-HostName] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-HostName <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameMessage -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -HostName 'avd-host-01' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameMessage.md)

### New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameReimage

Reimage host

**API operation:** `POST /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/hosts/{hostName}/reimage`

**Syntax:**

```text

New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameReimage [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-HostName] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-HostName <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameReimage -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -HostName 'avd-host-01' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameReimage.md)

### New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameRestart

Restart chosen host

**API operation:** `POST /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/hosts/{hostName}/restart`

**Syntax:**

```text

New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameRestart [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-HostName] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-HostName <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameRestart -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -HostName 'avd-host-01' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameRestart.md)

### New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameSessionBySessionIdActionDisconnect

Perform disconnect action for host pool user session

**API operation:** `POST /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/hosts/{hostName}/session/{sessionId}/action/disconnect`

**Syntax:**

```text

New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameSessionBySessionIdActionDisconnect [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-HostName] <string> [-SessionId] <string> [-AccountId] <string> [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-HostName <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SessionId <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameSessionBySessionIdActionDisconnect -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -HostName 'avd-host-01' -SessionId '<SessionId>' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameSessionBySessionIdActionDisconnect.md)

### New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameSessionBySessionIdActionLogoff

Perform logoff action for host pool user session

**API operation:** `POST /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/hosts/{hostName}/session/{sessionId}/action/logoff`

**Syntax:**

```text

New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameSessionBySessionIdActionLogoff [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-HostName] <string> [-SessionId] <string> [-AccountId] <string> [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-HostName <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SessionId <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameSessionBySessionIdActionLogoff -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -HostName 'avd-host-01' -SessionId '<SessionId>' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameSessionBySessionIdActionLogoff.md)

### New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameSessionBySessionIdActionSendMessage

Send message for host pool user session

**API operation:** `POST /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/hosts/{hostName}/session/{sessionId}/action/send-message`

**Syntax:**

```text

New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameSessionBySessionIdActionSendMessage [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-HostName] <string> [-SessionId] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-HostName <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SessionId <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameSessionBySessionIdActionSendMessage -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -HostName 'avd-host-01' -SessionId '<SessionId>' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameSessionBySessionIdActionSendMessage.md)

### New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameStart

Power on chosen host

**API operation:** `POST /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/hosts/{hostName}/start`

**Syntax:**

```text

New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameStart [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-HostName] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-HostName <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameStart -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -HostName 'avd-host-01' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameStart.md)

### New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameStop

Power off chosen host

**API operation:** `POST /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/hosts/{hostName}/stop`

**Syntax:**

```text

New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameStop [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-HostName] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-HostName <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameStop -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -HostName 'avd-host-01' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameStop.md)

### New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameReimage

Resize or reimage all hosts in the pool

**API operation:** `POST /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/reimage`

**Syntax:**

```text

New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameReimage [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameReimage -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameReimage.md)

### New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameRestartBulk

Restart all hosts in the pool

**API operation:** `POST /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/restart-bulk`

**Syntax:**

```text

New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameRestartBulk [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameRestartBulk -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameRestartBulk.md)

### New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameRunScriptBulk

Run script on all hosts in the pool

**API operation:** `POST /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/run-script-bulk`

**Syntax:**

```text

New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameRunScriptBulk [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameRunScriptBulk -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameRunScriptBulk.md)

### New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameStartBulk

Power on all hosts in the pool

**API operation:** `POST /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/start-bulk`

**Syntax:**

```text

New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameStartBulk [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameStartBulk -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameStartBulk.md)

### New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameStopBulk

Power off all hosts in the pool

**API operation:** `POST /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/stop-bulk`

**Syntax:**

```text

New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameStopBulk [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameStopBulk -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameStopBulk.md)

### New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameUnassign

No additional description is provided by the API specification.

**API operation:** `POST /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/unassign`

**Syntax:**

```text

New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameUnassign [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameUnassign -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameUnassign.md)

### New-NMMAccountsByAccountIdHostPoolGenerateDescription

Generate description with AI

**API operation:** `POST /rest-api/v1/accounts/{accountId}/host-pool/generateDescription`

**Syntax:**

```text

New-NMMAccountsByAccountIdHostPoolGenerateDescription [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdHostPoolGenerateDescription -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdHostPoolGenerateDescription.md)

### New-NMMAccountsByAccountIdNetworksLink

Link existing network

**API operation:** `POST /rest-api/v1/accounts/{accountId}/networks/link`

**Syntax:**

```text

New-NMMAccountsByAccountIdNetworksLink [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdNetworksLink -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdNetworksLink.md)

### New-NMMAccountsByAccountIdRecoveryVault

Create new vault

**API operation:** `POST /rest-api/v1/accounts/{accountId}/recovery-vault`

**Syntax:**

```text

New-NMMAccountsByAccountIdRecoveryVault [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdRecoveryVault -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdRecoveryVault.md)

### New-NMMAccountsByAccountIdRecoveryVaultAssignpoliciestoresources

Assign policies to resources.

**API operation:** `POST /rest-api/v1/accounts/{accountId}/recovery-vault/assignpoliciestoresources`

**Syntax:**

```text

New-NMMAccountsByAccountIdRecoveryVaultAssignpoliciestoresources [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdRecoveryVaultAssignpoliciestoresources -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdRecoveryVaultAssignpoliciestoresources.md)

### New-NMMAccountsByAccountIdRecoveryVaultCreateorupdatePolicy

Create new or update existing policy

**API operation:** `POST /rest-api/v1/accounts/{accountId}/recovery-vault/createorupdate/policy`

**Syntax:**

```text

New-NMMAccountsByAccountIdRecoveryVaultCreateorupdatePolicy [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdRecoveryVaultCreateorupdatePolicy -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdRecoveryVaultCreateorupdatePolicy.md)

### New-NMMAccountsByAccountIdRecoveryVaultLinkVault

Link to existing vault

**API operation:** `POST /rest-api/v1/accounts/{accountId}/recovery-vault/link/vault`

**Syntax:**

```text

New-NMMAccountsByAccountIdRecoveryVaultLinkVault [-VaultId] <string> [-AccountId] <string> [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-VaultId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdRecoveryVaultLinkVault -VaultId '<VaultId>' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdRecoveryVaultLinkVault.md)

### New-NMMAccountsByAccountIdRecoveryVaultUnlinkVault

Unlink vault

**API operation:** `POST /rest-api/v1/accounts/{accountId}/recovery-vault/unlink/vault`

**Syntax:**

```text

New-NMMAccountsByAccountIdRecoveryVaultUnlinkVault [-VaultId] <string> [-AccountId] <string> [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-VaultId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdRecoveryVaultUnlinkVault -VaultId '<VaultId>' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdRecoveryVaultUnlinkVault.md)

### New-NMMAccountsByAccountIdReservations

Add new reservation

**API operation:** `POST /rest-api/v1/accounts/{accountId}/reservations`

**Syntax:**

```text

New-NMMAccountsByAccountIdReservations [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdReservations -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdReservations.md)

### New-NMMAccountsByAccountIdReservedInstancesCalculate

Calculate price for placing a `ReservationOrder`

**API operation:** `POST /rest-api/v1/accounts/{accountId}/reservedInstances/calculate`

**Syntax:**

```text

New-NMMAccountsByAccountIdReservedInstancesCalculate [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdReservedInstancesCalculate -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdReservedInstancesCalculate.md)

### New-NMMAccountsByAccountIdReservedInstancesPurchase

Purchase `ReservationOrder`

**API operation:** `POST /rest-api/v1/accounts/{accountId}/reservedInstances/purchase`

**Syntax:**

```text

New-NMMAccountsByAccountIdReservedInstancesPurchase [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdReservedInstancesPurchase -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdReservedInstancesPurchase.md)

### New-NMMAccountsByAccountIdResourceGroupLinked

Link Azure resource group

**API operation:** `POST /rest-api/v1/accounts/{accountId}/resource-group/linked`

**Syntax:**

```text

New-NMMAccountsByAccountIdResourceGroupLinked [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdResourceGroupLinked -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdResourceGroupLinked.md)

### New-NMMAccountsByAccountIdSchedules

Create the account schedule profile

**API operation:** `POST /rest-api/v1/accounts/{accountId}/schedules`

**Syntax:**

```text

New-NMMAccountsByAccountIdSchedules [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdSchedules -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdSchedules.md)

### New-NMMAccountsByAccountIdScriptedActions

Create account scripted action.

**API operation:** `POST /rest-api/v1/accounts/{accountId}/scripted-actions`

**Syntax:**

```text

New-NMMAccountsByAccountIdScriptedActions [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdScriptedActions -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdScriptedActions.md)

### New-NMMAccountsByAccountIdScriptedActionsByIdExecution

Run Azure runbook account scripted action in Automation account.

**API operation:** `POST /rest-api/v1/accounts/{accountId}/scripted-actions/{id}/execution`

**Syntax:**

```text

New-NMMAccountsByAccountIdScriptedActionsByIdExecution [-Id] <int> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-Id <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdScriptedActionsByIdExecution -Id '<Id>' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdScriptedActionsByIdExecution.md)

### New-NMMAccountsByAccountIdSecureScoresRecommendationsByIdStatus

No additional description is provided by the API specification.

**API operation:** `POST /rest-api/v1/accounts/{accountId}/secure-scores/recommendations/{id}/status`

**Syntax:**

```text

New-NMMAccountsByAccountIdSecureScoresRecommendationsByIdStatus [-Id] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-Id <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdSecureScoresRecommendationsByIdStatus -Id '<Id>' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdSecureScoresRecommendationsByIdStatus.md)

### New-NMMAccountsByAccountIdSecureVariables

Create account secure variable

**API operation:** `POST /rest-api/v1/accounts/{accountId}/secure-variables`

**Syntax:**

```text

New-NMMAccountsByAccountIdSecureVariables [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdSecureVariables -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdSecureVariables.md)

### New-NMMAccountsByAccountIdStorageAzureFilesBySubscriptionIdByResourceGroupByStorageAccountNameByShareNameAutoScaleEnabledByIsEnabled

Enable or disable Azure Files autoscale

**API operation:** `POST /rest-api/v1/accounts/{accountId}/storage/azure-files/{subscriptionId}/{resourceGroup}/{storageAccountName}/{shareName}/auto-scale/enabled/{isEnabled}`

**Syntax:**

```text

New-NMMAccountsByAccountIdStorageAzureFilesBySubscriptionIdByResourceGroupByStorageAccountNameByShareNameAutoScaleEnabledByIsEnabled [-SubscriptionId] <string> [-ResourceGroup] <string> [-StorageAccountName] <string> [-ShareName] <string> [-IsEnabled] <bool> [-AccountId] <string> [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-IsEnabled <Boolean>`, `-ResourceGroup <String>`, `-ShareName <String>`, `-StorageAccountName <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdStorageAzureFilesBySubscriptionIdByResourceGroupByStorageAccountNameByShareNameAutoScaleEnabledByIsEnabled -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -StorageAccountName '<StorageAccountName>' -ShareName '<ShareName>' -IsEnabled $true -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdStorageAzureFilesBySubscriptionIdByResourceGroupByStorageAccountNameByShareNameAutoScaleEnabledByIsEnabled.md)

### New-NMMAccountsByAccountIdUamAppGroup

Create app group.

**API operation:** `POST /rest-api/v1/accounts/{accountId}/uam/appGroup`

**Syntax:**

```text

New-NMMAccountsByAccountIdUamAppGroup [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdUamAppGroup -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdUamAppGroup.md)

### New-NMMAccountsByAccountIdUamPolicy

Create app deployment policy.

**API operation:** `POST /rest-api/v1/accounts/{accountId}/uam/policy`

**Syntax:**

```text

New-NMMAccountsByAccountIdUamPolicy [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdUamPolicy -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdUamPolicy.md)

### New-NMMAccountsByAccountIdUamPolicyGenerateDescription

Generate description with AI.

**API operation:** `POST /rest-api/v1/accounts/{accountId}/uam/policy/generateDescription`

**Syntax:**

```text

New-NMMAccountsByAccountIdUamPolicyGenerateDescription [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdUamPolicyGenerateDescription -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdUamPolicyGenerateDescription.md)

### New-NMMAccountsByAccountIdUamRepoByRepoIdAppsFavorite

Mark application as favorite.

**API operation:** `POST /rest-api/v1/accounts/{accountId}/uam/repo/{repoId}/apps/favorite`

**Syntax:**

```text

New-NMMAccountsByAccountIdUamRepoByRepoIdAppsFavorite [-RepoId] <int> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-RepoId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdUamRepoByRepoIdAppsFavorite -RepoId '<RepoId>' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdUamRepoByRepoIdAppsFavorite.md)

### New-NMMAccountsByAccountIdUamRepoPrivateShell

Create new Shell Apps repository

**API operation:** `POST /rest-api/v1/accounts/{accountId}/uam/repo/private/shell`

**Syntax:**

```text

New-NMMAccountsByAccountIdUamRepoPrivateShell [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdUamRepoPrivateShell -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdUamRepoPrivateShell.md)

### New-NMMAccountsByAccountIdUamRepoPrivateShellApps

Create Shell application.

**API operation:** `POST /rest-api/v1/accounts/{accountId}/uam/repo/private/shell/apps`

**Syntax:**

```text

New-NMMAccountsByAccountIdUamRepoPrivateShellApps [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdUamRepoPrivateShellApps -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdUamRepoPrivateShellApps.md)

### New-NMMAccountsByAccountIdUamRepoPrivateShellLinkstorage

Link storage to account shell repository

**API operation:** `POST /rest-api/v1/accounts/{accountId}/uam/repo/private/shell/linkstorage`

**Syntax:**

```text

New-NMMAccountsByAccountIdUamRepoPrivateShellLinkstorage [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdUamRepoPrivateShellLinkstorage -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdUamRepoPrivateShellLinkstorage.md)

### New-NMMAccountsByAccountIdUamRepoPrivateWinget

Create new private WinGet repository

**API operation:** `POST /rest-api/v1/accounts/{accountId}/uam/repo/private/winget`

**Syntax:**

```text

New-NMMAccountsByAccountIdUamRepoPrivateWinget [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdUamRepoPrivateWinget -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdUamRepoPrivateWinget.md)

### New-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdApps

Create WinGet application.

**API operation:** `POST /rest-api/v1/accounts/{accountId}/uam/repo/private/winget/{repoId}/apps`

**Syntax:**

```text

New-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdApps [-RepoId] <int> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-RepoId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdApps -RepoId '<RepoId>' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdApps.md)

### New-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsByPackageIdVersion

Add new version of WinGet application.

**API operation:** `POST /rest-api/v1/accounts/{accountId}/uam/repo/private/winget/{repoId}/apps/{packageId}/version`

**Syntax:**

```text

New-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsByPackageIdVersion [-RepoId] <int> [-PackageId] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-PackageId <String>`, `-RepoId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsByPackageIdVersion -RepoId '<RepoId>' -PackageId '<PackageId>' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsByPackageIdVersion.md)

### New-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersionInstaller

Add installer for specific version of WinGet application.

**API operation:** `POST /rest-api/v1/accounts/{accountId}/uam/repo/private/winget/{repoId}/apps/{packageId}/version/{appVersion}/installer`

**Syntax:**

```text

New-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersionInstaller [-RepoId] <int> [-PackageId] <string> [-AppVersion] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-AppVersion <String>`, `-PackageId <String>`, `-RepoId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersionInstaller -RepoId '<RepoId>' -PackageId '<PackageId>' -AppVersion '<AppVersion>' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersionInstaller.md)

### New-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsImport

Import application from one WinGet repo to another.

**API operation:** `POST /rest-api/v1/accounts/{accountId}/uam/repo/private/winget/{repoId}/apps/import`

**Syntax:**

```text

New-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsImport [-RepoId] <int> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-RepoId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsImport -RepoId '<RepoId>' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsImport.md)

### New-NMMAccountsByAccountIdUamRepoPrivateWingetLink

Link private winget repository

**API operation:** `POST /rest-api/v1/accounts/{accountId}/uam/repo/private/winget/link`

**Syntax:**

```text

New-NMMAccountsByAccountIdUamRepoPrivateWingetLink [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdUamRepoPrivateWingetLink -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdUamRepoPrivateWingetLink.md)

### New-NMMAccountsByAccountIdUamRepositoryPrivateByRepoIdPackageByPackageIdAutoImport

Setup source app to import new versions automatically.

**API operation:** `POST /rest-api/v1/accounts/{accountId}/uam/repository/private/{repoId}/package/{packageId}/auto-import`

**Syntax:**

```text

New-NMMAccountsByAccountIdUamRepositoryPrivateByRepoIdPackageByPackageIdAutoImport [-RepoId] <int> [-PackageId] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-PackageId <String>`, `-RepoId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdUamRepositoryPrivateByRepoIdPackageByPackageIdAutoImport -RepoId '<RepoId>' -PackageId '<PackageId>' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdUamRepositoryPrivateByRepoIdPackageByPackageIdAutoImport.md)

### New-NMMAccountsByAccountIdUamRepositoryPrivateByRepoIdPackageByPackageIdDetection

Allow to configure custom detection rules to detect status of WinGet app deployment.

**API operation:** `POST /rest-api/v1/accounts/{accountId}/uam/repository/private/{repoId}/package/{packageId}/detection`

**Syntax:**

```text

New-NMMAccountsByAccountIdUamRepositoryPrivateByRepoIdPackageByPackageIdDetection [-RepoId] <int> [-PackageId] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-PackageId <String>`, `-RepoId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdUamRepositoryPrivateByRepoIdPackageByPackageIdDetection -RepoId '<RepoId>' -PackageId '<PackageId>' -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdUamRepositoryPrivateByRepoIdPackageByPackageIdDetection.md)

### New-NMMAccountsByAccountIdUsers

Get a paginated list of users for the account.

**API operation:** `POST /rest-api/v1/accounts/{accountId}/users`

**Syntax:**

```text

New-NMMAccountsByAccountIdUsers [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdUsers -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdUsers.md)

### New-NMMAccountsByAccountIdUsersAdd

Create a new user in Entra ID or Active directory.

**API operation:** `POST /rest-api/v1/accounts/{accountId}/users/add`

**Syntax:**

```text

New-NMMAccountsByAccountIdUsersAdd [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdUsersAdd -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdUsersAdd.md)

### New-NMMAccountsByAccountIdUsersInvite

Invite a new user into the account as a guest user in Entra ID, and optionally send an invitation email.

**API operation:** `POST /rest-api/v1/accounts/{accountId}/users/invite`

**Syntax:**

```text

New-NMMAccountsByAccountIdUsersInvite [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdUsersInvite -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdUsersInvite.md)

### New-NMMAccountsByAccountIdWorkspace

Create workspace

**API operation:** `POST /rest-api/v1/accounts/{accountId}/workspace`

**Syntax:**

```text

New-NMMAccountsByAccountIdWorkspace [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAccountsByAccountIdWorkspace -AccountId $accountId -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAccountsByAccountIdWorkspace.md)

### New-NMMAppRoleAssignments

Assign app role to principals.

**API operation:** `POST /rest-api/v1/app-role-assignments`

**Syntax:**

```text

New-NMMAppRoleAssignments [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAppRoleAssignments -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAppRoleAssignments.md)

### New-NMMAutoscaleProfiles

Create the global auto-scale profile

**API operation:** `POST /rest-api/v1/autoscale-profiles`

**Syntax:**

```text

New-NMMAutoscaleProfiles [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAutoscaleProfiles -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAutoscaleProfiles.md)

### New-NMMAutoscaleProfilesByProfileIdAssignments

Create the global auto-scale profile assignment

**API operation:** `POST /rest-api/v1/autoscale-profiles/{profileId}/assignments`

**Syntax:**

```text

New-NMMAutoscaleProfilesByProfileIdAssignments [-ProfileId] <int> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-ProfileId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMAutoscaleProfilesByProfileIdAssignments -ProfileId '<ProfileId>' -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMAutoscaleProfilesByProfileIdAssignments.md)

### New-NMMInheritedVariables

Create msp inherited variable

**API operation:** `POST /rest-api/v1/inherited-variables`

**Syntax:**

```text

New-NMMInheritedVariables [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMInheritedVariables -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMInheritedVariables.md)

### New-NMMJobRestartByJobId

Restart job

**API operation:** `POST /rest-api/v1/job/restart/{jobId}`

**Syntax:**

```text

New-NMMJobRestartByJobId [-JobId] <int> [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-JobId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-WhatIf <switch>`.

```powershell
New-NMMJobRestartByJobId -JobId '<JobId>' -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMJobRestartByJobId.md)

### New-NMMLocationVariables

Create msp location variable

**API operation:** `POST /rest-api/v1/location-variables`

**Syntax:**

```text

New-NMMLocationVariables [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMLocationVariables -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMLocationVariables.md)

### New-NMMResourceGroupLinked

Link Azure resource group

**API operation:** `POST /rest-api/v1/resource-group/linked`

**Syntax:**

```text

New-NMMResourceGroupLinked [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMResourceGroupLinked -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMResourceGroupLinked.md)

### New-NMMSchedules

Create the global schedule profile

**API operation:** `POST /rest-api/v1/schedules`

**Syntax:**

```text

New-NMMSchedules [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMSchedules -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMSchedules.md)

### New-NMMScriptedActions

Create msp scripted action.

**API operation:** `POST /rest-api/v1/scripted-actions`

**Syntax:**

```text

New-NMMScriptedActions [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMScriptedActions -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMScriptedActions.md)

### New-NMMScriptedActionsByIdExecution

Run Azure runbook msp scripted action in Automation account.

**API operation:** `POST /rest-api/v1/scripted-actions/{id}/execution`

**Syntax:**

```text

New-NMMScriptedActionsByIdExecution [-Id] <int> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-Id <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMScriptedActionsByIdExecution -Id '<Id>' -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMScriptedActionsByIdExecution.md)

### New-NMMSecureVariables

Create msp secure variable

**API operation:** `POST /rest-api/v1/secure-variables`

**Syntax:**

```text

New-NMMSecureVariables [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMSecureVariables -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMSecureVariables.md)

### New-NMMUamAppGroup

Create app group.

**API operation:** `POST /rest-api/v1/uam/appGroup`

**Syntax:**

```text

New-NMMUamAppGroup [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMUamAppGroup -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMUamAppGroup.md)

### New-NMMUamPolicy

Create MSP app deployment policy.

**API operation:** `POST /rest-api/v1/uam/policy`

**Syntax:**

```text

New-NMMUamPolicy [[-ForceRun] <bool>] [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-ForceRun <Boolean>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMUamPolicy -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMUamPolicy.md)

### New-NMMUamRepoByRepoIdAppsFavorite

Mark application as favorite.

**API operation:** `POST /rest-api/v1/uam/repo/{repoId}/apps/favorite`

**Syntax:**

```text

New-NMMUamRepoByRepoIdAppsFavorite [-RepoId] <int> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-RepoId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMUamRepoByRepoIdAppsFavorite -RepoId '<RepoId>' -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMUamRepoByRepoIdAppsFavorite.md)

### New-NMMUamRepoLink

Link existing repository

**API operation:** `POST /rest-api/v1/uam/repo/link`

**Syntax:**

```text

New-NMMUamRepoLink [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMUamRepoLink -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMUamRepoLink.md)

### New-NMMUamRepoPrivateAndroidApps

Import application from Google Play Store to NMM Android apps repo.

**API operation:** `POST /rest-api/v1/uam/repo/private/android/apps`

**Syntax:**

```text

New-NMMUamRepoPrivateAndroidApps [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMUamRepoPrivateAndroidApps -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMUamRepoPrivateAndroidApps.md)

### New-NMMUamRepoPrivateShell

Create new Shell Apps repository

**API operation:** `POST /rest-api/v1/uam/repo/private/shell`

**Syntax:**

```text

New-NMMUamRepoPrivateShell [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMUamRepoPrivateShell -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMUamRepoPrivateShell.md)

### New-NMMUamRepoPrivateShellApps

Create Shell application.

**API operation:** `POST /rest-api/v1/uam/repo/private/shell/apps`

**Syntax:**

```text

New-NMMUamRepoPrivateShellApps [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMUamRepoPrivateShellApps -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMUamRepoPrivateShellApps.md)

### New-NMMUamRepoPrivateShellLinkstorage

Links storage to MSP Shell Apps repository

**API operation:** `POST /rest-api/v1/uam/repo/private/shell/linkstorage`

**Syntax:**

```text

New-NMMUamRepoPrivateShellLinkstorage [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMUamRepoPrivateShellLinkstorage -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMUamRepoPrivateShellLinkstorage.md)

### New-NMMUamRepoPrivateWinget

Create new private WinGet repository

**API operation:** `POST /rest-api/v1/uam/repo/private/winget`

**Syntax:**

```text

New-NMMUamRepoPrivateWinget [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMUamRepoPrivateWinget -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMUamRepoPrivateWinget.md)

### New-NMMUamRepoPrivateWingetByRepoIdApps

Create WinGet application.

**API operation:** `POST /rest-api/v1/uam/repo/private/winget/{repoId}/apps`

**Syntax:**

```text

New-NMMUamRepoPrivateWingetByRepoIdApps [-RepoId] <int> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-RepoId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMUamRepoPrivateWingetByRepoIdApps -RepoId '<RepoId>' -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMUamRepoPrivateWingetByRepoIdApps.md)

### New-NMMUamRepoPrivateWingetByRepoIdAppsByPackageIdVersion

Add new version of WinGet application.

**API operation:** `POST /rest-api/v1/uam/repo/private/winget/{repoId}/apps/{packageId}/version`

**Syntax:**

```text

New-NMMUamRepoPrivateWingetByRepoIdAppsByPackageIdVersion [-RepoId] <int> [-PackageId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-PackageId <String>`, `-RepoId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMUamRepoPrivateWingetByRepoIdAppsByPackageIdVersion -RepoId '<RepoId>' -PackageId '<PackageId>' -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMUamRepoPrivateWingetByRepoIdAppsByPackageIdVersion.md)

### New-NMMUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersionInstaller

Add installer for specific version of WinGet application.

**API operation:** `POST /rest-api/v1/uam/repo/private/winget/{repoId}/apps/{packageId}/version/{appVersion}/installer`

**Syntax:**

```text

New-NMMUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersionInstaller [-RepoId] <int> [-PackageId] <string> [-AppVersion] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AppVersion <String>`, `-PackageId <String>`, `-RepoId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersionInstaller -RepoId '<RepoId>' -PackageId '<PackageId>' -AppVersion '<AppVersion>' -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersionInstaller.md)

### New-NMMUamRepoPrivateWingetByRepoIdAppsImport

Import application from one WinGet repo to another

**API operation:** `POST /rest-api/v1/uam/repo/private/winget/{repoId}/apps/import`

**Syntax:**

```text

New-NMMUamRepoPrivateWingetByRepoIdAppsImport [-RepoId] <int> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-RepoId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMUamRepoPrivateWingetByRepoIdAppsImport -RepoId '<RepoId>' -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMUamRepoPrivateWingetByRepoIdAppsImport.md)

### New-NMMUamRepoPrivateWingetLink

Link private winget repository

**API operation:** `POST /rest-api/v1/uam/repo/private/winget/link`

**Syntax:**

```text

New-NMMUamRepoPrivateWingetLink [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMUamRepoPrivateWingetLink -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMUamRepoPrivateWingetLink.md)

### New-NMMUamRepositoryPrivateByRepoIdPackageByPackageIdAutoImport

Setup source app to import new versions automatically.

**API operation:** `POST /rest-api/v1/uam/repository/private/{repoId}/package/{packageId}/auto-import`

**Syntax:**

```text

New-NMMUamRepositoryPrivateByRepoIdPackageByPackageIdAutoImport [-RepoId] <int> [-PackageId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-PackageId <String>`, `-RepoId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMUamRepositoryPrivateByRepoIdPackageByPackageIdAutoImport -RepoId '<RepoId>' -PackageId '<PackageId>' -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMUamRepositoryPrivateByRepoIdPackageByPackageIdAutoImport.md)

### New-NMMUamRepositoryPrivateByRepoIdPackageByPackageIdDetection

Allow to configure custom detection rules to detect status of WinGet app deployment.

**API operation:** `POST /rest-api/v1/uam/repository/private/{repoId}/package/{packageId}/detection`

**Syntax:**

```text

New-NMMUamRepositoryPrivateByRepoIdPackageByPackageIdDetection [-RepoId] <int> [-PackageId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-PackageId <String>`, `-RepoId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
New-NMMUamRepositoryPrivateByRepoIdPackageByPackageIdDetection -RepoId '<RepoId>' -PackageId '<PackageId>' -Connection $connection
```

[Detailed help and API notes](docs/Commands/New-NMMUamRepositoryPrivateByRepoIdPackageByPackageIdDetection.md)

### Remove-NMMAccountsByAccountIdAutoscaleProfilesByProfileId

Delete the account auto-scale profile by id

**API operation:** `DELETE /rest-api/v1/accounts/{accountId}/autoscale-profiles/{profileId}`

**Syntax:**

```text

Remove-NMMAccountsByAccountIdAutoscaleProfilesByProfileId [-ProfileId] <int> [-AccountId] <string> [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-ProfileId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-WhatIf <switch>`.

```powershell
Remove-NMMAccountsByAccountIdAutoscaleProfilesByProfileId -ProfileId '<ProfileId>' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMAccountsByAccountIdAutoscaleProfilesByProfileId.md)

### Remove-NMMAccountsByAccountIdAutoscaleProfilesByProfileIdAssignments

Delete the account auto-scale profile assignment

**API operation:** `DELETE /rest-api/v1/accounts/{accountId}/autoscale-profiles/{profileId}/assignments`

**Syntax:**

```text

Remove-NMMAccountsByAccountIdAutoscaleProfilesByProfileIdAssignments [-ProfileId] <int> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-ProfileId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Remove-NMMAccountsByAccountIdAutoscaleProfilesByProfileIdAssignments -ProfileId '<ProfileId>' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMAccountsByAccountIdAutoscaleProfilesByProfileIdAssignments.md)

### Remove-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByName

Delete the desktop image

**API operation:** `DELETE /rest-api/v1/accounts/{accountId}/desktop-image/{subscriptionId}/{resourceGroup}/{name}`

**Syntax:**

```text

Remove-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByName [-Name] <string> [-ResourceGroup] <string> [-SubscriptionId] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-Name <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Remove-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByName -Name '<Name>' -ResourceGroup 'rg-avd-production' -SubscriptionId $subscriptionId -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByName.md)

### Remove-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNamePowerOffAndSetAsImageConfiguration

Remove 'set as image' schedule configuration

**API operation:** `DELETE /rest-api/v1/accounts/{accountId}/desktop-image/{subscriptionId}/{resourceGroup}/{name}/power-off-and-set-as-image-configuration`

**Syntax:**

```text

Remove-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNamePowerOffAndSetAsImageConfiguration [-Name] <string> [-ResourceGroup] <string> [-SubscriptionId] <string> [-AccountId] <string> [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-Name <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-WhatIf <switch>`.

```powershell
Remove-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNamePowerOffAndSetAsImageConfiguration -Name '<Name>' -ResourceGroup 'rg-avd-production' -SubscriptionId $subscriptionId -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNamePowerOffAndSetAsImageConfiguration.md)

### Remove-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameScheduleConfigurationByConfigurationId

Remove job schedule configuration by Id

**API operation:** `DELETE /rest-api/v1/accounts/{accountId}/desktop-image/{subscriptionId}/{resourceGroup}/{name}/schedule-configuration/{configurationId}`

**Syntax:**

```text

Remove-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameScheduleConfigurationByConfigurationId [-Name] <string> [-ResourceGroup] <string> [-SubscriptionId] <string> [-ConfigurationId] <int> [-AccountId] <string> [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-ConfigurationId <Int32>`, `-Name <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-WhatIf <switch>`.

```powershell
Remove-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameScheduleConfigurationByConfigurationId -Name '<Name>' -ResourceGroup 'rg-avd-production' -SubscriptionId $subscriptionId -ConfigurationId '<ConfigurationId>' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameScheduleConfigurationByConfigurationId.md)

### Remove-NMMAccountsByAccountIdGroupsByGroupId

Delete a group from Entra ID or Active Directory by group identifier.

**API operation:** `DELETE /rest-api/v1/accounts/{accountId}/groups/{groupId}`

**Syntax:**

```text

Remove-NMMAccountsByAccountIdGroupsByGroupId [-GroupId] <string> [-AccountId] <string> [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-GroupId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-WhatIf <switch>`.

```powershell
Remove-NMMAccountsByAccountIdGroupsByGroupId -GroupId $groupId -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMAccountsByAccountIdGroupsByGroupId.md)

### Remove-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolName

Remove chosen host pool

**API operation:** `DELETE /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}`

**Syntax:**

```text

Remove-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolName [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-AccountId] <string> [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-WhatIf <switch>`.

```powershell
Remove-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolName -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolName.md)

### Remove-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAutoScalePause

Remove autoscale pause for host pool

**API operation:** `DELETE /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/auto-scale-pause`

**Syntax:**

```text

Remove-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAutoScalePause [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-AccountId] <string> [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-WhatIf <switch>`.

```powershell
Remove-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAutoScalePause -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAutoScalePause.md)

### Remove-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameDeleteBulk

Delete all hosts in the pool

**API operation:** `DELETE /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/delete-bulk`

**Syntax:**

```text

Remove-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameDeleteBulk [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Remove-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameDeleteBulk -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameDeleteBulk.md)

### Remove-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostName

Remove chosen host

**API operation:** `DELETE /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/hosts/{hostName}`

**Syntax:**

```text

Remove-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostName [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-HostName] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-HostName <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Remove-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostName -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -HostName 'avd-host-01' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostName.md)

### Remove-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameScheduleConfigurationByConfigurationId

Remove job schedule configuration by Id

**API operation:** `DELETE /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/hosts/{hostName}/schedule-configuration/{configurationId}`

**Syntax:**

```text

Remove-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameScheduleConfigurationByConfigurationId [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-HostName] <string> [-ConfigurationId] <int> [-AccountId] <string> [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-ConfigurationId <Int32>`, `-HostName <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-WhatIf <switch>`.

```powershell
Remove-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameScheduleConfigurationByConfigurationId -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -HostName 'avd-host-01' -ConfigurationId '<ConfigurationId>' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameScheduleConfigurationByConfigurationId.md)

### Remove-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameScheduleConfigurationByConfigurationId

Remove job schedule configuration by Id

**API operation:** `DELETE /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/schedule-configuration/{configurationId}`

**Syntax:**

```text

Remove-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameScheduleConfigurationByConfigurationId [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-ConfigurationId] <int> [-AccountId] <string> [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-ConfigurationId <Int32>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-WhatIf <switch>`.

```powershell
Remove-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameScheduleConfigurationByConfigurationId -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -ConfigurationId '<ConfigurationId>' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameScheduleConfigurationByConfigurationId.md)

### Remove-NMMAccountsByAccountIdInheritedVariables

Delete account inherited variable

**API operation:** `DELETE /rest-api/v1/accounts/{accountId}/inherited-variables`

**Syntax:**

```text

Remove-NMMAccountsByAccountIdInheritedVariables [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Remove-NMMAccountsByAccountIdInheritedVariables -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMAccountsByAccountIdInheritedVariables.md)

### Remove-NMMAccountsByAccountIdLocationVariables

Delete account location variable

**API operation:** `DELETE /rest-api/v1/accounts/{accountId}/location-variables`

**Syntax:**

```text

Remove-NMMAccountsByAccountIdLocationVariables [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Remove-NMMAccountsByAccountIdLocationVariables -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMAccountsByAccountIdLocationVariables.md)

### Remove-NMMAccountsByAccountIdRecoveryVaultPolicy

Delete policy from vault

**API operation:** `DELETE /rest-api/v1/accounts/{accountId}/recovery-vault/policy`

**Syntax:**

```text

Remove-NMMAccountsByAccountIdRecoveryVaultPolicy [-VaultId] <string> [-PolicyName] <string> [-AccountId] <string> [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-PolicyName <String>`, `-VaultId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-WhatIf <switch>`.

```powershell
Remove-NMMAccountsByAccountIdRecoveryVaultPolicy -VaultId '<VaultId>' -PolicyName '<PolicyName>' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMAccountsByAccountIdRecoveryVaultPolicy.md)

### Remove-NMMAccountsByAccountIdReservationsByReservationId

Delete reservation by Id

**API operation:** `DELETE /rest-api/v1/accounts/{accountId}/reservations/{reservationId}`

**Syntax:**

```text

Remove-NMMAccountsByAccountIdReservationsByReservationId [-ReservationId] <int> [-AccountId] <string> [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-ReservationId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-WhatIf <switch>`.

```powershell
Remove-NMMAccountsByAccountIdReservationsByReservationId -ReservationId '<ReservationId>' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMAccountsByAccountIdReservationsByReservationId.md)

### Remove-NMMAccountsByAccountIdResourceGroupLinked

Unlink Azure resource group

**API operation:** `DELETE /rest-api/v1/accounts/{accountId}/resource-group/linked`

**Syntax:**

```text

Remove-NMMAccountsByAccountIdResourceGroupLinked [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Remove-NMMAccountsByAccountIdResourceGroupLinked -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMAccountsByAccountIdResourceGroupLinked.md)

### Remove-NMMAccountsByAccountIdSchedulesByScheduleId

Delete the account schedule profile by id

**API operation:** `DELETE /rest-api/v1/accounts/{accountId}/schedules/{scheduleId}`

**Syntax:**

```text

Remove-NMMAccountsByAccountIdSchedulesByScheduleId [-ScheduleId] <int> [-AccountId] <string> [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-ScheduleId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-WhatIf <switch>`.

```powershell
Remove-NMMAccountsByAccountIdSchedulesByScheduleId -ScheduleId '<ScheduleId>' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMAccountsByAccountIdSchedulesByScheduleId.md)

### Remove-NMMAccountsByAccountIdScriptedActionsById

Delete account scripted action.

**API operation:** `DELETE /rest-api/v1/accounts/{accountId}/scripted-actions/{id}`

**Syntax:**

```text

Remove-NMMAccountsByAccountIdScriptedActionsById [-Id] <int> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-Id <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Remove-NMMAccountsByAccountIdScriptedActionsById -Id '<Id>' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMAccountsByAccountIdScriptedActionsById.md)

### Remove-NMMAccountsByAccountIdScriptedActionsByScriptedActionIdScheduleConfigurationByConfigurationId

Delete Azure runbook account scripted action schedule configuration by Id

**API operation:** `DELETE /rest-api/v1/accounts/{accountId}/scripted-actions/{scriptedActionId}/schedule-configuration/{configurationId}`

**Syntax:**

```text

Remove-NMMAccountsByAccountIdScriptedActionsByScriptedActionIdScheduleConfigurationByConfigurationId [-ScriptedActionId] <int> [-ConfigurationId] <int> [-AccountId] <string> [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-ConfigurationId <Int32>`, `-ScriptedActionId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-WhatIf <switch>`.

```powershell
Remove-NMMAccountsByAccountIdScriptedActionsByScriptedActionIdScheduleConfigurationByConfigurationId -ScriptedActionId '<ScriptedActionId>' -ConfigurationId '<ConfigurationId>' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMAccountsByAccountIdScriptedActionsByScriptedActionIdScheduleConfigurationByConfigurationId.md)

### Remove-NMMAccountsByAccountIdSecureVariables

Delete account secure variable

**API operation:** `DELETE /rest-api/v1/accounts/{accountId}/secure-variables`

**Syntax:**

```text

Remove-NMMAccountsByAccountIdSecureVariables [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Remove-NMMAccountsByAccountIdSecureVariables -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMAccountsByAccountIdSecureVariables.md)

### Remove-NMMAccountsByAccountIdUamAppGroupById

Delete app group.

**API operation:** `DELETE /rest-api/v1/accounts/{accountId}/uam/appGroup/{id}`

**Syntax:**

```text

Remove-NMMAccountsByAccountIdUamAppGroupById [-Id] <int> [-AccountId] <string> [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-Id <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-WhatIf <switch>`.

```powershell
Remove-NMMAccountsByAccountIdUamAppGroupById -Id '<Id>' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMAccountsByAccountIdUamAppGroupById.md)

### Remove-NMMAccountsByAccountIdUamPolicyById

Delete app deployment policy.

**API operation:** `DELETE /rest-api/v1/accounts/{accountId}/uam/policy/{id}`

**Syntax:**

```text

Remove-NMMAccountsByAccountIdUamPolicyById [-Id] <int> [-AccountId] <string> [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-Id <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-WhatIf <switch>`.

```powershell
Remove-NMMAccountsByAccountIdUamPolicyById -Id '<Id>' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMAccountsByAccountIdUamPolicyById.md)

### Remove-NMMAccountsByAccountIdUamRepoByRepoId

Unlink repository.

**API operation:** `DELETE /rest-api/v1/accounts/{accountId}/uam/repo/{repoId}`

**Syntax:**

```text

Remove-NMMAccountsByAccountIdUamRepoByRepoId [-RepoId] <int> [-AccountId] <string> [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-RepoId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-WhatIf <switch>`.

```powershell
Remove-NMMAccountsByAccountIdUamRepoByRepoId -RepoId '<RepoId>' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMAccountsByAccountIdUamRepoByRepoId.md)

### Remove-NMMAccountsByAccountIdUamRepoByRepoIdAppsFavorite

Unmark application as favorite.

**API operation:** `DELETE /rest-api/v1/accounts/{accountId}/uam/repo/{repoId}/apps/favorite`

**Syntax:**

```text

Remove-NMMAccountsByAccountIdUamRepoByRepoIdAppsFavorite [-RepoId] <int> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-RepoId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Remove-NMMAccountsByAccountIdUamRepoByRepoIdAppsFavorite -RepoId '<RepoId>' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMAccountsByAccountIdUamRepoByRepoIdAppsFavorite.md)

### Remove-NMMAccountsByAccountIdUamRepoPrivateByRepoIdAppsByExternalId

Delete application from private repo.

**API operation:** `DELETE /rest-api/v1/accounts/{accountId}/uam/repo/private/{repoId}/apps/{externalId}`

**Syntax:**

```text

Remove-NMMAccountsByAccountIdUamRepoPrivateByRepoIdAppsByExternalId [-RepoId] <int> [-ExternalId] <string> [-AccountId] <string> [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-ExternalId <String>`, `-RepoId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-WhatIf <switch>`.

```powershell
Remove-NMMAccountsByAccountIdUamRepoPrivateByRepoIdAppsByExternalId -RepoId '<RepoId>' -ExternalId '<ExternalId>' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMAccountsByAccountIdUamRepoPrivateByRepoIdAppsByExternalId.md)

### Remove-NMMAccountsByAccountIdUamRepoPrivateShellAppsByAppId

Delete Shell application.

**API operation:** `DELETE /rest-api/v1/accounts/{accountId}/uam/repo/private/shell/apps/{appId}`

**Syntax:**

```text

Remove-NMMAccountsByAccountIdUamRepoPrivateShellAppsByAppId [-AppId] <int> [-AccountId] <string> [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-AppId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-WhatIf <switch>`.

```powershell
Remove-NMMAccountsByAccountIdUamRepoPrivateShellAppsByAppId -AppId '<AppId>' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMAccountsByAccountIdUamRepoPrivateShellAppsByAppId.md)

### Remove-NMMAccountsByAccountIdUamRepoPrivateShellByRepoId

Delete shell repository

**API operation:** `DELETE /rest-api/v1/accounts/{accountId}/uam/repo/private/shell/{repoId}`

**Syntax:**

```text

Remove-NMMAccountsByAccountIdUamRepoPrivateShellByRepoId [-RepoId] <int> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-RepoId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Remove-NMMAccountsByAccountIdUamRepoPrivateShellByRepoId -RepoId '<RepoId>' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMAccountsByAccountIdUamRepoPrivateShellByRepoId.md)

### Remove-NMMAccountsByAccountIdUamRepoPrivateShellByRepoIdUnlinkstorage

Unlink account shell repository storage

**API operation:** `DELETE /rest-api/v1/accounts/{accountId}/uam/repo/private/shell/{repoId}/unlinkstorage`

**Syntax:**

```text

Remove-NMMAccountsByAccountIdUamRepoPrivateShellByRepoIdUnlinkstorage [-RepoId] <int> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-RepoId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Remove-NMMAccountsByAccountIdUamRepoPrivateShellByRepoIdUnlinkstorage -RepoId '<RepoId>' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMAccountsByAccountIdUamRepoPrivateShellByRepoIdUnlinkstorage.md)

### Remove-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoId

Delete private winget repository

**API operation:** `DELETE /rest-api/v1/accounts/{accountId}/uam/repo/private/winget/{repoId}`

**Syntax:**

```text

Remove-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoId [-RepoId] <int> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-RepoId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Remove-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoId -RepoId '<RepoId>' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoId.md)

### Remove-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersion

Delete version of WinGet application.

**API operation:** `DELETE /rest-api/v1/accounts/{accountId}/uam/repo/private/winget/{repoId}/apps/{packageId}/version/{appVersion}`

**Syntax:**

```text

Remove-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersion [-RepoId] <int> [-PackageId] <string> [-AppVersion] <string> [-AccountId] <string> [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-AppVersion <String>`, `-PackageId <String>`, `-RepoId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-WhatIf <switch>`.

```powershell
Remove-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersion -RepoId '<RepoId>' -PackageId '<PackageId>' -AppVersion '<AppVersion>' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersion.md)

### Remove-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersionInstallerByInstallerId

Delete installer of specific version of WinGet application.

**API operation:** `DELETE /rest-api/v1/accounts/{accountId}/uam/repo/private/winget/{repoId}/apps/{packageId}/version/{appVersion}/installer/{installerId}`

**Syntax:**

```text

Remove-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersionInstallerByInstallerId [-RepoId] <int> [-PackageId] <string> [-AppVersion] <string> [-InstallerId] <string> [-AccountId] <string> [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-AppVersion <String>`, `-InstallerId <String>`, `-PackageId <String>`, `-RepoId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-WhatIf <switch>`.

```powershell
Remove-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersionInstallerByInstallerId -RepoId '<RepoId>' -PackageId '<PackageId>' -AppVersion '<AppVersion>' -InstallerId '<InstallerId>' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersionInstallerByInstallerId.md)

### Remove-NMMAccountsByAccountIdUsersByUserId

Delete a user from Entra ID or Active directory by user identifier.

**API operation:** `DELETE /rest-api/v1/accounts/{accountId}/users/{userId}`

**Syntax:**

```text

Remove-NMMAccountsByAccountIdUsersByUserId [-UserId] <string> [-AccountId] <string> [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-UserId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-WhatIf <switch>`.

```powershell
Remove-NMMAccountsByAccountIdUsersByUserId -UserId $userId -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMAccountsByAccountIdUsersByUserId.md)

### Remove-NMMAccountsByAccountIdUsersMfaRegistrationByUserId

Reset MFA registration for user.

**API operation:** `DELETE /rest-api/v1/accounts/{accountId}/users/mfaRegistration/{userId}`

**Syntax:**

```text

Remove-NMMAccountsByAccountIdUsersMfaRegistrationByUserId [-UserId] <string> [-AccountId] <string> [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-UserId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-WhatIf <switch>`.

```powershell
Remove-NMMAccountsByAccountIdUsersMfaRegistrationByUserId -UserId $userId -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMAccountsByAccountIdUsersMfaRegistrationByUserId.md)

### Remove-NMMAccountsByAccountIdUsersSignInSessionsByUserId

Revoke all sign-in sessions for user.

**API operation:** `DELETE /rest-api/v1/accounts/{accountId}/users/signInSessions/{userId}`

**Syntax:**

```text

Remove-NMMAccountsByAccountIdUsersSignInSessionsByUserId [-UserId] <string> [-AccountId] <string> [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-UserId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-WhatIf <switch>`.

```powershell
Remove-NMMAccountsByAccountIdUsersSignInSessionsByUserId -UserId $userId -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMAccountsByAccountIdUsersSignInSessionsByUserId.md)

### Remove-NMMAppRoleAssignments

Unassign app role from principals.

**API operation:** `DELETE /rest-api/v1/app-role-assignments`

**Syntax:**

```text

Remove-NMMAppRoleAssignments [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Remove-NMMAppRoleAssignments -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMAppRoleAssignments.md)

### Remove-NMMAutoscaleProfilesByProfileId

Delete the global auto-scale profile by id

**API operation:** `DELETE /rest-api/v1/autoscale-profiles/{profileId}`

**Syntax:**

```text

Remove-NMMAutoscaleProfilesByProfileId [-ProfileId] <int> [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-ProfileId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-WhatIf <switch>`.

```powershell
Remove-NMMAutoscaleProfilesByProfileId -ProfileId '<ProfileId>' -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMAutoscaleProfilesByProfileId.md)

### Remove-NMMAutoscaleProfilesByProfileIdAssignments

Delete the global auto-scale profile assignment

**API operation:** `DELETE /rest-api/v1/autoscale-profiles/{profileId}/assignments`

**Syntax:**

```text

Remove-NMMAutoscaleProfilesByProfileIdAssignments [-ProfileId] <int> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-ProfileId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Remove-NMMAutoscaleProfilesByProfileIdAssignments -ProfileId '<ProfileId>' -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMAutoscaleProfilesByProfileIdAssignments.md)

### Remove-NMMInheritedVariables

Delete msp inherited variable

**API operation:** `DELETE /rest-api/v1/inherited-variables`

**Syntax:**

```text

Remove-NMMInheritedVariables [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Remove-NMMInheritedVariables -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMInheritedVariables.md)

### Remove-NMMLocationVariables

Delete msp location variable

**API operation:** `DELETE /rest-api/v1/location-variables`

**Syntax:**

```text

Remove-NMMLocationVariables [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Remove-NMMLocationVariables -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMLocationVariables.md)

### Remove-NMMResourceGroupLinked

Unlink Azure resource group

**API operation:** `DELETE /rest-api/v1/resource-group/linked`

**Syntax:**

```text

Remove-NMMResourceGroupLinked [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Remove-NMMResourceGroupLinked -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMResourceGroupLinked.md)

### Remove-NMMSchedulesByScheduleId

Delete the global schedule profile by id

**API operation:** `DELETE /rest-api/v1/schedules/{scheduleId}`

**Syntax:**

```text

Remove-NMMSchedulesByScheduleId [-ScheduleId] <int> [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-ScheduleId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-WhatIf <switch>`.

```powershell
Remove-NMMSchedulesByScheduleId -ScheduleId '<ScheduleId>' -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMSchedulesByScheduleId.md)

### Remove-NMMScriptedActionsById

Delete msp scripted action.

**API operation:** `DELETE /rest-api/v1/scripted-actions/{id}`

**Syntax:**

```text

Remove-NMMScriptedActionsById [-Id] <int> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-Id <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Remove-NMMScriptedActionsById -Id '<Id>' -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMScriptedActionsById.md)

### Remove-NMMScriptedActionsByScriptedActionIdScheduleConfigurationByConfigurationId

Delete Azure runbook msp scripted action schedule configuration by Id

**API operation:** `DELETE /rest-api/v1/scripted-actions/{scriptedActionId}/schedule-configuration/{configurationId}`

**Syntax:**

```text

Remove-NMMScriptedActionsByScriptedActionIdScheduleConfigurationByConfigurationId [-ScriptedActionId] <int> [-ConfigurationId] <int> [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-ConfigurationId <Int32>`, `-ScriptedActionId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-WhatIf <switch>`.

```powershell
Remove-NMMScriptedActionsByScriptedActionIdScheduleConfigurationByConfigurationId -ScriptedActionId '<ScriptedActionId>' -ConfigurationId '<ConfigurationId>' -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMScriptedActionsByScriptedActionIdScheduleConfigurationByConfigurationId.md)

### Remove-NMMSecureVariables

Delete msp secure variable

**API operation:** `DELETE /rest-api/v1/secure-variables`

**Syntax:**

```text

Remove-NMMSecureVariables [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Remove-NMMSecureVariables -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMSecureVariables.md)

### Remove-NMMUamAppGroupById

Delete app group.

**API operation:** `DELETE /rest-api/v1/uam/appGroup/{id}`

**Syntax:**

```text

Remove-NMMUamAppGroupById [-Id] <int> [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-Id <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-WhatIf <switch>`.

```powershell
Remove-NMMUamAppGroupById -Id '<Id>' -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMUamAppGroupById.md)

### Remove-NMMUamPolicyById

Delete MSP app deployment policy.

**API operation:** `DELETE /rest-api/v1/uam/policy/{id}`

**Syntax:**

```text

Remove-NMMUamPolicyById [-Id] <int> [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-Id <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-WhatIf <switch>`.

```powershell
Remove-NMMUamPolicyById -Id '<Id>' -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMUamPolicyById.md)

### Remove-NMMUamRepoByRepoId

Unlink repository.

**API operation:** `DELETE /rest-api/v1/uam/repo/{repoId}`

**Syntax:**

```text

Remove-NMMUamRepoByRepoId [-RepoId] <int> [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-RepoId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-WhatIf <switch>`.

```powershell
Remove-NMMUamRepoByRepoId -RepoId '<RepoId>' -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMUamRepoByRepoId.md)

### Remove-NMMUamRepoByRepoIdAppsFavorite

Unmark application as favorite.

**API operation:** `DELETE /rest-api/v1/uam/repo/{repoId}/apps/favorite`

**Syntax:**

```text

Remove-NMMUamRepoByRepoIdAppsFavorite [-RepoId] <int> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-RepoId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Remove-NMMUamRepoByRepoIdAppsFavorite -RepoId '<RepoId>' -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMUamRepoByRepoIdAppsFavorite.md)

### Remove-NMMUamRepoPrivateByRepoIdAppsByExternalId

Delete application from private repo.

**API operation:** `DELETE /rest-api/v1/uam/repo/private/{repoId}/apps/{externalId}`

**Syntax:**

```text

Remove-NMMUamRepoPrivateByRepoIdAppsByExternalId [-RepoId] <int> [-ExternalId] <string> [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-ExternalId <String>`, `-RepoId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-WhatIf <switch>`.

```powershell
Remove-NMMUamRepoPrivateByRepoIdAppsByExternalId -RepoId '<RepoId>' -ExternalId '<ExternalId>' -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMUamRepoPrivateByRepoIdAppsByExternalId.md)

### Remove-NMMUamRepoPrivateShellAppsByAppId

Delete Shell application.

**API operation:** `DELETE /rest-api/v1/uam/repo/private/shell/apps/{appId}`

**Syntax:**

```text

Remove-NMMUamRepoPrivateShellAppsByAppId [-AppId] <int> [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AppId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-WhatIf <switch>`.

```powershell
Remove-NMMUamRepoPrivateShellAppsByAppId -AppId '<AppId>' -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMUamRepoPrivateShellAppsByAppId.md)

### Remove-NMMUamRepoPrivateShellByRepoId

Delete shell repository

**API operation:** `DELETE /rest-api/v1/uam/repo/private/shell/{repoId}`

**Syntax:**

```text

Remove-NMMUamRepoPrivateShellByRepoId [-RepoId] <int> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-RepoId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Remove-NMMUamRepoPrivateShellByRepoId -RepoId '<RepoId>' -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMUamRepoPrivateShellByRepoId.md)

### Remove-NMMUamRepoPrivateShellByRepoIdUnlinkstorage

Unlinks storage to MSP Shell Apps repository

**API operation:** `DELETE /rest-api/v1/uam/repo/private/shell/{repoId}/unlinkstorage`

**Syntax:**

```text

Remove-NMMUamRepoPrivateShellByRepoIdUnlinkstorage [-RepoId] <int> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-RepoId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Remove-NMMUamRepoPrivateShellByRepoIdUnlinkstorage -RepoId '<RepoId>' -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMUamRepoPrivateShellByRepoIdUnlinkstorage.md)

### Remove-NMMUamRepoPrivateWingetByRepoId

Delete private winget repository

**API operation:** `DELETE /rest-api/v1/uam/repo/private/winget/{repoId}`

**Syntax:**

```text

Remove-NMMUamRepoPrivateWingetByRepoId [-RepoId] <int> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-RepoId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Remove-NMMUamRepoPrivateWingetByRepoId -RepoId '<RepoId>' -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMUamRepoPrivateWingetByRepoId.md)

### Remove-NMMUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersion

Delete version of WinGet application.

**API operation:** `DELETE /rest-api/v1/uam/repo/private/winget/{repoId}/apps/{packageId}/version/{appVersion}`

**Syntax:**

```text

Remove-NMMUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersion [-RepoId] <int> [-PackageId] <string> [-AppVersion] <string> [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AppVersion <String>`, `-PackageId <String>`, `-RepoId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-WhatIf <switch>`.

```powershell
Remove-NMMUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersion -RepoId '<RepoId>' -PackageId '<PackageId>' -AppVersion '<AppVersion>' -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersion.md)

### Remove-NMMUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersionInstallerByInstallerId

Delete installer of specific version of WinGet application.

**API operation:** `DELETE /rest-api/v1/uam/repo/private/winget/{repoId}/apps/{packageId}/version/{appVersion}/installer/{installerId}`

**Syntax:**

```text

Remove-NMMUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersionInstallerByInstallerId [-RepoId] <int> [-PackageId] <string> [-AppVersion] <string> [-InstallerId] <string> [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AppVersion <String>`, `-InstallerId <String>`, `-PackageId <String>`, `-RepoId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-WhatIf <switch>`.

```powershell
Remove-NMMUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersionInstallerByInstallerId -RepoId '<RepoId>' -PackageId '<PackageId>' -AppVersion '<AppVersion>' -InstallerId '<InstallerId>' -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Remove-NMMUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersionInstallerByInstallerId.md)

### Set-NMMAccountsByAccountIdAutoscaleProfilesByProfileId

Update the account auto-scale profile

**API operation:** `PUT /rest-api/v1/accounts/{accountId}/autoscale-profiles/{profileId}`

**Syntax:**

```text

Set-NMMAccountsByAccountIdAutoscaleProfilesByProfileId [-ProfileId] <int> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-ProfileId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMAccountsByAccountIdAutoscaleProfilesByProfileId -ProfileId '<ProfileId>' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMAccountsByAccountIdAutoscaleProfilesByProfileId.md)

### Set-NMMAccountsByAccountIdAutoscaleProfilesByProfileIdAssignments

Update an auto-scale configuration schedule

**API operation:** `PUT /rest-api/v1/accounts/{accountId}/autoscale-profiles/{profileId}/assignments`

**Syntax:**

```text

Set-NMMAccountsByAccountIdAutoscaleProfilesByProfileIdAssignments [-ProfileId] <int> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-ProfileId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMAccountsByAccountIdAutoscaleProfilesByProfileIdAssignments -ProfileId '<ProfileId>' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMAccountsByAccountIdAutoscaleProfilesByProfileIdAssignments.md)

### Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameRestart

Restart current desktop image

**API operation:** `PUT /rest-api/v1/accounts/{accountId}/desktop-image/{subscriptionId}/{resourceGroup}/{name}/restart`

**Syntax:**

```text

Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameRestart [-Name] <string> [-ResourceGroup] <string> [-SubscriptionId] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-Name <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameRestart -Name '<Name>' -ResourceGroup 'rg-avd-production' -SubscriptionId $subscriptionId -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameRestart.md)

### Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameRunScript

Run scripted actions on desktop image

**API operation:** `PUT /rest-api/v1/accounts/{accountId}/desktop-image/{subscriptionId}/{resourceGroup}/{name}/run-script`

**Syntax:**

```text

Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameRunScript [-Name] <string> [-ResourceGroup] <string> [-SubscriptionId] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-Name <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameRunScript -Name '<Name>' -ResourceGroup 'rg-avd-production' -SubscriptionId $subscriptionId -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameRunScript.md)

### Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameScheduleRunScript

Run scripted actions on desktop image

**API operation:** `PUT /rest-api/v1/accounts/{accountId}/desktop-image/{subscriptionId}/{resourceGroup}/{name}/schedule/run-script`

**Syntax:**

```text

Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameScheduleRunScript [-Name] <string> [-ResourceGroup] <string> [-SubscriptionId] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-Name <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameScheduleRunScript -Name '<Name>' -ResourceGroup 'rg-avd-production' -SubscriptionId $subscriptionId -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameScheduleRunScript.md)

### Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameScheduleSetAsImage

Power off and set as image

**API operation:** `PUT /rest-api/v1/accounts/{accountId}/desktop-image/{subscriptionId}/{resourceGroup}/{name}/schedule/set-as-image`

**Syntax:**

```text

Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameScheduleSetAsImage [-Name] <string> [-ResourceGroup] <string> [-SubscriptionId] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-Name <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameScheduleSetAsImage -Name '<Name>' -ResourceGroup 'rg-avd-production' -SubscriptionId $subscriptionId -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameScheduleSetAsImage.md)

### Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameScheduleStart

Power on current desktop image

**API operation:** `PUT /rest-api/v1/accounts/{accountId}/desktop-image/{subscriptionId}/{resourceGroup}/{name}/schedule/start`

**Syntax:**

```text

Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameScheduleStart [-Name] <string> [-ResourceGroup] <string> [-SubscriptionId] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-Name <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameScheduleStart -Name '<Name>' -ResourceGroup 'rg-avd-production' -SubscriptionId $subscriptionId -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameScheduleStart.md)

### Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameSetAsImage

Power off and set as image

**API operation:** `PUT /rest-api/v1/accounts/{accountId}/desktop-image/{subscriptionId}/{resourceGroup}/{name}/set-as-image`

**Syntax:**

```text

Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameSetAsImage [-Name] <string> [-ResourceGroup] <string> [-SubscriptionId] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-Name <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameSetAsImage -Name '<Name>' -ResourceGroup 'rg-avd-production' -SubscriptionId $subscriptionId -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameSetAsImage.md)

### Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameStart

Power on current desktop image

**API operation:** `PUT /rest-api/v1/accounts/{accountId}/desktop-image/{subscriptionId}/{resourceGroup}/{name}/start`

**Syntax:**

```text

Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameStart [-Name] <string> [-ResourceGroup] <string> [-SubscriptionId] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-Name <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameStart -Name '<Name>' -ResourceGroup 'rg-avd-production' -SubscriptionId $subscriptionId -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameStart.md)

### Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameStop

Power off current desktop image

**API operation:** `PUT /rest-api/v1/accounts/{accountId}/desktop-image/{subscriptionId}/{resourceGroup}/{name}/stop`

**Syntax:**

```text

Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameStop [-Name] <string> [-ResourceGroup] <string> [-SubscriptionId] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-Name <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameStop -Name '<Name>' -ResourceGroup 'rg-avd-production' -SubscriptionId $subscriptionId -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameStop.md)

### Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameValidate

Validate current desktop image

**API operation:** `PUT /rest-api/v1/accounts/{accountId}/desktop-image/{subscriptionId}/{resourceGroup}/{name}/validate`

**Syntax:**

```text

Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameValidate [-Name] <string> [-ResourceGroup] <string> [-SubscriptionId] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-Name <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameValidate -Name '<Name>' -ResourceGroup 'rg-avd-production' -SubscriptionId $subscriptionId -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameValidate.md)

### Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameActiveDirectory

Set the host pool active directory

**API operation:** `PUT /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/active-directory`

**Syntax:**

```text

Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameActiveDirectory [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameActiveDirectory -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameActiveDirectory.md)

### Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAutoScaleEnable

Enable/Disable autoscale for host pool with current configuration

**API operation:** `PUT /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/auto-scale-enable`

**Syntax:**

```text

Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAutoScaleEnable [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAutoScaleEnable -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAutoScaleEnable.md)

### Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAutoScalePause

Pause autoscale for host pool

**API operation:** `PUT /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/auto-scale-pause`

**Syntax:**

```text

Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAutoScalePause [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAutoScalePause -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAutoScalePause.md)

### Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAutoscaleSettings

Update host pool current autoscale settings

**API operation:** `PUT /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/autoscale-settings`

**Syntax:**

```text

Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAutoscaleSettings [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAutoscaleSettings -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAutoscaleSettings.md)

### Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAvd

Set the host pool properties

**API operation:** `PUT /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/avd`

**Syntax:**

```text

Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAvd [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAvd -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameAvd.md)

### Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameCapacityExtenderProperties

Set host pool capacity extender properties

**API operation:** `PUT /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/capacity-extender-properties`

**Syntax:**

```text

Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameCapacityExtenderProperties [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameCapacityExtenderProperties -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameCapacityExtenderProperties.md)

### Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameDisconnect

Disconnect all users from host pool.

**API operation:** `PUT /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/disconnect`

**Syntax:**

```text

Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameDisconnect [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameDisconnect -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameDisconnect.md)

### Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameFslogix

Set the host pool FSLogix config

**API operation:** `PUT /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/fslogix`

**Syntax:**

```text

Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameFslogix [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameFslogix -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameFslogix.md)

### Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameRunScript

Run scripted actions on host

**API operation:** `PUT /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/hosts/{hostName}/run-script`

**Syntax:**

```text

Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameRunScript [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-HostName] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-HostName <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameRunScript -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -HostName 'avd-host-01' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameRunScript.md)

### Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameLogoff

Log off all users.

**API operation:** `PUT /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/logoff`

**Syntax:**

```text

Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameLogoff [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameLogoff -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameLogoff.md)

### Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameRdpSettings

Set host pool RDP settings

**API operation:** `PUT /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/rdp-settings`

**Syntax:**

```text

Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameRdpSettings [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameRdpSettings -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameRdpSettings.md)

### Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameSendMessage

Send message to all sessions for host pool.

**API operation:** `PUT /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/send-message`

**Syntax:**

```text

Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameSendMessage [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameSendMessage -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameSendMessage.md)

### Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameSessionTimeouts

Set the host pool session timeouts

**API operation:** `PUT /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/session-timeouts`

**Syntax:**

```text

Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameSessionTimeouts [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameSessionTimeouts -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameSessionTimeouts.md)

### Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameTags

Update the host pool tags

**API operation:** `PUT /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/tags`

**Syntax:**

```text

Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameTags [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameTags -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameTags.md)

### Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameVmDeployment

Set host pool VM deployment settings

**API operation:** `PUT /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/vm-deployment`

**Syntax:**

```text

Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameVmDeployment [-SubscriptionId] <string> [-ResourceGroup] <string> [-PoolName] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-PoolName <String>`, `-ResourceGroup <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameVmDeployment -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -PoolName 'avd-production' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameVmDeployment.md)

### Set-NMMAccountsByAccountIdInheritedVariables

Set account inherited variable value

**API operation:** `PUT /rest-api/v1/accounts/{accountId}/inherited-variables`

**Syntax:**

```text

Set-NMMAccountsByAccountIdInheritedVariables [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMAccountsByAccountIdInheritedVariables -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMAccountsByAccountIdInheritedVariables.md)

### Set-NMMAccountsByAccountIdLocationVariables

Set account location variable value

**API operation:** `PUT /rest-api/v1/accounts/{accountId}/location-variables`

**Syntax:**

```text

Set-NMMAccountsByAccountIdLocationVariables [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMAccountsByAccountIdLocationVariables -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMAccountsByAccountIdLocationVariables.md)

### Set-NMMAccountsByAccountIdReservationsByReservationId

Update existing reservation

**API operation:** `PUT /rest-api/v1/accounts/{accountId}/reservations/{reservationId}`

**Syntax:**

```text

Set-NMMAccountsByAccountIdReservationsByReservationId [-ReservationId] <int> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-ReservationId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMAccountsByAccountIdReservationsByReservationId -ReservationId '<ReservationId>' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMAccountsByAccountIdReservationsByReservationId.md)

### Set-NMMAccountsByAccountIdResourceGroupSetDefault

Set Azure resource group as default

**API operation:** `PUT /rest-api/v1/accounts/{accountId}/resource-group/setDefault`

**Syntax:**

```text

Set-NMMAccountsByAccountIdResourceGroupSetDefault [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMAccountsByAccountIdResourceGroupSetDefault -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMAccountsByAccountIdResourceGroupSetDefault.md)

### Set-NMMAccountsByAccountIdSchedulesByScheduleId

Update the account schedule profile

**API operation:** `PUT /rest-api/v1/accounts/{accountId}/schedules/{scheduleId}`

**Syntax:**

```text

Set-NMMAccountsByAccountIdSchedulesByScheduleId [-ScheduleId] <int> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-ScheduleId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMAccountsByAccountIdSchedulesByScheduleId -ScheduleId '<ScheduleId>' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMAccountsByAccountIdSchedulesByScheduleId.md)

### Set-NMMAccountsByAccountIdScriptedActionsById

Update account scripted action.

**API operation:** `PUT /rest-api/v1/accounts/{accountId}/scripted-actions/{id}`

**Syntax:**

```text

Set-NMMAccountsByAccountIdScriptedActionsById [-Id] <int> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-Id <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMAccountsByAccountIdScriptedActionsById -Id '<Id>' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMAccountsByAccountIdScriptedActionsById.md)

### Set-NMMAccountsByAccountIdSecureVariables

Update account secure variable

**API operation:** `PUT /rest-api/v1/accounts/{accountId}/secure-variables`

**Syntax:**

```text

Set-NMMAccountsByAccountIdSecureVariables [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMAccountsByAccountIdSecureVariables -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMAccountsByAccountIdSecureVariables.md)

### Set-NMMAccountsByAccountIdStorageAzureFilesBySubscriptionIdByResourceGroupByStorageAccountNameByShareNameAutoScale

Update Azure Files autoscale

**API operation:** `PUT /rest-api/v1/accounts/{accountId}/storage/azure-files/{subscriptionId}/{resourceGroup}/{storageAccountName}/{shareName}/auto-scale`

**Syntax:**

```text

Set-NMMAccountsByAccountIdStorageAzureFilesBySubscriptionIdByResourceGroupByStorageAccountNameByShareNameAutoScale [-SubscriptionId] <string> [-ResourceGroup] <string> [-StorageAccountName] <string> [-ShareName] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-ResourceGroup <String>`, `-ShareName <String>`, `-StorageAccountName <String>`, `-SubscriptionId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMAccountsByAccountIdStorageAzureFilesBySubscriptionIdByResourceGroupByStorageAccountNameByShareNameAutoScale -SubscriptionId $subscriptionId -ResourceGroup 'rg-avd-production' -StorageAccountName '<StorageAccountName>' -ShareName '<ShareName>' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMAccountsByAccountIdStorageAzureFilesBySubscriptionIdByResourceGroupByStorageAccountNameByShareNameAutoScale.md)

### Set-NMMAccountsByAccountIdUamAppGroupById

Update app group.

**API operation:** `PUT /rest-api/v1/accounts/{accountId}/uam/appGroup/{id}`

**Syntax:**

```text

Set-NMMAccountsByAccountIdUamAppGroupById [-Id] <int> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-Id <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMAccountsByAccountIdUamAppGroupById -Id '<Id>' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMAccountsByAccountIdUamAppGroupById.md)

### Set-NMMAccountsByAccountIdUamPolicyById

Update app deployment policy.

**API operation:** `PUT /rest-api/v1/accounts/{accountId}/uam/policy/{id}`

**Syntax:**

```text

Set-NMMAccountsByAccountIdUamPolicyById [-Id] <int> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-Id <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMAccountsByAccountIdUamPolicyById -Id '<Id>' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMAccountsByAccountIdUamPolicyById.md)

### Set-NMMAccountsByAccountIdUamPolicyByIdActivate

Activate app deployment policy.

**API operation:** `PUT /rest-api/v1/accounts/{accountId}/uam/policy/{id}/activate`

**Syntax:**

```text

Set-NMMAccountsByAccountIdUamPolicyByIdActivate [-Id] <int> [-AccountId] <string> [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-Id <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-WhatIf <switch>`.

```powershell
Set-NMMAccountsByAccountIdUamPolicyByIdActivate -Id '<Id>' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMAccountsByAccountIdUamPolicyByIdActivate.md)

### Set-NMMAccountsByAccountIdUamPolicyByIdDeactivate

Deactivate app deployment policy.

**API operation:** `PUT /rest-api/v1/accounts/{accountId}/uam/policy/{id}/deactivate`

**Syntax:**

```text

Set-NMMAccountsByAccountIdUamPolicyByIdDeactivate [-Id] <int> [-AccountId] <string> [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-Id <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-WhatIf <switch>`.

```powershell
Set-NMMAccountsByAccountIdUamPolicyByIdDeactivate -Id '<Id>' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMAccountsByAccountIdUamPolicyByIdDeactivate.md)

### Set-NMMAccountsByAccountIdUamPolicyByIdRun

Force run app deployment policy.

**API operation:** `PUT /rest-api/v1/accounts/{accountId}/uam/policy/{id}/run`

**Syntax:**

```text

Set-NMMAccountsByAccountIdUamPolicyByIdRun [-Id] <int> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-Id <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMAccountsByAccountIdUamPolicyByIdRun -Id '<Id>' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMAccountsByAccountIdUamPolicyByIdRun.md)

### Set-NMMAccountsByAccountIdUamRepoByRepoId

Update linked repository

**API operation:** `PUT /rest-api/v1/accounts/{accountId}/uam/repo/{repoId}`

**Syntax:**

```text

Set-NMMAccountsByAccountIdUamRepoByRepoId [-RepoId] <int> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-RepoId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMAccountsByAccountIdUamRepoByRepoId -RepoId '<RepoId>' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMAccountsByAccountIdUamRepoByRepoId.md)

### Set-NMMAccountsByAccountIdUamRepoPrivateShellAppsByAppId

Update Shell application.

**API operation:** `PUT /rest-api/v1/accounts/{accountId}/uam/repo/private/shell/apps/{appId}`

**Syntax:**

```text

Set-NMMAccountsByAccountIdUamRepoPrivateShellAppsByAppId [-AppId] <int> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-AppId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMAccountsByAccountIdUamRepoPrivateShellAppsByAppId -AppId '<AppId>' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMAccountsByAccountIdUamRepoPrivateShellAppsByAppId.md)

### Set-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsByPackageIdUpdate

Update WinGet application.

**API operation:** `PUT /rest-api/v1/accounts/{accountId}/uam/repo/private/winget/{repoId}/apps/{packageId}/update`

**Syntax:**

```text

Set-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsByPackageIdUpdate [-RepoId] <int> [-PackageId] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-PackageId <String>`, `-RepoId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsByPackageIdUpdate -RepoId '<RepoId>' -PackageId '<PackageId>' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsByPackageIdUpdate.md)

### Set-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersion

Update version of WinGet application.

**API operation:** `PUT /rest-api/v1/accounts/{accountId}/uam/repo/private/winget/{repoId}/apps/{packageId}/version/{appVersion}`

**Syntax:**

```text

Set-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersion [-RepoId] <int> [-PackageId] <string> [-AppVersion] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-AppVersion <String>`, `-PackageId <String>`, `-RepoId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersion -RepoId '<RepoId>' -PackageId '<PackageId>' -AppVersion '<AppVersion>' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersion.md)

### Set-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersionInstallerByInstallerId

Update installer of specific version of WinGet application.

**API operation:** `PUT /rest-api/v1/accounts/{accountId}/uam/repo/private/winget/{repoId}/apps/{packageId}/version/{appVersion}/installer/{installerId}`

**Syntax:**

```text

Set-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersionInstallerByInstallerId [-RepoId] <int> [-PackageId] <string> [-AppVersion] <string> [-InstallerId] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-AppVersion <String>`, `-InstallerId <String>`, `-PackageId <String>`, `-RepoId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersionInstallerByInstallerId -RepoId '<RepoId>' -PackageId '<PackageId>' -AppVersion '<AppVersion>' -InstallerId '<InstallerId>' -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMAccountsByAccountIdUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersionInstallerByInstallerId.md)

### Set-NMMAccountsByAccountIdUsersPerUserMfaStateByUserId

Update per-user MFA state for user.

**API operation:** `PUT /rest-api/v1/accounts/{accountId}/users/perUserMfaState/{userId}`

**Syntax:**

```text

Set-NMMAccountsByAccountIdUsersPerUserMfaStateByUserId [-UserId] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-UserId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMAccountsByAccountIdUsersPerUserMfaStateByUserId -UserId $userId -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMAccountsByAccountIdUsersPerUserMfaStateByUserId.md)

### Set-NMMAppRoleAssignments

Update app role for principal.

**API operation:** `PUT /rest-api/v1/app-role-assignments`

**Syntax:**

```text

Set-NMMAppRoleAssignments [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMAppRoleAssignments -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMAppRoleAssignments.md)

### Set-NMMAutoscaleProfilesByProfileId

Update the global auto-scale profile

**API operation:** `PUT /rest-api/v1/autoscale-profiles/{profileId}`

**Syntax:**

```text

Set-NMMAutoscaleProfilesByProfileId [-ProfileId] <int> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-ProfileId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMAutoscaleProfilesByProfileId -ProfileId '<ProfileId>' -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMAutoscaleProfilesByProfileId.md)

### Set-NMMAutoscaleProfilesByProfileIdAssignments

Update an auto-scale configuration schedule

**API operation:** `PUT /rest-api/v1/autoscale-profiles/{profileId}/assignments`

**Syntax:**

```text

Set-NMMAutoscaleProfilesByProfileIdAssignments [-ProfileId] <int> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-ProfileId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMAutoscaleProfilesByProfileIdAssignments -ProfileId '<ProfileId>' -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMAutoscaleProfilesByProfileIdAssignments.md)

### Set-NMMInheritedVariables

Update msp inherited variable

**API operation:** `PUT /rest-api/v1/inherited-variables`

**Syntax:**

```text

Set-NMMInheritedVariables [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMInheritedVariables -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMInheritedVariables.md)

### Set-NMMLocationVariables

Update msp location variable

**API operation:** `PUT /rest-api/v1/location-variables`

**Syntax:**

```text

Set-NMMLocationVariables [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMLocationVariables -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMLocationVariables.md)

### Set-NMMResourceGroupSetDefault

Set Azure resource group as default

**API operation:** `PUT /rest-api/v1/resource-group/setDefault`

**Syntax:**

```text

Set-NMMResourceGroupSetDefault [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMResourceGroupSetDefault -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMResourceGroupSetDefault.md)

### Set-NMMSchedulesByScheduleId

Update the global schedule profile

**API operation:** `PUT /rest-api/v1/schedules/{scheduleId}`

**Syntax:**

```text

Set-NMMSchedulesByScheduleId [-ScheduleId] <int> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-ScheduleId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMSchedulesByScheduleId -ScheduleId '<ScheduleId>' -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMSchedulesByScheduleId.md)

### Set-NMMScriptedActionsById

Update msp scripted action.

**API operation:** `PUT /rest-api/v1/scripted-actions/{id}`

**Syntax:**

```text

Set-NMMScriptedActionsById [-Id] <int> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-Id <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMScriptedActionsById -Id '<Id>' -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMScriptedActionsById.md)

### Set-NMMSecureVariables

Update msp secure variable

**API operation:** `PUT /rest-api/v1/secure-variables`

**Syntax:**

```text

Set-NMMSecureVariables [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** None.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMSecureVariables -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMSecureVariables.md)

### Set-NMMUamAppGroupById

Update app group.

**API operation:** `PUT /rest-api/v1/uam/appGroup/{id}`

**Syntax:**

```text

Set-NMMUamAppGroupById [-Id] <int> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-Id <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMUamAppGroupById -Id '<Id>' -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMUamAppGroupById.md)

### Set-NMMUamAppGroupByIdAssign

Assign app group.

**API operation:** `PUT /rest-api/v1/uam/appGroup/{id}/assign`

**Syntax:**

```text

Set-NMMUamAppGroupByIdAssign [-Id] <int> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-Id <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMUamAppGroupByIdAssign -Id '<Id>' -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMUamAppGroupByIdAssign.md)

### Set-NMMUamPolicyById

Update MSP app deployment policy.

**API operation:** `PUT /rest-api/v1/uam/policy/{id}`

**Syntax:**

```text

Set-NMMUamPolicyById [-Id] <int> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-Id <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMUamPolicyById -Id '<Id>' -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMUamPolicyById.md)

### Set-NMMUamPolicyByIdActivate

Activate MSP app deployment policy.

**API operation:** `PUT /rest-api/v1/uam/policy/{id}/activate`

**Syntax:**

```text

Set-NMMUamPolicyByIdActivate [-Id] <int> [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-Id <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-WhatIf <switch>`.

```powershell
Set-NMMUamPolicyByIdActivate -Id '<Id>' -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMUamPolicyByIdActivate.md)

### Set-NMMUamPolicyByIdDeactivate

Deactivate MSP app deployment policy.

**API operation:** `PUT /rest-api/v1/uam/policy/{id}/deactivate`

**Syntax:**

```text

Set-NMMUamPolicyByIdDeactivate [-Id] <int> [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-Id <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-WhatIf <switch>`.

```powershell
Set-NMMUamPolicyByIdDeactivate -Id '<Id>' -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMUamPolicyByIdDeactivate.md)

### Set-NMMUamPolicyByIdRun

Force run MSP app deployment policy.

**API operation:** `PUT /rest-api/v1/uam/policy/{id}/run`

**Syntax:**

```text

Set-NMMUamPolicyByIdRun [-Id] <int> [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-Id <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-WhatIf <switch>`.

```powershell
Set-NMMUamPolicyByIdRun -Id '<Id>' -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMUamPolicyByIdRun.md)

### Set-NMMUamRepoByRepoId

Update linked repository

**API operation:** `PUT /rest-api/v1/uam/repo/{repoId}`

**Syntax:**

```text

Set-NMMUamRepoByRepoId [-RepoId] <int> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-RepoId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMUamRepoByRepoId -RepoId '<RepoId>' -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMUamRepoByRepoId.md)

### Set-NMMUamRepoByRepoIdAppsAssignments

Update assignments of specific app.

**API operation:** `PUT /rest-api/v1/uam/repo/{repoId}/apps/assignments`

**Syntax:**

```text

Set-NMMUamRepoByRepoIdAppsAssignments [-RepoId] <int> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-RepoId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMUamRepoByRepoIdAppsAssignments -RepoId '<RepoId>' -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMUamRepoByRepoIdAppsAssignments.md)

### Set-NMMUamRepoPrivateShellAppsByAppId

Update Shell application.

**API operation:** `PUT /rest-api/v1/uam/repo/private/shell/apps/{appId}`

**Syntax:**

```text

Set-NMMUamRepoPrivateShellAppsByAppId [-AppId] <int> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AppId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMUamRepoPrivateShellAppsByAppId -AppId '<AppId>' -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMUamRepoPrivateShellAppsByAppId.md)

### Set-NMMUamRepoPrivateWingetByRepoIdAppsByPackageIdUpdate

Update WinGet application.

**API operation:** `PUT /rest-api/v1/uam/repo/private/winget/{repoId}/apps/{packageId}/update`

**Syntax:**

```text

Set-NMMUamRepoPrivateWingetByRepoIdAppsByPackageIdUpdate [-RepoId] <int> [-PackageId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-PackageId <String>`, `-RepoId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMUamRepoPrivateWingetByRepoIdAppsByPackageIdUpdate -RepoId '<RepoId>' -PackageId '<PackageId>' -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMUamRepoPrivateWingetByRepoIdAppsByPackageIdUpdate.md)

### Set-NMMUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersion

Update version of WinGet application.

**API operation:** `PUT /rest-api/v1/uam/repo/private/winget/{repoId}/apps/{packageId}/version/{appVersion}`

**Syntax:**

```text

Set-NMMUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersion [-RepoId] <int> [-PackageId] <string> [-AppVersion] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AppVersion <String>`, `-PackageId <String>`, `-RepoId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersion -RepoId '<RepoId>' -PackageId '<PackageId>' -AppVersion '<AppVersion>' -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersion.md)

### Set-NMMUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersionInstallerByInstallerId

Update installer of specific version of WinGet application.

**API operation:** `PUT /rest-api/v1/uam/repo/private/winget/{repoId}/apps/{packageId}/version/{appVersion}/installer/{installerId}`

**Syntax:**

```text

Set-NMMUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersionInstallerByInstallerId [-RepoId] <int> [-PackageId] <string> [-AppVersion] <string> [-InstallerId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AppVersion <String>`, `-InstallerId <String>`, `-PackageId <String>`, `-RepoId <Int32>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Set-NMMUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersionInstallerByInstallerId -RepoId '<RepoId>' -PackageId '<PackageId>' -AppVersion '<AppVersion>' -InstallerId '<InstallerId>' -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Set-NMMUamRepoPrivateWingetByRepoIdAppsByPackageIdVersionByAppVersionInstallerByInstallerId.md)

### Update-NMMAccountsByAccountIdGroupsByGroupId

Update a group from Entra ID or Active Directory by group identifier.

**API operation:** `PATCH /rest-api/v1/accounts/{accountId}/groups/{groupId}`

**Syntax:**

```text

Update-NMMAccountsByAccountIdGroupsByGroupId [-GroupId] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-GroupId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Update-NMMAccountsByAccountIdGroupsByGroupId -GroupId $groupId -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Update-NMMAccountsByAccountIdGroupsByGroupId.md)

### Update-NMMAccountsByAccountIdUsersByUserId

Update a user from Entra ID or Active directory by user identifier.

**API operation:** `PATCH /rest-api/v1/accounts/{accountId}/users/{userId}`

**Syntax:**

```text

Update-NMMAccountsByAccountIdUsersByUserId [-UserId] <string> [-AccountId] <string> [[-InputObject] <Object>] [[-Connection] <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]

```

**Required parameters:** `-AccountId <String>`, `-UserId <String>`.

**Optional parameters:** `-Confirm <switch>`, `-Connection <PSObject>`, `-InputObject <Object>`, `-WhatIf <switch>`.

```powershell
Update-NMMAccountsByAccountIdUsersByUserId -UserId $userId -AccountId $accountId -Connection $connection -WhatIf
```

[Detailed help and API notes](docs/Commands/Update-NMMAccountsByAccountIdUsersByUserId.md)

## Regeneration

After updating `swagger.json`, regenerate the module and this README:

```powershell
./tools/Build-Module.ps1 -Verbose
./tools/Build-Readme.ps1
```
