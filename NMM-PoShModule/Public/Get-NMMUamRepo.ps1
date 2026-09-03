function Get-NMMUamRepo {
    <#
.SYNOPSIS
Get list of linked MSP repositories
.DESCRIPTION
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Get-NMMUamRepo -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/uam/repo
#>
    [CmdletBinding(SupportsShouldProcess = $false)]
    param(
        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}

        $queryValues = @{}

        Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/uam/repo' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
    }
}
