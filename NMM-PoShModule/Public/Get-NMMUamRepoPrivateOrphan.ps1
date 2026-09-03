function Get-NMMUamRepoPrivateOrphan {
    <#
.SYNOPSIS
List Msp linkable private winget repositories
.DESCRIPTION
## Notes
Returns list of web applications available to be linked as private winget repository on MSP level
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Get-NMMUamRepoPrivateOrphan -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/uam/repo/private/orphan
#>
    [CmdletBinding(SupportsShouldProcess = $false)]
    param(
        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}

        $queryValues = @{}

        Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/uam/repo/private/orphan' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
    }
}
