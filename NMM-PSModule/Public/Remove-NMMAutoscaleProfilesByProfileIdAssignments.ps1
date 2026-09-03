function Remove-NMMAutoscaleProfilesByProfileIdAssignments {
    <#
.SYNOPSIS
Delete the global auto-scale profile assignment
.DESCRIPTION
## Notes
- Id: Auto-scale profile id.
.PARAMETER ProfileId
No additional description is provided by the API specification.
.PARAMETER InputObject
The JSON request body. Objects and hashtables are serialized automatically.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Remove-NMMAutoscaleProfilesByProfileIdAssignments -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/autoscale-profiles/{profileId}/assignments
#>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
    param(
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [Alias('Id')]
        [int] $ProfileId,

        [Parameter(Mandatory = $false, ValueFromPipeline = $true)]
        [AllowNull()]
        [object] $InputObject,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['profileId'] = $ProfileId
        $queryValues = @{}

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/autoscale-profiles/{profileId}/assignments', 'DELETE')) {
            Invoke-NMMApiRequest -Method 'DELETE' -Path '/rest-api/v1/autoscale-profiles/{profileId}/assignments' -PathValues $pathValues -QueryValues $queryValues -Body $InputObject -BodyWasBound:$PSBoundParameters.ContainsKey('InputObject') -Connection $Connection
        }
    }
}
