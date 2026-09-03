function Get-NMMUamPolicyByPolicyIdDerivedByDerivedPolicyIdState {
    <#
.SYNOPSIS
Get derived policy execution details.
.DESCRIPTION
## Notes:
Returns execution state for a specific account-level policy derived from an MSP policy.
- AccountId: ID of the account where this derived policy is deployed.
- DerivedPolicyId: ID of the account-level policy.
- LastSyncDate: date when the derived policy was last synchronized with the MSP policy.
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
.PARAMETER PolicyId
No additional description is provided by the API specification.
.PARAMETER DerivedPolicyId
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Get-NMMUamPolicyByPolicyIdDerivedByDerivedPolicyIdState -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/uam/policy/{policyId}/derived/{derivedPolicyId}/state
#>
    [CmdletBinding(SupportsShouldProcess = $false)]
    param(
        [Parameter(Mandatory = $true)]
        [int] $PolicyId,

        [Parameter(Mandatory = $true)]
        [int] $DerivedPolicyId,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['policyId'] = $PolicyId
        $pathValues['derivedPolicyId'] = $DerivedPolicyId
        $queryValues = @{}

        Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/uam/policy/{policyId}/derived/{derivedPolicyId}/state' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
    }
}
