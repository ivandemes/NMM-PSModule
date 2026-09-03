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

Or use OAuth client credentials. Secrets are accepted as `SecureString` values:

```powershell
$secret = Read-Host 'Client secret' -AsSecureString
Connect-NMMApi -BaseUri 'https://example.getnerdio.com' -ClientId $clientId -ClientSecret $secret
```

Use `-NoDefault` to create a reusable connection without changing module state, then pass it with `-Connection`.

## Commands

HTTP methods use approved PowerShell verbs: GET becomes `Get-`, POST becomes `New-`, DELETE becomes `Remove-`, PUT becomes `Set-`, and PATCH becomes `Update-`. Because the source specification has no operation IDs, nouns are deterministically derived from complete API paths. This preserves uniqueness and makes account-scoped routes explicit.

```powershell
Get-Command -Module NMM-PoShModule
Get-Help Get-NMMAccounts -Full
```

Every command has comment-based help. Markdown reference pages are under `docs/Commands`, and `NMM-PoShModule/operations.json` provides the exact command-to-method-and-path mapping.

Request bodies are supplied with `-InputObject` as a hashtable, object, or JSON string. Required path and query arguments are marked mandatory; optional query values are omitted unless explicitly bound. Destructive commands support `-WhatIf` and `-Confirm`.

## Regeneration

After updating `swagger.json`, regenerate commands and documentation:

```powershell
./tools/Build-Module.ps1 -Verbose
```

