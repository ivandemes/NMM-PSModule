function New-NMMAccountsByAccountIdReservedInstancesCalculate {
    <#
.SYNOPSIS
Calculate price for placing a `ReservationOrder`
.DESCRIPTION
## Notes
- SubscriptionId: Subscription that will be charged for the purchased reservation.
- DisplayName: Friendly name of the reservation.
- BillingPlan: Monthly, Upfront
- Term: P1Y, P3Y
- Region: The Azure region where the reserved resource lives.
- Size: Vm Size.
- IsInstanceFlexible: Instance Size flexibility
- Quantity: Quantity of the skus that are part of the reservation.
.PARAMETER AccountId
No additional description is provided by the API specification.
.PARAMETER InputObject
The JSON request body. Objects and hashtables are serialized automatically.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
New-NMMAccountsByAccountIdReservedInstancesCalculate -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/reservedInstances/calculate
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

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/accounts/{accountId}/reservedInstances/calculate', 'POST')) {
            Invoke-NMMApiRequest -Method 'POST' -Path '/rest-api/v1/accounts/{accountId}/reservedInstances/calculate' -PathValues $pathValues -QueryValues $queryValues -Body $InputObject -BodyWasBound:$PSBoundParameters.ContainsKey('InputObject') -Connection $Connection
        }
    }
}
