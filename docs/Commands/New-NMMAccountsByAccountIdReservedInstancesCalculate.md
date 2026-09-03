# New-NMMAccountsByAccountIdReservedInstancesCalculate

## Synopsis

Calculate price for placing a `ReservationOrder`

## Syntax

~~~powershell
New-NMMAccountsByAccountIdReservedInstancesCalculate -AccountId <string> [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes
- SubscriptionId: Subscription that will be charged for the purchased reservation.
- DisplayName: Friendly name of the reservation.
- BillingPlan: Monthly, Upfront
- Term: P1Y, P3Y
- Region: The Azure region where the reserved resource lives.
- Size: Vm Size.
- IsInstanceFlexible: Instance Size flexibility
- Quantity: Quantity of the skus that are part of the reservation.

## API operation

POST /rest-api/v1/accounts/{accountId}/reservedInstances/calculate
