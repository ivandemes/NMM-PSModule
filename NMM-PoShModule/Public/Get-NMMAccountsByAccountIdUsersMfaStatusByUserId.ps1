function Get-NMMAccountsByAccountIdUsersMfaStatusByUserId {
    <#
.SYNOPSIS
Get details of user MFA registration and per-user MFA state .
.DESCRIPTION
No additional description is provided by the API specification.
.PARAMETER UserId
No additional description is provided by the API specification.
.PARAMETER AccountId
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Get-NMMAccountsByAccountIdUsersMfaStatusByUserId -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/users/mfaStatus/{userId}
#>
    [CmdletBinding(SupportsShouldProcess = $false)]
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

        Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/accounts/{accountId}/users/mfaStatus/{userId}' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
    }
}
