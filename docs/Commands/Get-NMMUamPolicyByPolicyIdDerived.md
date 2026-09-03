# Get-NMMUamPolicyByPolicyIdDerived

## Synopsis

Get derived account-level policies from MSP policy.

## Syntax

~~~powershell
Get-NMMUamPolicyByPolicyIdDerived -PolicyId <integer> [-Connection <psobject>]
~~~

## Description

## Notes:
Returns a list of all account-level policies that were created from this MSP policy.
Each derived policy represents the MSP policy's deployment to a specific account.

## API operation

GET /rest-api/v1/uam/policy/{policyId}/derived
