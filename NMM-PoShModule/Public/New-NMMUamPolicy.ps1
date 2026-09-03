function New-NMMUamPolicy {
    <#
.SYNOPSIS
Create MSP app deployment policy.
.DESCRIPTION
## Notes
- Name: policy name.
- Description: policy description.
- Type: type of policy. Recurrent or one-time.
- AllAccountsAssignment: configuration for assigning policy to all accounts.
- AllAccountsAssignment.Assigned: whether policy is assigned to all accounts.
- AllAccountsAssignment.Scopes: deployment scopes for all accounts assignment.
- AllAccountsAssignment.Scopes[x].Type: scope type (GroupTemplate or VulnerabilityRemediation).
- AllAccountsAssignment.Scopes[x].GroupTemplatesIds: list of group template IDs for GroupTemplate scope type.
- AllAccountsAssignment.Scopes[x].VulnerabilitiesIds: list of vulnerability IDs for VulnerabilityRemediation scope type.
- AssignedAccounts: list of specific account assignments (used when AllAccountsAssignment.Assigned is false).
- AssignedAccounts[x].AccountId: ID of the account.
- AssignedAccounts[x].Scopes: deployment scopes for this account.
- AssignedAccounts[x].Scopes[x].Type: scope type (GroupTemplate or VulnerabilityRemediation).
- AssignedAccounts[x].Scopes[x].GroupTemplatesIds: list of group template IDs for GroupTemplate scope type.
- AssignedAccounts[x].Scopes[x].VulnerabilitiesIds: list of vulnerability IDs for VulnerabilityRemediation scope type.
- Actions: a list of app actions.
- Actions[x].RepoId: ID of the repo where app is stored.
- Actions[x].AppExternalId: app ID.
- Actions[x].AppVersion: app version (if supported). Use 'latest' to install and maintain latest version. Ignored for Uninstall action.
- Actions[x].ActionType: Install or Uninstall.
- Actions[x].IntuneInstallMode: type app assignment for Intune devices. For mobile apps only.
- Actions[x].RebootAfterInstall: whether to reboot Azure VM after app installation.
- Actions[x].SkipIfNewer: whether to skip deployment if newer version of application is found on target.
- Actions[x].AppGroupId: ID of MSP app group to deploy. Either app group or individual app may be specified in one action.
- RepublishNativeIntuneApps: whether to republish native Intune apps.
- ForceRun: whether to force run the policy immediately after creation (for one-time policies).
.PARAMETER ForceRun
No additional description is provided by the API specification.
.PARAMETER InputObject
The JSON request body. Objects and hashtables are serialized automatically.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
New-NMMUamPolicy -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/uam/policy
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $false)]
        [bool] $ForceRun,

        [Parameter(Mandatory = $false, ValueFromPipeline = $true)]
        [AllowNull()]
        [object] $InputObject,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}

        $queryValues = @{}
        if ($PSBoundParameters.ContainsKey('ForceRun')) { $queryValues['forceRun'] = $ForceRun }
        if ($PSCmdlet.ShouldProcess('/rest-api/v1/uam/policy', 'POST')) {
            Invoke-NMMApiRequest -Method 'POST' -Path '/rest-api/v1/uam/policy' -PathValues $pathValues -QueryValues $queryValues -Body $InputObject -BodyWasBound:$PSBoundParameters.ContainsKey('InputObject') -Connection $Connection
        }
    }
}
