# Remove-NMMAccountsByAccountIdAutoscaleProfilesByProfileIdAssignments

## Synopsis

Delete the account auto-scale profile assignment

## Syntax

~~~powershell
Remove-NMMAccountsByAccountIdAutoscaleProfilesByProfileIdAssignments -ProfileId <integer> -AccountId <string> [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes
- Id: Auto-scale profile id.

## API operation

DELETE /rest-api/v1/accounts/{accountId}/autoscale-profiles/{profileId}/assignments
