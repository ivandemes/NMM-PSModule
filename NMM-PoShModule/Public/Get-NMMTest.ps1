function Get-NMMTest {
    <#
.SYNOPSIS
Test request
.DESCRIPTION
## Notes
Execute this to make sure that you have logged in correctly
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Get-NMMTest -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/test
#>
    [CmdletBinding(SupportsShouldProcess = $false)]
    param(
        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}

        $queryValues = @{}

        Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/test' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
    }
}
