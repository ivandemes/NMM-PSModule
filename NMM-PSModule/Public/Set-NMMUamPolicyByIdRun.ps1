function Set-NMMUamPolicyByIdRun {
    <#
.SYNOPSIS
Force run MSP app deployment policy.
.DESCRIPTION
## Notes:
Forces execution of the MSP policy triggering synchronization of all derived account-level policies.
.PARAMETER Id
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Set-NMMUamPolicyByIdRun -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/uam/policy/{id}/run
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [int] $Id,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['id'] = $Id
        $queryValues = @{}

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/uam/policy/{id}/run', 'PUT')) {
            Invoke-NMMApiRequest -Method 'PUT' -Path '/rest-api/v1/uam/policy/{id}/run' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
        }
    }
}
