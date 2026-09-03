function Update-NMMAccountsByAccountIdGroupsByGroupId {
    <#
.SYNOPSIS
Update a group from Entra ID or Active Directory by group identifier.
.DESCRIPTION
No additional description is provided by the API specification.
.PARAMETER GroupId
Group identifier: GUID format for a cloud group from Entra ID,
SID format for an on-premises group from Active Directory (throws exception when Hybrid user management isn't set up).
.PARAMETER AccountId
No additional description is provided by the API specification.
.PARAMETER InputObject
The JSON request body. Objects and hashtables are serialized automatically.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Update-NMMAccountsByAccountIdGroupsByGroupId -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/groups/{groupId}
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [string] $GroupId,

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
        $pathValues['groupId'] = $GroupId
        $pathValues['accountId'] = $AccountId
        $queryValues = @{}

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/accounts/{accountId}/groups/{groupId}', 'PATCH')) {
            Invoke-NMMApiRequest -Method 'PATCH' -Path '/rest-api/v1/accounts/{accountId}/groups/{groupId}' -PathValues $pathValues -QueryValues $queryValues -Body $InputObject -BodyWasBound:$PSBoundParameters.ContainsKey('InputObject') -Connection $Connection
        }
    }
}
