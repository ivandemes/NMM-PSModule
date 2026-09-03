# Remove-NMMAutoscaleProfilesByProfileId

## Synopsis

Delete the global auto-scale profile by id

## Syntax

~~~powershell
Remove-NMMAutoscaleProfilesByProfileId -ProfileId <integer> [-Connection <psobject>]
~~~

## Description

## Notes
- Id: Auto-scale profile id.

## API operation

DELETE /rest-api/v1/autoscale-profiles/{profileId}
