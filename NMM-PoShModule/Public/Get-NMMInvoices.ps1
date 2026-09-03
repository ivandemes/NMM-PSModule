function Get-NMMInvoices {
    <#
.SYNOPSIS
Get the list of invoices.
.DESCRIPTION
No additional description is provided by the API specification.
.PARAMETER PeriodStart
Start Date (first day of month in mm/dd/yyyy format)
.PARAMETER PeriodEnd
End Date (last day of month in mm/dd/yyyy format)
.PARAMETER HidePaid
No additional description is provided by the API specification.
.PARAMETER HideUnpaid
No additional description is provided by the API specification.
.PARAMETER Filter
A client-side filter applied to each item returned by the API. Accepts a script block such as { $_.name -like 'Prod*' } or a string such as "name -like 'Prod*'". API-native query parameters should be preferred when available.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Get-NMMInvoices -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/invoices
#>
    [CmdletBinding(SupportsShouldProcess = $false)]
    param(
        [Parameter(Mandatory = $false)]
        [datetime] $PeriodStart,

        [Parameter(Mandatory = $false)]
        [datetime] $PeriodEnd,

        [Parameter(Mandatory = $false)]
        [bool] $HidePaid,

        [Parameter(Mandatory = $false)]
        [bool] $HideUnpaid,

        [Parameter()]
        [ValidateScript({ $_ -is [scriptblock] -or ($_ -is [string] -and -not [string]::IsNullOrWhiteSpace($_)) })]
        [object] $Filter,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}

        $queryValues = @{}
        if ($PSBoundParameters.ContainsKey('PeriodStart')) { $queryValues['periodStart'] = $PeriodStart }
        if ($PSBoundParameters.ContainsKey('PeriodEnd')) { $queryValues['periodEnd'] = $PeriodEnd }
        if ($PSBoundParameters.ContainsKey('HidePaid')) { $queryValues['hidePaid'] = $HidePaid }
        if ($PSBoundParameters.ContainsKey('HideUnpaid')) { $queryValues['hideUnpaid'] = $HideUnpaid }
        $response = Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/invoices' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
        if ($PSBoundParameters.ContainsKey('Filter')) {
            $filterScript = ConvertTo-NMMFilterScript -Filter $Filter
            $response | Where-Object -FilterScript $filterScript
        }
        else {
            $response
        }
    }
}
