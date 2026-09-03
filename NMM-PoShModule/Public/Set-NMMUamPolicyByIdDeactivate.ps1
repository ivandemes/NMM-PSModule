function Set-NMMUamPolicyByIdDeactivate {
    <#
.SYNOPSIS
Deactivate MSP app deployment policy.
.DESCRIPTION
No additional description is provided by the API specification.
.PARAMETER Id
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Set-NMMUamPolicyByIdDeactivate -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/uam/policy/{id}/deactivate
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [int] $Id,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['id'] = $Id
        $queryValues = @{}

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/uam/policy/{id}/deactivate', 'PUT')) {
            Invoke-NMMApiRequest -Method 'PUT' -Path '/rest-api/v1/uam/policy/{id}/deactivate' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
        }
    }
}
