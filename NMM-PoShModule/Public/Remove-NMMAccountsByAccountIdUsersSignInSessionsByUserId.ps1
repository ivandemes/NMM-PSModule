function Remove-NMMAccountsByAccountIdUsersSignInSessionsByUserId {
    <#
.SYNOPSIS
Revoke all sign-in sessions for user.
.DESCRIPTION
No additional description is provided by the API specification.
.PARAMETER UserId
No additional description is provided by the API specification.
.PARAMETER AccountId
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Remove-NMMAccountsByAccountIdUsersSignInSessionsByUserId -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/users/signInSessions/{userId}
#>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
    param(
        [Parameter(Mandatory = $true)]
        [string] $UserId,

        [Parameter(Mandatory = $true)]
        [string] $AccountId,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['userId'] = $UserId
        $pathValues['accountId'] = $AccountId
        $queryValues = @{}

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/accounts/{accountId}/users/signInSessions/{userId}', 'DELETE')) {
            Invoke-NMMApiRequest -Method 'DELETE' -Path '/rest-api/v1/accounts/{accountId}/users/signInSessions/{userId}' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
        }
    }
}
