# Set-NMMAccountsByAccountIdUamPolicyByIdRun

## Synopsis

Force run app deployment policy.

## Syntax

~~~powershell
Set-NMMAccountsByAccountIdUamPolicyByIdRun -Id <integer> -AccountId <string> [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes:
- IgnoreDeviceState: execute all actions despite current device state satisfies policy configuration.

## API operation

PUT /rest-api/v1/accounts/{accountId}/uam/policy/{id}/run
