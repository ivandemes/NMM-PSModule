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
The OAuth client secret. Accepts a plain string for automation compatibility or a SecureString to reduce accidental exposure.
.PARAMETER TenantId
The Microsoft Entra tenant ID shown in the NMM REST API credentials. When supplied, tokens are requested directly from Microsoft Entra ID.
.PARAMETER OAuthTokenUri
An explicit OAuth token endpoint. This takes precedence over TenantId and TokenPath.
.PARAMETER TokenPath
The legacy token endpoint path relative to BaseUri. For unattended authentication, use TenantId or OAuthTokenUri.
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
        [Parameter(Mandatory, ParameterSetName = 'ClientCredentials')]
        [ValidateScript({
            if ($_ -is [string] -and -not [string]::IsNullOrWhiteSpace($_)) { return $true }
            if ($_ -is [securestring]) { return $true }
            throw 'ClientSecret must be a non-empty string or a SecureString.'
        })]
        [object] $ClientSecret,
        [Parameter(ParameterSetName = 'ClientCredentials')][ValidateNotNullOrEmpty()][string] $TenantId,
        [Parameter(ParameterSetName = 'ClientCredentials')][ValidateNotNull()][uri] $OAuthTokenUri,
        [Parameter(ParameterSetName = 'ClientCredentials')][ValidateNotNullOrEmpty()][string] $TokenPath = '/api/v1/msp/rest-api/token',
        [Parameter(ParameterSetName = 'ClientCredentials')][string] $Scope,
        [Parameter()][switch] $NoDefault
    )

    if (-not $BaseUri.IsAbsoluteUri -or $BaseUri.Scheme -notin @('http', 'https')) { throw 'BaseUri must be an absolute HTTP or HTTPS URI.' }
    if ($PSCmdlet.ParameterSetName -eq 'ClientCredentials') {
        $plainSecret = if ($ClientSecret -is [securestring]) {
            [System.Net.NetworkCredential]::new('', $ClientSecret).Password
        }
        else {
            [string]$ClientSecret
        }
        $tokenUri = if ($PSBoundParameters.ContainsKey('OAuthTokenUri')) {
            if (-not $OAuthTokenUri.IsAbsoluteUri -or $OAuthTokenUri.Scheme -ne 'https') { throw 'OAuthTokenUri must be an absolute HTTPS URI.' }
            $OAuthTokenUri
        }
        elseif ($PSBoundParameters.ContainsKey('TenantId')) {
            [uri]::new("https://login.microsoftonline.com/$([uri]::EscapeDataString($TenantId))/oauth2/v2.0/token")
        }
        else {
            [uri]::new($BaseUri.AbsoluteUri.TrimEnd('/') + '/' + $TokenPath.TrimStart('/'))
        }
        $tokenBody = @{ grant_type = 'client_credentials'; client_id = $ClientId; client_secret = $plainSecret }
        if ($PSBoundParameters.ContainsKey('Scope')) { $tokenBody.scope = $Scope }
        try {
            $tokenResponse = Invoke-RestMethod -Uri $tokenUri -Method Post -ContentType 'application/x-www-form-urlencoded' -Body $tokenBody -ErrorAction Stop
        }
        catch {
            $responseProperty = $_.Exception.PSObject.Properties['Response']
            $exceptionResponse = if ($null -ne $responseProperty) { $responseProperty.Value } else { $null }
            $statusCode = if ($null -ne $exceptionResponse) { [int]$exceptionResponse.StatusCode } else { $null }
            $errorDetailMessage = if ($null -ne $_.ErrorDetails) { $_.ErrorDetails.Message } else { $null }
            $responseDetail = if (-not [string]::IsNullOrWhiteSpace($errorDetailMessage)) {
                ' Response: ' + $errorDetailMessage
            }
            else { '' }
            $statusDetail = if ($null -ne $statusCode) { " HTTP status: $statusCode." } else { '' }
            $tenantHint = if (-not $PSBoundParameters.ContainsKey('TenantId') -and -not $PSBoundParameters.ContainsKey('OAuthTokenUri')) {
                ' The NMM-hosted token route may require an interactive portal session; use -TenantId for unattended authentication.'
            }
            else { '' }
            $message = "NMM authentication failed at '$tokenUri'.$statusDetail$responseDetail Verify the Tenant ID, Client ID, client secret value, scope, and admin consent.$tenantHint"
            throw [System.InvalidOperationException]::new($message, $_.Exception)
        }
        finally {
            $plainSecret = $null
            $tokenBody.client_secret = $null
        }
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
