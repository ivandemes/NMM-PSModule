$script:RepositoryRoot = Split-Path $PSScriptRoot -Parent
$script:ManifestPath = Join-Path $RepositoryRoot 'NMM-PSModule/NMM-PSModule.psd1'
Import-Module $ManifestPath -Force
$script:Specification = Get-Content (Join-Path $RepositoryRoot 'swagger.json') -Raw | ConvertFrom-Json
$script:Operations = Get-Content (Join-Path $RepositoryRoot 'NMM-PSModule/operations.json') -Raw | ConvertFrom-Json

Describe 'NMM-PSModule contract' {
    It 'exports one command for every OpenAPI operation plus connection commands' {
        $expected = 0
        foreach ($path in $Specification.paths.PSObject.Properties) {
            $expected += @($path.Value.PSObject.Properties | Where-Object Name -In get, post, put, patch, delete).Count
        }
        $Operations.Count | Should Be $expected
        @(Get-Command -Module NMM-PSModule).Count | Should Be ($expected + 4)
    }

    It 'lists and filters exported NMM commands' {
        $commands = @(Get-NMMCommand -AsObject)
        $commands.Count | Should Be (@(Get-Command -Module NMM-PSModule).Count)
        @($commands | Where-Object Name -eq 'Get-NMMAccounts').Count | Should Be 1

        $accountCommand = Get-NMMCommand -Name 'Get-NMMAccounts' -AsObject
        $accountCommand.Method | Should Be 'GET'
        $accountCommand.ApiPath | Should Be '/rest-api/v1/accounts'

        $filtered = @(Get-NMMCommand -Verb Get -ApiPath '*/backup/*' -AsObject)
        $filtered.Count | Should BeGreaterThan 0
        @($filtered | Where-Object Verb -ne 'Get').Count | Should Be 0
        @($filtered | Where-Object ApiPath -NotLike '*/backup/*').Count | Should Be 0
    }

    It 'renders every command box line at the same width' {
        # This command's generated synopsis contains a newline in the source specification.
        $rendered = @(Get-NMMCommand -Name 'Get-NMMUamRepoByRepoIdAppsExtensions')
        $plainLines = @($rendered | ForEach-Object { $_ -replace "`e\[[0-9;]*m", '' })
        $boxLines = @($plainLines | Where-Object { $_ -match '^  [|+]' })
        $boxLines.Count | Should Be 3
        @($boxLines.Length | Sort-Object -Unique).Count | Should Be 1
        ($boxLines -join '') | Should Not Match '[\r\n]'
        ($plainLines -join '') | Should Not Match '[^\x00-\x7F]'
        $boxLines[0][-1] | Should Be '+'
        $boxLines[1][-1] | Should Be '|'
        $boxLines[2][-1] | Should Be '+'
    }

    It 'writes its formatted display to the success pipeline for paging' {
        $pagedInput = @(Get-NMMCommand -Category Billing)
        $pagedInput.Count | Should BeGreaterThan 0
        @($pagedInput | Where-Object { $_ -match 'Get-NMMInvoices' }).Count | Should BeGreaterThan 0
    }

    It 'shows connection status without exposing the access token' {
        Disconnect-NMMApi -Confirm:$false
        $disconnected = Get-NMMApiConnection
        $disconnected.Connected | Should Be $false
        $disconnected.BaseUri | Should BeNullOrEmpty

        $null = Connect-NMMApi -BaseUri 'https://example.test' -AccessToken 'secret-token'
        $connected = Get-NMMApiConnection
        $connected.Connected | Should Be $true
        $connected.BaseUri | Should Be 'https://example.test'
        @($connected.PSObject.Properties.Name | Where-Object { $_ -eq 'AccessToken' }).Count | Should Be 0

        Disconnect-NMMApi -Confirm:$false
    }

    It 'maps every HTTP method to the requested PowerShell verb' {
        $verbs = @{ GET = 'Get'; POST = 'New'; DELETE = 'Remove'; PUT = 'Set'; PATCH = 'Update' }
        foreach ($operation in $Operations) { $operation.Command | Should Match "^$($verbs[$operation.Method])-" }
    }

    It 'has unique command names' {
        @($Operations.Command | Sort-Object -Unique).Count | Should Be $Operations.Count
    }

    It 'provides synopsis help for every generated command' {
        foreach ($operation in $Operations) { (Get-Help $operation.Command).Synopsis | Should Not BeNullOrEmpty }
    }

    It 'adds Filter to the 75 GET operations with explicit array responses' {
        $filterCommands = @(Get-Command -Module NMM-PSModule -Verb Get | Where-Object { $_.Parameters.ContainsKey('Filter') })
        $filterCommands.Count | Should Be 75
        (Get-Command Get-NMMAccounts).Parameters.ContainsKey('Filter') | Should Be $true
        (Get-Command Get-NMMTest).Parameters.ContainsKey('Filter') | Should Be $false
    }
}

