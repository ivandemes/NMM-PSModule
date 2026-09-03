function Get-NMMHealthStatus {
    <#
.SYNOPSIS
A basic health check
.DESCRIPTION
## Notes
Completes a basic health check for 
 - App Service
 - Database
 - Web Jobs
 
 returns **'OK'** or **'Error'** and is limited to **1** request a minute
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Get-NMMHealthStatus -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/health-status
#>
    [CmdletBinding(SupportsShouldProcess = $false)]
    param(
        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}

        $queryValues = @{}

        Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/health-status' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
    }
}
