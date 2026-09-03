function New-NMMUamRepoPrivateAndroidApps {
    <#
.SYNOPSIS
Import application from Google Play Store to NMM Android apps repo.
.DESCRIPTION
## Notes
- ProductId: ProductId property of Google Play Store application to be imported.
- PackageName: PackageName property of Google Play Store application to be imported.
.PARAMETER InputObject
The JSON request body. Objects and hashtables are serialized automatically.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
New-NMMUamRepoPrivateAndroidApps -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/uam/repo/private/android/apps
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $false, ValueFromPipeline = $true)]
        [AllowNull()]
        [object] $InputObject,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}

        $queryValues = @{}

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/uam/repo/private/android/apps', 'POST')) {
            Invoke-NMMApiRequest -Method 'POST' -Path '/rest-api/v1/uam/repo/private/android/apps' -PathValues $pathValues -QueryValues $queryValues -Body $InputObject -BodyWasBound:$PSBoundParameters.ContainsKey('InputObject') -Connection $Connection
        }
    }
}