Describe 'GET collection filtering' {
    Mock Invoke-RestMethod {
        @(
            [pscustomobject]@{ name = 'Production One' }
            [pscustomobject]@{ name = 'Development One' }
            [pscustomobject]@{ name = 'Production Two' }
        )
    } -ModuleName NMM-PSModule

    It 'applies Filter to items returned by the API' {
        $connection = [pscustomobject]@{ BaseUri = 'https://example.test'; AccessToken = 'test-token' }
        $result = @(Get-NMMAccounts -Connection $connection -Filter { $_.name -like 'Production*' })
        $result.Count | Should Be 2
        @($result.name) | Should Be @('Production One', 'Production Two')
    }

    It 'accepts a string filter beginning with a property name' {
        $connection = [pscustomobject]@{ BaseUri = 'https://example.test'; AccessToken = 'test-token' }
        $result = @(Get-NMMAccounts -Connection $connection -Filter "name -eq 'Development One'")
        $result.Count | Should Be 1
        $result[0].name | Should Be 'Development One'
    }
}

Describe 'Path parameter pipeline binding' {
    Mock Invoke-RestMethod {
        if ($Uri.AbsolutePath -eq '/rest-api/v1/accounts') {
            return @([pscustomobject]@{ id = 42; name = 'Contoso Demo Erwin' })
        }
        return @([pscustomobject]@{ name = 'Secret variable' })
    } -ModuleName NMM-PSModule

    It 'binds an account object Id to the account-scoped AccountId parameter' {
        $connection = [pscustomobject]@{ BaseUri = 'https://example.test'; AccessToken = 'test-token' }
        $result = @(Get-NMMAccounts -Connection $connection -Filter "name -eq 'Contoso Demo Erwin'" |
            Get-NMMAccountsByAccountIdSecureVariables -Connection $connection)

        $result.Count | Should Be 1
        Assert-MockCalled Invoke-RestMethod -ModuleName NMM-PSModule -ParameterFilter {
            $Uri.AbsolutePath -eq '/rest-api/v1/accounts/42/secure-variables'
        }
    }
}

Describe 'Connect-NMMApi client credentials' {
    Mock Invoke-RestMethod { [pscustomobject]@{ access_token = 'test-token' } } -ModuleName NMM-PSModule

    It 'accepts a plain string client secret' {
        $connection = Connect-NMMApi -BaseUri 'https://example.test' -ClientId 'client-id' -ClientSecret 'plain-secret' -Scope 'api/.default' -NoDefault
        $connection.AccessToken | Should Be 'test-token'
    }

    It 'accepts a SecureString client secret' {
        $secret = ConvertTo-SecureString 'secure-secret' -AsPlainText -Force
        $connection = Connect-NMMApi -BaseUri 'https://example.test' -ClientId 'client-id' -ClientSecret $secret -NoDefault
        $connection.AccessToken | Should Be 'test-token'
    }

    It 'uses the Microsoft Entra token endpoint when TenantId is supplied' {
        $null = Connect-NMMApi -BaseUri 'https://example.test' -TenantId 'tenant-id' -ClientId 'client-id' -ClientSecret 'plain-secret' -Scope 'api://resource/.default' -NoDefault
        Assert-MockCalled Invoke-RestMethod -ModuleName NMM-PSModule -ParameterFilter {
            $Uri.AbsoluteUri -eq 'https://login.microsoftonline.com/tenant-id/oauth2/v2.0/token'
        }
    }
}

Describe 'Connect-NMMApi authentication failures' {
    Mock Invoke-RestMethod { throw 'Unauthorized' } -ModuleName NMM-PSModule

    It 'throws one useful error and does not return a connection' {
        $caught = $null
        $result = try {
            Connect-NMMApi -BaseUri 'https://example.test' -ClientId 'client-id' -ClientSecret 'invalid-secret' -Scope 'api/.default' -NoDefault
        }
        catch { $caught = $_ }

        $result | Should BeNullOrEmpty
        $caught.Exception.Message | Should Match '^NMM authentication failed'
        $caught.Exception.Message | Should Not Match 'invalid-secret'
    }
}
