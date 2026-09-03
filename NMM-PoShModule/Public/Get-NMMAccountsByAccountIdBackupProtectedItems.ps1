function Get-NMMAccountsByAccountIdBackupProtectedItems {
    <#
.SYNOPSIS
Get all protected items
.DESCRIPTION
## Notes
- Id: Protected item id.
- SourceResourceId: Id of resource that has enabled backup.
- ProtectionState: If Protected or IRPending - item is protected. If ProtectionStopped or ProtectionPaused - protection stopped for this item.
If SoftDeleted = true - item is soft deleted.
.PARAMETER AccountId
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Get-NMMAccountsByAccountIdBackupProtectedItems -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/backup/protectedItems
#>
    [CmdletBinding(SupportsShouldProcess = $false)]
    param(
        [Parameter(Mandatory = $true)]
        [string] $AccountId,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['accountId'] = $AccountId
        $queryValues = @{}

        Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/accounts/{accountId}/backup/protectedItems' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
    }
}
