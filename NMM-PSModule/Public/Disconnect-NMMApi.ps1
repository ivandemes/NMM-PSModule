function Disconnect-NMMApi {
    <#
.SYNOPSIS
Clears the module's current NMM API connection.
.EXAMPLE
Disconnect-NMMApi
#>
    [CmdletBinding(SupportsShouldProcess)]
    param()

    if ($PSCmdlet.ShouldProcess('Current NMM API connection', 'Disconnect')) { $script:NMMConnection = $null }
}
