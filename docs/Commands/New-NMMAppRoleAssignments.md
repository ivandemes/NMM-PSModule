# New-NMMAppRoleAssignments

## Synopsis

Assign app role to principals.

## Syntax

~~~powershell
New-NMMAppRoleAssignments [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes
- RoleId: ID of role to be assigned.
- PrincipalIds: a list of principals IDs to assign app role to.
- GuestEmails: a list of emails of guest principals to assign app role to.
- AccessToAccounts: specifies restriction of access to existing accounts. Might be "Restricted" (grant access to specific accounts) or "All" (grant access to all accounts).
- AccountIds: IDs of accounts that should grant access to (when AccessToAccounts is "Restricted"). Value is ignored when AccessToAccounts is "All".
- Expiration (if both are null - unlimited access):
    - ExpirationDurationInHours: expiration time in hours. Might be: 0, 1, 8, 24, 168, 720, 1440, 2160, 4320.
    - ExpirationDate: specific expiration date (the minimum expiration period is 1 minute).
- SendInvitationEmail: indicates whether to send invitation mail to guest principals.

## API operation

POST /rest-api/v1/app-role-assignments
