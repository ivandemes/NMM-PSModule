function Set-NMMUamRepoByRepoIdAppsAssignments {
    <#
.SYNOPSIS
Update assignments of specific app.
.DESCRIPTION
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
.PARAMETER RepoId
No additional description is provided by the API specification.
.PARAMETER InputObject
The JSON request body. Objects and hashtables are serialized automatically.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Set-NMMUamRepoByRepoIdAppsAssignments -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/uam/repo/{repoId}/apps/assignments
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [Alias('Id')]
        [int] $RepoId,

        [Parameter(Mandatory = $false, ValueFromPipeline = $true)]
        [AllowNull()]
        [object] $InputObject,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['repoId'] = $RepoId
        $queryValues = @{}

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/uam/repo/{repoId}/apps/assignments', 'PUT')) {
            Invoke-NMMApiRequest -Method 'PUT' -Path '/rest-api/v1/uam/repo/{repoId}/apps/assignments' -PathValues $pathValues -QueryValues $queryValues -Body $InputObject -BodyWasBound:$PSBoundParameters.ContainsKey('InputObject') -Connection $Connection
        }
    }
}
