function New-NMMScriptedActionsByIdExecution {
    <#
.SYNOPSIS
Run Azure runbook msp scripted action in Automation account.
.DESCRIPTION
No additional description is provided by the API specification.
.PARAMETER Id
No additional description is provided by the API specification.
.PARAMETER InputObject
The JSON request body. Objects and hashtables are serialized automatically.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
New-NMMScriptedActionsByIdExecution -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/scripted-actions/{id}/execution
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [int] $Id,

        [Parameter(Mandatory = $false, ValueFromPipeline = $true)]
        [AllowNull()]
        [object] $InputObject,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['id'] = $Id
        $queryValues = @{}

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/scripted-actions/{id}/execution', 'POST')) {
            Invoke-NMMApiRequest -Method 'POST' -Path '/rest-api/v1/scripted-actions/{id}/execution' -PathValues $pathValues -QueryValues $queryValues -Body $InputObject -BodyWasBound:$PSBoundParameters.ContainsKey('InputObject') -Connection $Connection
        }
    }
}
