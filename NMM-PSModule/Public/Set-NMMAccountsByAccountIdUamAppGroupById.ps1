function Set-NMMAccountsByAccountIdUamAppGroupById {
    <#
.SYNOPSIS
Update app group.
.DESCRIPTION
## Notes
- Name: app group name. Must begin with a letter, can contain letters, numbers, underscore ('_') and hyphens ('-') only and can not be longer than 30 chars.
- Items: apps included in the groups.
- Items.RepoId: repo ID.
- Items.ExternalId: app ID.
- Items.Version: app version. Use 'latest' to install and maintain latest version.
- Items.Order: the order in which the application will be installed/uninstalled.
.PARAMETER Id
No additional description is provided by the API specification.
.PARAMETER AccountId
No additional description is provided by the API specification.
.PARAMETER InputObject
The JSON request body. Objects and hashtables are serialized automatically.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Set-NMMAccountsByAccountIdUamAppGroupById -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/uam/appGroup/{id}
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [int] $Id,

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
        $pathValues['id'] = $Id
        $pathValues['accountId'] = $AccountId
        $queryValues = @{}

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/accounts/{accountId}/uam/appGroup/{id}', 'PUT')) {
            Invoke-NMMApiRequest -Method 'PUT' -Path '/rest-api/v1/accounts/{accountId}/uam/appGroup/{id}' -PathValues $pathValues -QueryValues $queryValues -Body $InputObject -BodyWasBound:$PSBoundParameters.ContainsKey('InputObject') -Connection $Connection
        }
    }
}
