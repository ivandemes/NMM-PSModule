function Remove-NMMAutoscaleProfilesByProfileId {
    <#
.SYNOPSIS
Delete the global auto-scale profile by id
.DESCRIPTION
## Notes
- Id: Auto-scale profile id.
.PARAMETER ProfileId
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Remove-NMMAutoscaleProfilesByProfileId -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/autoscale-profiles/{profileId}
#>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
    param(
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [Alias('Id')]
        [int] $ProfileId,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['profileId'] = $ProfileId
        $queryValues = @{}

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/autoscale-profiles/{profileId}', 'DELETE')) {
            Invoke-NMMApiRequest -Method 'DELETE' -Path '/rest-api/v1/autoscale-profiles/{profileId}' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
        }
    }
}
