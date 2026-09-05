function Get-NMMApiConnection {
    <#
.SYNOPSIS
Shows the current NMM API connection.
.DESCRIPTION
Returns the connection status and base URI for the module's current default
connection. The access token is intentionally not returned.
.EXAMPLE
Get-NMMApiConnection
.OUTPUTS
System.Management.Automation.PSCustomObject
#>
    [CmdletBinding()]
    param()

    [pscustomobject]@{
        PSTypeName = 'NMM.ApiConnectionStatus'
        Connected  = $null -ne $script:NMMConnection
        BaseUri    = if ($null -ne $script:NMMConnection) { $script:NMMConnection.BaseUri } else { $null }
    }
}
