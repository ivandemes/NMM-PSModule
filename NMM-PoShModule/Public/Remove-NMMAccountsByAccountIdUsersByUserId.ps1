function Remove-NMMAccountsByAccountIdUsersByUserId {
    <#
.SYNOPSIS
Delete a user from Entra ID or Active directory by user identifier.
.DESCRIPTION
No additional description is provided by the API specification.
.PARAMETER UserId
User identifier: GUID format for cloud user from Entra ID,
SID format for on-premises user from Active directory (throws exception when Hybrid user management isn't set up).
.PARAMETER AccountId
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Remove-NMMAccountsByAccountIdUsersByUserId -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/users/{userId}
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

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/accounts/{accountId}/users/{userId}', 'DELETE')) {
            Invoke-NMMApiRequest -Method 'DELETE' -Path '/rest-api/v1/accounts/{accountId}/users/{userId}' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
        }
    }
}
