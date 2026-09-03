# New-NMMAccountsByAccountIdReservedInstancesPurchase

## Synopsis

Purchase `ReservationOrder`

## Syntax

~~~powershell
New-NMMAccountsByAccountIdReservedInstancesPurchase -AccountId <string> [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

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

## API operation

POST /rest-api/v1/accounts/{accountId}/reservedInstances/purchase
