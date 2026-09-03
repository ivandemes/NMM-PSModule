# Get-NMMAccountsByAccountIdUamPolicyByIdState

## Synopsis

Get app deployment policy execution details.

## Syntax

~~~powershell
Get-NMMAccountsByAccountIdUamPolicyByIdState -Id <integer> -AccountId <string> [-Connection <psobject>]
~~~

## Description

## Notes:
- LastRunDate: date of the last policy run.
- DeviceStates: app deployment status details per each target device.
- DeviceStates[x].Device: target device's short description.
- DeviceStates[x].Device.DeviceType: device type.
- DeviceStates[x].Device.DisplayName: device name.
- DeviceStates[x].Device.AvdSessionHostRestModel: device details if deployment policy refers to it as to AVD session host. Otherwise NULL.
- DeviceStates[x].Device.IntuneDeviceRestModel: device details if deployment policy refers to it as to Intune device. Otherwise NULL.
- DeviceStates[x].Device.ServerRestModel: device details if deployment policy refers to it as to Server. Otherwise NULL.
- DeviceStates[x].DeviceStatus: app deployment status for the device.
- DeviceStates[x].AppStates: app deployment statuses for each app action in the policy. Use ActionIndex to match status to policy's action from Actions.
- DeviceStates[x].AppStates[x].ActionIndex: ID of action applied to the device. Use it to find action details in Actions property.
- DeviceStates[x].AppStates[x].Status: action status.
- DeviceStates[x].AppStates[x].StatusMessage: detailed status description.
- Actions: app actions configured in the policy.
- Actions[x].ActionIndex: use it to match action to status from device's AppStates.
- Actions[x].RepoId: repo ID of application used in action.
- Actions[x].AppExternalId: ID of application used in action.
- Actions[x].AppVersion: version of application used in action.
- Actions[x].AppGroupId: ID of app group used in action.
- Actions[x].ActionType: type of app action.
- Actions[x].IntuneInstallMode: app install mode for Intune devices.
- Actions[x].RebootAfterInstall: set up whether the VM should be rebooted after app install.
- Actions[x].SkipIfNewer: whether to skip deployment if newer version of application is found on target.

## API operation

GET /rest-api/v1/accounts/{accountId}/uam/policy/{id}/state
