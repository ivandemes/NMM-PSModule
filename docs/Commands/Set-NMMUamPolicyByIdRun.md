# Set-NMMUamPolicyByIdRun

## Synopsis

Force run MSP app deployment policy.

## Syntax

~~~powershell
Set-NMMUamPolicyByIdRun -Id <integer> [-Connection <psobject>]
~~~

## Description

## Notes:
Forces execution of the MSP policy triggering synchronization of all derived account-level policies.

## API operation

PUT /rest-api/v1/uam/policy/{id}/run
