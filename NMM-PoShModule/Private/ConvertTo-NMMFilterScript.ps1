function ConvertTo-NMMFilterScript {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNull()]
        [object] $Filter
    )

    if ($Filter -is [scriptblock]) { return $Filter }
    if ($Filter -isnot [string] -or [string]::IsNullOrWhiteSpace($Filter)) {
        throw 'Filter must be a non-empty string or a ScriptBlock.'
    }

    $filterText = $Filter.Trim()
    if ($filterText -match '^\$_(?:\.|\[)') {
        return [scriptblock]::Create($filterText)
    }

    if ($filterText -notmatch '^(?<property>[A-Za-z_][A-Za-z0-9_.]*)\s+(?<expression>-(?:eq|ne|like|notlike|match|notmatch|gt|ge|lt|le|in|notin|contains|notcontains)\s+.+)$') {
        throw "String filter '$Filter' is invalid. Use '<property> <operator> <value>' or supply a ScriptBlock."
    }

    $propertyExpression = ($Matches.property -split '\.' | ForEach-Object { "'$(($_ -replace "'", "''"))'" }) -join '.'
    return [scriptblock]::Create("`$_.$propertyExpression $($Matches.expression)")
}

