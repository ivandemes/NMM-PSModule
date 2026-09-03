function New-NMMAppRoleAssignments {
    <#
.SYNOPSIS
Assign app role to principals.
.DESCRIPTION
## Notes
- RoleId: ID of role to be assigned.
- PrincipalIds: a list of principals IDs to assign app role to.
- GuestEmails: a list of emails of guest principals to assign app role to.
- AccessToAccounts: specifies restriction of access to existing accounts. Might be "Restricted" (grant access to specific accounts) or "All" (grant access to all accounts).
- AccountIds: IDs of accounts that should grant access to (when AccessToAccounts is "Restricted"). Value is ignored when AccessToAccounts is "All".
- Expiration (if both are null - unlimited access):
    - ExpirationDurationInHours: expiration time in hours. Might be: 0, 1, 8, 24, 168, 720, 1440, 2160, 4320.
    - ExpirationDate: specific expiration date (the minimum expiration period is 1 minute).
- SendInvitationEmail: indicates whether to send invitation mail to guest principals.
.PARAMETER InputObject
The JSON request body. Objects and hashtables are serialized automatically.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
New-NMMAppRoleAssignments -Connection $connection
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

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/app-role-assignments', 'POST')) {
            Invoke-NMMApiRequest -Method 'POST' -Path '/rest-api/v1/app-role-assignments' -PathValues $pathValues -QueryValues $queryValues -Body $InputObject -BodyWasBound:$PSBoundParameters.ContainsKey('InputObject') -Connection $Connection
        }
    }
}
