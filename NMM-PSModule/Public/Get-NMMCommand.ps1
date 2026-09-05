function Get-NMMCommand {
    <#
.SYNOPSIS
Lists commands exported by NMM-PSModule.
.DESCRIPTION
Returns discoverable command metadata for the module. API commands include their
HTTP method and REST path; module utility commands have those fields left empty.
The default display is written to the success pipeline and can be paged with
`Get-NMMCommand | more`.
.PARAMETER Name
Filters command names. Wildcards are supported.
.PARAMETER Verb
Filters commands by PowerShell verb, such as Get, New, Set, Update, or Remove.
.PARAMETER ApiPath
Filters REST API paths. Wildcards are supported. Utility commands without an API
path are excluded when this parameter is used.
.PARAMETER Category
Filters commands by their functional category. Wildcards are supported.
.PARAMETER AsObject
Returns command metadata as objects instead of rendering the grouped console view.
.EXAMPLE
Get-NMMCommand
.EXAMPLE
Get-NMMCommand -Name '*HostPool*' -Verb Get
.EXAMPLE
Get-NMMCommand -ApiPath '*/backup/*'
.EXAMPLE
Get-NMMCommand -Category HostPool -AsObject
.OUTPUTS
System.Management.Automation.PSCustomObject
#>
    [CmdletBinding()]
    param(
        [Parameter(Position = 0)]
        [ValidateNotNullOrEmpty()]
        [SupportsWildcards()]
        [string] $Name = '*',

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string] $Verb,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [SupportsWildcards()]
        [string] $ApiPath,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [SupportsWildcards()]
        [string] $Category = '*',

        [Parameter()]
        [switch] $AsObject
    )

    $operationPath = Join-Path (Split-Path $PSScriptRoot -Parent) 'operations.json'
    $operationByCommand = @{}
    foreach ($operation in (Get-Content -LiteralPath $operationPath -Raw | ConvertFrom-Json)) {
        $operationByCommand[$operation.Command] = $operation
    }

    $module = $MyInvocation.MyCommand.Module
    $commands = @($module.ExportedCommands.Values |
        Where-Object CommandType -eq 'Function' |
        Where-Object {
            $_.Name -like $Name -and
            (-not $PSBoundParameters.ContainsKey('Verb') -or $_.Verb -eq $Verb)
        } |
        ForEach-Object {
            $command = $_
            $operation = $operationByCommand[$command.Name]
            if ($PSBoundParameters.ContainsKey('ApiPath') -and
                ($null -eq $operation -or $operation.Path -notlike $ApiPath)) {
                return
            }

            $categoryName = switch -Regex ($command.Name) {
                '^Get-NMMAccounts$|Accountprovisioning|NMMApi(Connection)?$|^Get-NMMCommand$' { 'Account'; break }
                'Autoscale|Schedule|ScriptedAction|Job'                 { 'Automation'; break }
                'Backup|Recovery|ProtectedItem'                        { 'Backup'; break }
                'Invoice|Cost|Usage|Reservation'                       { 'Billing'; break }
                'DesktopImage|ImageTemplate'                           { 'DesktopImage'; break }
                'Device|Vulnerabilit'                                  { 'Device'; break }
                'HostPool|Host'                                        { 'HostPool'; break }
                'Directory|EnvironmentVariable|InheritedVariable|LocationVariable|Network|ResourceGroup|Workspace' { 'Infrastructure'; break }
                'Secure|Mfa|AppRole'                                   { 'Security'; break }
                'Uam'                                                  { 'UAM'; break }
                'User|Group'                                           { 'User'; break }
                default                                                { 'Other' }
            }

            [pscustomobject]@{
                Name     = $command.Name
                Category = $categoryName
                Verb     = $command.Verb
                Noun     = $command.Noun
                Method   = if ($null -ne $operation) { $operation.Method } else { $null }
                ApiPath  = if ($null -ne $operation) { $operation.Path } else { $null }
                Synopsis = (Get-Help $command.Name).Synopsis
            }
        } |
        Where-Object Category -Like $Category |
        Sort-Object Category, Name)

    if ($AsObject) { return $commands }

    if ($commands.Count -eq 0) {
        return 'No matching NMM commands were found.'
    }

    $categoryColors = @{
        Account = $PSStyle.Foreground.Cyan; Automation = $PSStyle.Foreground.Yellow
        Backup = $PSStyle.Foreground.Blue; Billing = $PSStyle.Foreground.Green
        DesktopImage = $PSStyle.Foreground.Yellow; Device = $PSStyle.Foreground.Red
        HostPool = $PSStyle.Foreground.Green; Infrastructure = $PSStyle.Foreground.Cyan
        Security = $PSStyle.Foreground.Magenta; UAM = $PSStyle.Foreground.Yellow
        User = $PSStyle.Foreground.Magenta; Other = $PSStyle.Foreground.White
    }
    $borderColor = $PSStyle.Foreground.BrightBlack
    $descriptionColor = $PSStyle.Foreground.White
    $resetColor = $PSStyle.Reset
    $windowWidth = try { $Host.UI.RawUI.WindowSize.Width } catch { 120 }
    $boxWidth = [Math]::Max(30, [Math]::Min(120, $windowWidth - 2))
    $innerWidth = $boxWidth - 4
    $preferredNameWidth = [Math]::Max(18, (($commands.Name | Measure-Object Length -Maximum).Maximum + 2))
    $nameWidth = [Math]::Min(55, [Math]::Min($preferredNameWidth, $innerWidth - 10))

    function Limit-NMMDisplayText([string] $Text, [int] $Width) {
        if ($Width -le 0) { return '' }
        # Help synopses can contain line breaks; a box row must always be one physical line.
        $Text = ($Text -replace '\s+', ' ').Trim()
        # Keep native-pager output code-page independent on Windows.
        $Text = $Text -replace '[^\x20-\x7E]', '?'
        if ($Text.Length -le $Width) { return $Text.PadRight($Width) }
        if ($Width -le 3) { return '.' * $Width }
        return $Text.Substring(0, $Width - 3) + '...'
    }

    Write-Output ''
    foreach ($group in ($commands | Group-Object Category)) {
        $color = $categoryColors[$group.Name]
        # ASCII borders survive Windows more.com, which does not reliably decode
        # UTF-8 box-drawing characters from a native pipeline.
        $heading = "- $($group.Name) "
        Write-Output ($borderColor + '  +' + $color + $heading + $borderColor +
            ('-' * [Math]::Max(0, $innerWidth - $heading.Length)) + '+' + $resetColor)

        foreach ($command in $group.Group) {
            # The leading space after the border is part of the inner box width.
            $descriptionWidth = $innerWidth - $nameWidth - 1
            Write-Output ($borderColor + '  | ' + $color +
                (Limit-NMMDisplayText $command.Name ($nameWidth - 2)) + '  ' +
                $descriptionColor + (Limit-NMMDisplayText $command.Synopsis $descriptionWidth) +
                $borderColor + '|' + $resetColor)
        }
        Write-Output ($borderColor + "  +" + ('-' * $innerWidth) + '+' + $resetColor)
        Write-Output ''
    }
}
