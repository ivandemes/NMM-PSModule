function Set-NMMAppRoleAssignments {
    <#
.SYNOPSIS
Update app role for principal.
.DESCRIPTION
## Notes
- RoleId: ID of role to be assigned.
- PrincipalId: principals ID to assign app role to.
- AccessToAccounts: specifies restriction of access to existing accounts. Might be "Restricted" (grant access to specific accounts) or "All" (grant access to all accounts).
- AccountIds: IDs of accounts that should grant access to (when AccessToAccounts is "Restricted"). Value is ignored when AccessToAccounts is "All".
.PARAMETER InputObject
The JSON request body. Objects and hashtables are serialized automatically.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Set-NMMAppRoleAssignments -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/app-role-assignments
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $false, ValueFromPipeline = $true)]
        [AllowNull()]
        [object] $InputObject,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}

        $queryValues = @{}

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/app-role-assignments', 'PUT')) {
            Invoke-NMMApiRequest -Method 'PUT' -Path '/rest-api/v1/app-role-assignments' -PathValues $pathValues -QueryValues $queryValues -Body $InputObject -BodyWasBound:$PSBoundParameters.ContainsKey('InputObject') -Connection $Connection
        }
    }
}
