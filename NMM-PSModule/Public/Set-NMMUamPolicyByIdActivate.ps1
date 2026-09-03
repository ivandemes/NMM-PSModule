function Set-NMMUamPolicyByIdActivate {
    <#
.SYNOPSIS
Activate MSP app deployment policy.
.DESCRIPTION
No additional description is provided by the API specification.
.PARAMETER Id
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Set-NMMUamPolicyByIdActivate -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/uam/policy/{id}/activate
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

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/uam/policy/{id}/activate', 'PUT')) {
            Invoke-NMMApiRequest -Method 'PUT' -Path '/rest-api/v1/uam/policy/{id}/activate' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
        }
    }
}
