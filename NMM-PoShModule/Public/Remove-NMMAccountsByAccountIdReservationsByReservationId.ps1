function Remove-NMMAccountsByAccountIdReservationsByReservationId {
    <#
.SYNOPSIS
Delete reservation by Id
.DESCRIPTION
No additional description is provided by the API specification.
.PARAMETER ReservationId
Route param: Id of reservation
.PARAMETER AccountId
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Remove-NMMAccountsByAccountIdReservationsByReservationId -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/reservations/{reservationId}
#>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
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

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/accounts/{accountId}/reservations/{reservationId}', 'DELETE')) {
            Invoke-NMMApiRequest -Method 'DELETE' -Path '/rest-api/v1/accounts/{accountId}/reservations/{reservationId}' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
        }
    }
}
