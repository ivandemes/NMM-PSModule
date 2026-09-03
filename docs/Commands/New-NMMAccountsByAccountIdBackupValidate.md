# New-NMMAccountsByAccountIdBackupValidate

## Synopsis

Validate recovery point

## Syntax

~~~powershell
New-NMMAccountsByAccountIdBackupValidate -AccountId <string> [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

Validate chosen recovery point of resource.
## Notes
- SourceResourceId: Id of resource for which backup will be validated.
- RecoveryPointId: Id of chosen recovery point.
- UseBootDiagnosticInsights: Boot Diagnostic Insights utilized Azure AI Computer Vision to analyze Boot Diagnostic Images for valid boot states.
- BlockInternetAccess: Disable Virtual Machine Internet Access during Validation. Disabling internet access for the validation virtual machine can prevent alerts from being generated in monitoring tools.

## API operation

POST /rest-api/v1/accounts/{accountId}/backup/validate
