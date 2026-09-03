# Set-NMMAppRoleAssignments

## Synopsis

Update app role for principal.

## Syntax

~~~powershell
Set-NMMAppRoleAssignments [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes
- RoleId: ID of role to be assigned.
- PrincipalId: principals ID to assign app role to.
- AccessToAccounts: specifies restriction of access to existing accounts. Might be "Restricted" (grant access to specific accounts) or "All" (grant access to all accounts).
- AccountIds: IDs of accounts that should grant access to (when AccessToAccounts is "Restricted"). Value is ignored when AccessToAccounts is "All".

## API operation

PUT /rest-api/v1/app-role-assignments
