function Get-NMMAccountsByAccountIdReservationsByReservationIdResources {
    <#
.SYNOPSIS
Get resource names associated to reservation
.DESCRIPTION
No additional description is provided by the API specification.
.PARAMETER ReservationId
Route param: Id of reservation
.PARAMETER AccountId
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Get-NMMAccountsByAccountIdReservationsByReservationIdResources -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/reservations/{reservationId}/resources
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

        Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/accounts/{accountId}/reservations/{reservationId}/resources' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
    }
}
