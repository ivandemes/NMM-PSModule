$script:RepositoryRoot = Split-Path $PSScriptRoot -Parent
$script:ManifestPath = Join-Path $RepositoryRoot 'NMM-PoShModule/NMM-PoShModule.psd1'
Import-Module $ManifestPath -Force
$script:Specification = Get-Content (Join-Path $RepositoryRoot 'swagger.json') -Raw | ConvertFrom-Json
$script:Operations = Get-Content (Join-Path $RepositoryRoot 'NMM-PoShModule/operations.json') -Raw | ConvertFrom-Json

Describe 'NMM-PoShModule contract' {
    It 'exports one command for every OpenAPI operation plus connection commands' {
        $expected = 0
        foreach ($path in $Specification.paths.PSObject.Properties) {
            $expected += @($path.Value.PSObject.Properties | Where-Object Name -In get, post, put, patch, delete).Count
        }
        $Operations.Count | Should Be $expected
        @(Get-Command -Module NMM-PoShModule).Count | Should Be ($expected + 2)
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
        $filterCommands = @(Get-Command -Module NMM-PoShModule -Verb Get | Where-Object { $_.Parameters.ContainsKey('Filter') })
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
    } -ModuleName NMM-PoShModule

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
    } -ModuleName NMM-PoShModule

    It 'binds an account object Id to the account-scoped AccountId parameter' {
        $connection = [pscustomobject]@{ BaseUri = 'https://example.test'; AccessToken = 'test-token' }
        $result = @(Get-NMMAccounts -Connection $connection -Filter "name -eq 'Contoso Demo Erwin'" |
            Get-NMMAccountsByAccountIdSecureVariables -Connection $connection)

        $result.Count | Should Be 1
        Assert-MockCalled Invoke-RestMethod -ModuleName NMM-PoShModule -ParameterFilter {
            $Uri.AbsolutePath -eq '/rest-api/v1/accounts/42/secure-variables'
        }
    }
}

Describe 'Connect-NMMApi client credentials' {
    Mock Invoke-RestMethod { [pscustomobject]@{ access_token = 'test-token' } } -ModuleName NMM-PoShModule

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
        Assert-MockCalled Invoke-RestMethod -ModuleName NMM-PoShModule -ParameterFilter {
            $Uri.AbsoluteUri -eq 'https://login.microsoftonline.com/tenant-id/oauth2/v2.0/token'
        }
    }
}

Describe 'Connect-NMMApi authentication failures' {
    Mock Invoke-RestMethod { throw 'Unauthorized' } -ModuleName NMM-PoShModule

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
