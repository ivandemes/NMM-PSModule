# Set-NMMUamAppGroupByIdAssign

## Synopsis

Assign app group.

## Syntax

~~~powershell
Set-NMMUamAppGroupByIdAssign -Id <integer> [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes
- AssignToAllAccounts: true if need to assign app group to all accounts.
- AccountIds: list of account IDs to assign app group to.
Child apps will inherit group assignments. Unassigning app group from account will not affect individual app assignments.

## API operation

PUT /rest-api/v1/uam/appGroup/{id}/assign
