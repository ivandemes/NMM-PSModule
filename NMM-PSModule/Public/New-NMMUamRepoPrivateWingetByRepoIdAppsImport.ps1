function New-NMMUamRepoPrivateWingetByRepoIdAppsImport {
    <#
.SYNOPSIS
Import application from one WinGet repo to another
.DESCRIPTION
## Notes
- SourcePackageId: ID of app to be imported.
- TargetRepoId: ID of repo where the app should be imported to.
- NewPackageId: ID of new app to create. Must be of the following format: "^[a-zA-Z0-9$\\-_()]{1,32}(\\.[a-zA-Z0-9$\\-_()]{1,32}){1,7}$". For example: "62ca27c.7a18bf1". Leave empty if need to import versions to existing app.
- ExistingPackageId: ID of existing app to import versions to. Leave empty if need to create new app.
- VersionsToImport: app versions to import.
- EnableAutoImport: specify whether the latest version of the source package should be automatically imported.
.PARAMETER RepoId
No additional description is provided by the API specification.
.PARAMETER InputObject
The JSON request body. Objects and hashtables are serialized automatically.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
New-NMMUamRepoPrivateWingetByRepoIdAppsImport -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/uam/repo/private/winget/{repoId}/apps/import
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [Alias('Id')]
        [int] $RepoId,

        [Parameter(Mandatory = $false, ValueFromPipeline = $true)]
        [AllowNull()]
        [object] $InputObject,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['repoId'] = $RepoId
        $queryValues = @{}

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/uam/repo/private/winget/{repoId}/apps/import', 'POST')) {
            Invoke-NMMApiRequest -Method 'POST' -Path '/rest-api/v1/uam/repo/private/winget/{repoId}/apps/import' -PathValues $pathValues -QueryValues $queryValues -Body $InputObject -BodyWasBound:$PSBoundParameters.ContainsKey('InputObject') -Connection $Connection
        }
    }
}
