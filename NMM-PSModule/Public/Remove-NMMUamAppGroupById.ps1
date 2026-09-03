function Remove-NMMUamAppGroupById {
    <#
.SYNOPSIS
Delete app group.
.DESCRIPTION
No additional description is provided by the API specification.
.PARAMETER Id
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Remove-NMMUamAppGroupById -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/uam/appGroup/{id}
#>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
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

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/uam/appGroup/{id}', 'DELETE')) {
            Invoke-NMMApiRequest -Method 'DELETE' -Path '/rest-api/v1/uam/appGroup/{id}' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
        }
    }
}
