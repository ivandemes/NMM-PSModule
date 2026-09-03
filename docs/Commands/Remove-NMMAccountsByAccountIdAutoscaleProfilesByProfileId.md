# Remove-NMMAccountsByAccountIdAutoscaleProfilesByProfileId

## Synopsis

Delete the account auto-scale profile by id

## Syntax

~~~powershell
Remove-NMMAccountsByAccountIdAutoscaleProfilesByProfileId -ProfileId <integer> -AccountId <string> [-Connection <psobject>]
~~~

## Description

## Notes
- Id: Auto-scale profile id.

## API operation

DELETE /rest-api/v1/accounts/{accountId}/autoscale-profiles/{profileId}
