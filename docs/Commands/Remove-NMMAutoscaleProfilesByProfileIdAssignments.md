# Remove-NMMAutoscaleProfilesByProfileIdAssignments

## Synopsis

Delete the global auto-scale profile assignment

## Syntax

~~~powershell
Remove-NMMAutoscaleProfilesByProfileIdAssignments -ProfileId <integer> [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes
- Id: Auto-scale profile id.

## API operation

DELETE /rest-api/v1/autoscale-profiles/{profileId}/assignments
