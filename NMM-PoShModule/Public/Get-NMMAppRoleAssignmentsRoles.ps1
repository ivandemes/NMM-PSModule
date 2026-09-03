function Get-NMMAppRoleAssignmentsRoles {
    <#
.SYNOPSIS
Get the list of app roles.
.DESCRIPTION
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Get-NMMAppRoleAssignmentsRoles -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/app-role-assignments/roles
#>
    [CmdletBinding(SupportsShouldProcess = $false)]
    param(
        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}

        $queryValues = @{}

        Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/app-role-assignments/roles' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
    }
}
