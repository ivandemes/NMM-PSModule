function Connect-NMMApi {
    <#
.SYNOPSIS
Creates and optionally saves an authenticated NMM API connection.
.DESCRIPTION
Uses an existing bearer token or obtains one with the OAuth 2.0 client credentials flow.
.PARAMETER BaseUri
The absolute URI of the NMM instance, for example https://example.getnerdio.com.
.PARAMETER AccessToken
An existing OAuth bearer token.
.PARAMETER ClientId
The OAuth client identifier.
.PARAMETER ClientSecret
The OAuth client secret.
.PARAMETER TokenPath
The token endpoint path relative to BaseUri.
.PARAMETER Scope
An optional OAuth scope.
.PARAMETER NoDefault
Returns the connection without making it the module's current connection.
.EXAMPLE
Connect-NMMApi -BaseUri https://example.getnerdio.com -ClientId $clientId -ClientSecret $secret
#>
    [CmdletBinding(DefaultParameterSetName = 'Token')]
    param(
        [Parameter(Mandatory)][ValidateNotNull()][uri] $BaseUri,
        [Parameter(Mandatory, ParameterSetName = 'Token')][ValidateNotNullOrEmpty()][string] $AccessToken,
        [Parameter(Mandatory, ParameterSetName = 'ClientCredentials')][ValidateNotNullOrEmpty()][string] $ClientId,
        [Parameter(Mandatory, ParameterSetName = 'ClientCredentials')][ValidateNotNull()][securestring] $ClientSecret,
        [Parameter(ParameterSetName = 'ClientCredentials')][ValidateNotNullOrEmpty()][string] $TokenPath = '/api/v1/msp/rest-api/token',
        [Parameter(ParameterSetName = 'ClientCredentials')][string] $Scope,
        [Parameter()][switch] $NoDefault
    )

    if (-not $BaseUri.IsAbsoluteUri -or $BaseUri.Scheme -notin @('http', 'https')) { throw 'BaseUri must be an absolute HTTP or HTTPS URI.' }
    if ($PSCmdlet.ParameterSetName -eq 'ClientCredentials') {
        $plainSecret = [System.Net.NetworkCredential]::new('', $ClientSecret).Password
        $tokenUri = [uri]::new($BaseUri.AbsoluteUri.TrimEnd('/') + '/' + $TokenPath.TrimStart('/'))
        $tokenBody = @{ grant_type = 'client_credentials'; client_id = $ClientId; client_secret = $plainSecret }
        if ($PSBoundParameters.ContainsKey('Scope')) { $tokenBody.scope = $Scope }
        try {
            $tokenResponse = Invoke-RestMethod -Uri $tokenUri -Method Post -ContentType 'application/x-www-form-urlencoded' -Body $tokenBody -ErrorAction Stop
        }
        finally { $plainSecret = $null }
        if (-not $tokenResponse.access_token) { throw 'The OAuth token response did not contain access_token.' }
        $AccessToken = $tokenResponse.access_token
    }

    $connection = [pscustomobject]@{
        PSTypeName  = 'NMM.ApiConnection'
        BaseUri     = $BaseUri.AbsoluteUri.TrimEnd('/')
        AccessToken = $AccessToken
    }
    if (-not $NoDefault) { $script:NMMConnection = $connection }
    return $connection
}

