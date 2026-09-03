function Get-NMMAccountsByAccountIdGroupsByGroupId {
    <#
.SYNOPSIS
Get details of a group by group identifier.
.DESCRIPTION
No additional description is provided by the API specification.
.PARAMETER GroupId
Group identifier: GUID format for a cloud group from Entra ID,
SID format for an on-premises group from Active Directory (throws exception when Hybrid user management isn't set up).
.PARAMETER AccountId
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Get-NMMAccountsByAccountIdGroupsByGroupId -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/groups/{groupId}
#>
    [CmdletBinding(SupportsShouldProcess = $false)]
    param(
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [string] $GroupId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [string] $AccountId,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['groupId'] = $GroupId
        $pathValues['accountId'] = $AccountId
        $queryValues = @{}

        Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/accounts/{accountId}/groups/{groupId}' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
    }
}
