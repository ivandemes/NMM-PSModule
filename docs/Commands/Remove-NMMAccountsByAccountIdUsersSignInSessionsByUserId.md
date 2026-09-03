# Remove-NMMAccountsByAccountIdUsersSignInSessionsByUserId

## Synopsis

Revoke all sign-in sessions for user.

## Syntax

~~~powershell
Remove-NMMAccountsByAccountIdUsersSignInSessionsByUserId -UserId <string> -AccountId <string> [-Connection <psobject>]
~~~

## Description

No additional description is provided by the API specification.

## API operation

DELETE /rest-api/v1/accounts/{accountId}/users/signInSessions/{userId}
