function New-NMMUamRepositoryPrivateByRepoIdPackageByPackageIdDetection {
    <#
.SYNOPSIS
Allow to configure custom detection rules to detect status of WinGet app deployment.
.DESCRIPTION
## Notes
- ScriptedDetection: PowerShell script to detect whether app is installed.
- Items: rules to check whether file, folder, registry key or registry value exists or missing after app deployment action. Detection.Items are required. 
- Items[x].Type - Folder (1), File (2), RegKey(3), RegValue (4)
- Items[x].Folder - path to folder that should be created or deleted after app deployment action. Works with Item.Type (1).
- Items[x].File - path to file that should be created or deleted after app deployment action. Works with Item.Type (2).
- Items[x].FileVersion - file version that should be created or deleted after app deployment action. Works with Item.Type (2).
- Items[x].ProductVersion - product version that should be created or deleted after app deployment action. Works with Item.Type (2).
- Items[x].RegKey - registry key that should be created or deleted after app deployment action. Works with Item.Type (3).
- Items[x].RegValue - registry value that should be changed after app deployment action. Works with Item.Type (4).
.PARAMETER RepoId
No additional description is provided by the API specification.
.PARAMETER PackageId
No additional description is provided by the API specification.
.PARAMETER InputObject
The JSON request body. Objects and hashtables are serialized automatically.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
New-NMMUamRepositoryPrivateByRepoIdPackageByPackageIdDetection -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/uam/repository/private/{repoId}/package/{packageId}/detection
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [int] $RepoId,

        [Parameter(Mandatory = $true)]
        [string] $PackageId,

        [Parameter(Mandatory = $false, ValueFromPipeline = $true)]
        [AllowNull()]
        [object] $InputObject,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['repoId'] = $RepoId
        $pathValues['packageId'] = $PackageId
        $queryValues = @{}

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/uam/repository/private/{repoId}/package/{packageId}/detection', 'POST')) {
            Invoke-NMMApiRequest -Method 'POST' -Path '/rest-api/v1/uam/repository/private/{repoId}/package/{packageId}/detection' -PathValues $pathValues -QueryValues $queryValues -Body $InputObject -BodyWasBound:$PSBoundParameters.ContainsKey('InputObject') -Connection $Connection
        }
    }
}
