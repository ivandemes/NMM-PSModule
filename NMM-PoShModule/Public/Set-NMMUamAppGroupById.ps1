function Set-NMMUamAppGroupById {
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
Adding app to the group will automatically assign it to all accounts the group is assigned to.
Removing app from the group will not affect individual app assignments.
.PARAMETER Id
No additional description is provided by the API specification.
.PARAMETER InputObject
The JSON request body. Objects and hashtables are serialized automatically.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Set-NMMUamAppGroupById -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/uam/appGroup/{id}
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [int] $Id,

        [Parameter(Mandatory = $false, ValueFromPipeline = $true)]
        [AllowNull()]
        [object] $InputObject,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['id'] = $Id
        $queryValues = @{}

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/uam/appGroup/{id}', 'PUT')) {
            Invoke-NMMApiRequest -Method 'PUT' -Path '/rest-api/v1/uam/appGroup/{id}' -PathValues $pathValues -QueryValues $queryValues -Body $InputObject -BodyWasBound:$PSBoundParameters.ContainsKey('InputObject') -Connection $Connection
        }
    }
}
