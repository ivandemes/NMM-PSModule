function Update-NMMAccountsByAccountIdUsersByUserId {
    <#
.SYNOPSIS
Update a user from Entra ID or Active directory by user identifier.
.DESCRIPTION
No additional description is provided by the API specification.
.PARAMETER UserId
User identifier: GUID format for cloud user from Entra ID,
SID format for on-premises user from Active directory (throws exception when Hybrid user management isn't set up).
.PARAMETER AccountId
No additional description is provided by the API specification.
.PARAMETER InputObject
The JSON request body. Objects and hashtables are serialized automatically.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Update-NMMAccountsByAccountIdUsersByUserId -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/users/{userId}
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [string] $UserId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [string] $AccountId,

        [Parameter(Mandatory = $false, ValueFromPipeline = $true)]
        [AllowNull()]
        [object] $InputObject,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['userId'] = $UserId
        $pathValues['accountId'] = $AccountId
        $queryValues = @{}

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/accounts/{accountId}/users/{userId}', 'PATCH')) {
            Invoke-NMMApiRequest -Method 'PATCH' -Path '/rest-api/v1/accounts/{accountId}/users/{userId}' -PathValues $pathValues -QueryValues $queryValues -Body $InputObject -BodyWasBound:$PSBoundParameters.ContainsKey('InputObject') -Connection $Connection
        }
    }
}
