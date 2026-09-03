function Get-NMMInvoicesById {
    <#
.SYNOPSIS
Get invoice details.
.DESCRIPTION
No additional description is provided by the API specification.
.PARAMETER Id
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Get-NMMInvoicesById -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/invoices/{id}
#>
    [CmdletBinding(SupportsShouldProcess = $false)]
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

        Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/invoices/{id}' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
    }
}
