# NMM-PoShModule

PowerShell 7 module for the NMM REST API. Its commands are generated from the repository's `swagger.json` so the module remains traceable to the API contract.

## Installation

Copy the `NMM-PoShModule` directory into a directory listed in `$env:PSModulePath`, or import the manifest directly:

```powershell
Import-Module ./NMM-PoShModule/NMM-PoShModule.psd1
```

## Authentication

Connect with an existing bearer token:

```powershell
Connect-NMMApi -BaseUri 'https://example.getnerdio.com' -AccessToken $token
```

Or use OAuth client credentials. A `SecureString` is recommended for interactive use:

```powershell
$secret = Read-Host 'Client secret' -AsSecureString
Connect-NMMApi -BaseUri 'https://example.getnerdio.com' -TenantId $tenantId -ClientId $clientId -ClientSecret $secret -Scope $scope
```

Plain strings are also accepted for CI systems and existing automation:

```powershell
Connect-NMMApi -BaseUri 'https://example.getnerdio.com' -TenantId $tenantId -ClientId $clientId -ClientSecret $env:NMM_CLIENT_SECRET -Scope 'api://api-application-id/.default'
```

Avoid placing a literal secret in scripts, shell history, or logs.

Use `-NoDefault` to create a reusable connection without changing module state, then pass it with `-Connection`.

## Commands

HTTP methods use approved PowerShell verbs: GET becomes `Get-`, POST becomes `New-`, DELETE becomes `Remove-`, PUT becomes `Set-`, and PATCH becomes `Update-`. Because the source specification has no operation IDs, nouns are deterministically derived from complete API paths. This preserves uniqueness and makes account-scoped routes explicit.

```powershell
Get-Command -Module NMM-PoShModule
Get-Help Get-NMMAccounts -Full
```

Every command has comment-based help. Markdown reference pages are under `docs/Commands`, and `NMM-PoShModule/operations.json` provides the exact command-to-method-and-path mapping.

Request bodies are supplied with `-InputObject` as a hashtable, object, or JSON string. Required path and query arguments are marked mandatory; optional query values are omitted unless explicitly bound. Destructive commands support `-WhatIf` and `-Confirm`.

GET commands that return arrays expose a client-side `-Filter` script block:

```powershell
Get-NMMAccounts -Filter { $_.name -like 'Production*' }
```

String filter syntax is also supported for a single property expression:

```powershell
Get-NMMAccounts -Filter "name -eq 'Contoso Demo'"
```

The API response is downloaded before this filter runs. Prefer API-native parameters such as `-SearchTerm`, date ranges, or status selectors where available.

Path parameters accept pipeline input by property name. A collection object with an `id` property can flow into an account-scoped command whose only path parameter is `AccountId`:

```powershell
Get-NMMAccounts -Filter "name -eq 'Contoso Demo'" |
    Get-NMMAccountsByAccountIdSecureVariables
```

## Regeneration

After updating `swagger.json`, regenerate commands and documentation:

```powershell
./tools/Build-Module.ps1 -Verbose
```
