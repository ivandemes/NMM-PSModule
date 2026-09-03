function Get-NMMAccountsByAccountIdReservationsByReservationId {
    <#
.SYNOPSIS
Get reservation by id
.DESCRIPTION
No additional description is provided by the API specification.
.PARAMETER ReservationId
Route param: Id of reservation
.PARAMETER AccountId
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Get-NMMAccountsByAccountIdReservationsByReservationId -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/reservations/{reservationId}
#>
    [CmdletBinding(SupportsShouldProcess = $false)]
    param(
        [Parameter(Mandatory = $true)]
        [int] $ReservationId,

        [Parameter(Mandatory = $true)]
        [string] $AccountId,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['reservationId'] = $ReservationId
        $pathValues['accountId'] = $AccountId
        $queryValues = @{}

        Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/accounts/{accountId}/reservations/{reservationId}' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
    }
}
