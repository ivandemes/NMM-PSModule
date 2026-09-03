@{
    RootModule = 'NMM-PoShModule.psm1'
    ModuleVersion = '1.0.0'
    GUID = '5105823c-41ab-46f9-a41b-1b2fd1b86d78'
    Author = 'NMM-PoShModule contributors'
    CompanyName = 'Community'
    Copyright = '(c) NMM-PoShModule contributors. All rights reserved.'
    Description = 'PowerShell client module generated from the NMM OpenAPI specification.'
    PowerShellVersion = '7.2'
    CompatiblePSEditions = @('Core')
    FunctionsToExport = '*-NMM*'
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('NMM', 'Nerdio', 'REST', 'OpenAPI')
            ProjectUri = 'https://github.com/'
            ReleaseNotes = 'Initial module generated from swagger.json.'
        }
    }
}

