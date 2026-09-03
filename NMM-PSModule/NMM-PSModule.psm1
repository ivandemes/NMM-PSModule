Set-StrictMode -Version Latest
$script:NMMConnection = $null

$privateFunctions = @(Get-ChildItem -LiteralPath (Join-Path $PSScriptRoot 'Private') -Filter '*.ps1' -File)
$publicFunctions = @(Get-ChildItem -LiteralPath (Join-Path $PSScriptRoot 'Public') -Filter '*.ps1' -File)
foreach ($file in @($privateFunctions + $publicFunctions)) { . $file.FullName }
Export-ModuleMember -Function $publicFunctions.BaseName

