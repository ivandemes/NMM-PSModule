function Get-NMMScriptedActions {
    <#
.SYNOPSIS
Get the list of msp scripted actions.
.DESCRIPTION
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Get-NMMScriptedActions -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/scripted-actions
#>
    [CmdletBinding(SupportsShouldProcess = $false)]
    param(
        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}

        $queryValues = @{}

        Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/scripted-actions' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
    }
}
