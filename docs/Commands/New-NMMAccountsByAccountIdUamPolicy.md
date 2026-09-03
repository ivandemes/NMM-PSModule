# New-NMMAccountsByAccountIdUamPolicy

## Synopsis

Create app deployment policy.

## Syntax

~~~powershell
New-NMMAccountsByAccountIdUamPolicy -AccountId <string> [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes
- Name: policy name.
- Description: policy description.
- Type: type of policy. Recurrent or one-time.
- Targets: target scopes of policy.
- Targets.PersonalAvdDesktops.UserAzureIds: a list of personal desktop users. Policy will detect target hosts by assigned user. Leave empty for "Any user" option.
- Targets.PersonalAvdDesktops.HostPoolIds: a list of target host pools. Leave empty for "Any host pool" option.
- Targets.PooledAvdDesktops.HostPoolIds: a list of target host pools.
- Targets.ExactAvdSessionHost.HostIds: a list of target session hosts. Can not be be combined with other target types.
- Targets.Servers.ServerIds: a list of target servers.
- Targets.Intune: configuration of target Intune devices. Policy will detect target device by the following rule: we get all the devices according to the rules described in "Included" filter - and remove from the selection all the devices according to the rules described in "Excluded" filter.
- Targets.Intune.Included: A filter for Included devices.
- Targets.Intune.Included.Operator: 1 for OR, 2 for AND - define how ScopeRows are joined.
- Targets.Intune.Included.ScopeRows: Set of Included filter rows.
- Targets.Intune.Included.ScopeRows.AreaModificator: 1 for UsersAndDevices, 2 for UsersOnly, 3 for DevicesOnly - define devices to select: devices from the group or devices with primary users in the group.
- Targets.Intune.Included.ScopeRows.UserAzureIds: a list of device primary users - to detect according devices (if AreaModificator != 3).
- Targets.Intune.Included.ScopeRows.GroupAzureIds: a list of groups - what to detect is defined in AreaModificator.
- Targets.Intune.Excluded: A filter for Excluded devices.
- Targets.Intune.Excluded.Operator: 1 for OR, 2 for AND - define how ScopeRows are joined.
- Targets.Intune.Excluded.ScopeRows: Set of Excluded filter rows.
- Targets.Intune.Excluded.ScopeRows.AreaModificator: 1 for UsersAndDevices, 2 for UsersOnly, 3 for DevicesOnly - define devices to select: devices from the group or devices with primary users in the group.
- Targets.Intune.Excluded.ScopeRows.UserAzureIds: a list of device primary users - to detect according devices (if AreaModificator != 3).
- Targets.Intune.Excluded.ScopeRows.GroupAzureIds: a list of groups - what to detect is defined in AreaModificator.
- Actions: a list of app actions.
- Actions[x].RepoId: ID of the repo where app is stored.
- Actions[x].AppExternalId: app ID.
- Actions[x].AppVersion: app version (if supported). Use 'latest' to install and maintain latest version. Ignored for Uninstall action.
- Actions[x].ActionType: Install or Uninstall.
- Actions[x].IntuneInstallMode: type app assignment for Intune devices. For mobile apps and Native Intune Windows apps only.
- Actions[x].RebootAfterInstall: whether to reboot Azure VM after app installation.
- Actions[x].SkipIfNewer: whether to skip deployment if newer version of application is found on target.
- Actions[x].AppGroupId: ID of app group to deploy. Either app group or individual app may be specified in one action.
- Settings: additional settings of policy execution.
- Settings.Concurrency: setups a maximum number of concurrent tasks that install/uninstall app on the VMs.
- Settings.Concurrency.BalancerType: concurrency scope - Global or per host pool.
- Settings.Concurrency.MaxJobs: maximum number of concurrent NMM jobs.
- Settings.ServersMaintenanceWindow: a maintenance window to control when policy will process target servers.
- Settings.AvdMaintenanceWindow: a maintenance window to control when policy will process AVD targets.
- Settings.AvdDrainMode: drain mode configuration for AVD targets.
- Settings.AvdDrainMode.MinutesBeforeRemove: number of minutes to wait after sending the message to all users and setting the host to drain mode.
- Settings.AvdDrainMode.Message: a message to be sent to all users.

## API operation

POST /rest-api/v1/accounts/{accountId}/uam/policy
