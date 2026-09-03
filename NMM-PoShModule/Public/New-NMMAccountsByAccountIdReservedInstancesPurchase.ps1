function New-NMMAccountsByAccountIdReservedInstancesPurchase {
    <#
.SYNOPSIS
Purchase `ReservationOrder`
.DESCRIPTION
## Notes
- OrderId: Order Id of the reservation that can be obtained from the 'calculate' endpoint.
- SubscriptionId: Subscription that will be charged for the purchased reservation.
- DisplayName: Friendly name of the reservation.
- BillingPlan: Monthly, Upfront.
- Term: P1Y, P3Y.
- Region: The Azure region where the reserved resource lives.
- Size: Vm Size.
- IsInstanceFlexible: Instance Size flexibility.
- Quantity: Quantity of the skus that are part of the reservation.
- IsRenewEnabled: Setting this to true will automatically purchase a new reservation on the expiration date time.
.PARAMETER AccountId
No additional description is provided by the API specification.
.PARAMETER InputObject
The JSON request body. Objects and hashtables are serialized automatically.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
New-NMMAccountsByAccountIdReservedInstancesPurchase -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/reservedInstances/purchase
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [string] $AccountId,

        [Parameter(Mandatory = $false, ValueFromPipeline = $true)]
        [AllowNull()]
        [object] $InputObject,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['accountId'] = $AccountId
        $queryValues = @{}

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/accounts/{accountId}/reservedInstances/purchase', 'POST')) {
            Invoke-NMMApiRequest -Method 'POST' -Path '/rest-api/v1/accounts/{accountId}/reservedInstances/purchase' -PathValues $pathValues -QueryValues $queryValues -Body $InputObject -BodyWasBound:$PSBoundParameters.ContainsKey('InputObject') -Connection $Connection
        }
    }
}
