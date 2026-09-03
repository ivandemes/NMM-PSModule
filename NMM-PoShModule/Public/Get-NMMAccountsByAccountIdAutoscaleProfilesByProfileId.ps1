function Get-NMMAccountsByAccountIdAutoscaleProfilesByProfileId {
    <#
.SYNOPSIS
Get the account auto-scale profile by id
.DESCRIPTION
## Notes
- Id: Auto-scale profile id.
.PARAMETER ProfileId
No additional description is provided by the API specification.
.PARAMETER AccountId
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Get-NMMAccountsByAccountIdAutoscaleProfilesByProfileId -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/autoscale-profiles/{profileId}
#>
    [CmdletBinding(SupportsShouldProcess = $false)]
    param(
        [Parameter(Mandatory = $true)]
        [int] $ProfileId,

        [Parameter(Mandatory = $true)]
        [string] $AccountId,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['profileId'] = $ProfileId
        $pathValues['accountId'] = $AccountId
        $queryValues = @{}

        Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/accounts/{accountId}/autoscale-profiles/{profileId}' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
    }
}
