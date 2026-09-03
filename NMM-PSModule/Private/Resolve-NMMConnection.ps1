function Resolve-NMMConnection {
    [CmdletBinding()]
    param([Parameter()][AllowNull()][psobject] $Connection)

    if ($null -eq $Connection) { $Connection = $script:NMMConnection }
    if ($null -eq $Connection) {
        throw 'No NMM API connection is available. Run Connect-NMMApi or supply -Connection.'
    }
    if (-not $Connection.BaseUri -or -not $Connection.AccessToken) {
        throw 'The connection must contain BaseUri and AccessToken properties.'
    }
    return $Connection
}

