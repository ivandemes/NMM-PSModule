function Get-NMMAccountsByAccountIdReservedInstancesReservationDetailsByOrderId {
    <#
.SYNOPSIS
Get reservations from Azure by order id
.DESCRIPTION
No additional description is provided by the API specification.
.PARAMETER OrderId
Route param: Id of reservation order
.PARAMETER AccountId
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Get-NMMAccountsByAccountIdReservedInstancesReservationDetailsByOrderId -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/reservedInstances/reservationDetails/{orderId}
#>
    [CmdletBinding(SupportsShouldProcess = $false)]
    param(
        [Parameter(Mandatory = $true)]
        [string] $OrderId,

        [Parameter(Mandatory = $true)]
        [string] $AccountId,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['orderId'] = $OrderId
        $pathValues['accountId'] = $AccountId
        $queryValues = @{}

        Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/accounts/{accountId}/reservedInstances/reservationDetails/{orderId}' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
    }
}
