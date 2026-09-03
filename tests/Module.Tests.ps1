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
}
