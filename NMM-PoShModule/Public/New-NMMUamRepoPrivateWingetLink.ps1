function New-NMMUamRepoPrivateWingetLink {
    <#
.SYNOPSIS
Link private winget repository
.DESCRIPTION
## Notes
- Type: Type of repo. Currently only winget is supported
- DisplayName: Friendly name for this repository within Nerdio Manager. For WinGet repos only.
- WebApplicationId: Azure resource id of linkable orphan repository
.PARAMETER InputObject
The JSON request body. Objects and hashtables are serialized automatically.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
New-NMMUamRepoPrivateWingetLink -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/uam/repo/private/winget/link
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

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/uam/repo/private/winget/link', 'POST')) {
            Invoke-NMMApiRequest -Method 'POST' -Path '/rest-api/v1/uam/repo/private/winget/link' -PathValues $pathValues -QueryValues $queryValues -Body $InputObject -BodyWasBound:$PSBoundParameters.ContainsKey('InputObject') -Connection $Connection
        }
    }
}
