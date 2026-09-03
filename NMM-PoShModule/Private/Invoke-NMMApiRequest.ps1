function Invoke-NMMApiRequest {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)][ValidateSet('GET', 'POST', 'DELETE', 'PUT', 'PATCH')][string] $Method,
        [Parameter(Mandatory)][string] $Path,
        [Parameter()][hashtable] $PathValues = @{},
        [Parameter()][hashtable] $QueryValues = @{},
        [Parameter()][AllowNull()][object] $Body,
        [Parameter()][bool] $BodyWasBound = $false,
        [Parameter()][AllowNull()][psobject] $Connection
    )

    $resolvedConnection = Resolve-NMMConnection -Connection $Connection
    foreach ($entry in $PathValues.GetEnumerator()) {
        $escapedValue = [uri]::EscapeDataString([string]$entry.Value)
        $Path = $Path.Replace("{$($entry.Key)}", $escapedValue)
    }
    if ($Path -match '\{[^}]+\}') { throw "Not all path parameters were supplied for '$Path'." }

    $uriBuilder = [System.UriBuilder]::new([uri]::new(([string]$resolvedConnection.BaseUri).TrimEnd('/') + '/', [System.UriKind]::Absolute))
    $uriBuilder.Path = $uriBuilder.Path.TrimEnd('/') + '/' + $Path.TrimStart('/')
    if ($QueryValues.Count -gt 0) {
        $pairs = foreach ($entry in $QueryValues.GetEnumerator()) {
            foreach ($value in @($entry.Value)) {
                $serializedValue = if ($value -is [bool]) { ([string]$value).ToLowerInvariant() } else { [string]$value }
                '{0}={1}' -f [uri]::EscapeDataString([string]$entry.Key), [uri]::EscapeDataString($serializedValue)
            }
        }
        $uriBuilder.Query = $pairs -join '&'
    }

    $invokeParameters = @{
        Uri         = $uriBuilder.Uri
        Method      = $Method
        Headers     = @{ Authorization = "Bearer $($resolvedConnection.AccessToken)"; Accept = 'application/json' }
        ErrorAction = 'Stop'
    }
    if ($BodyWasBound) {
        $invokeParameters.ContentType = 'application/json'
        $invokeParameters.Body = if ($Body -is [string]) { $Body } else { $Body | ConvertTo-Json -Depth 100 -Compress }
    }
    Invoke-RestMethod @invokeParameters
}
