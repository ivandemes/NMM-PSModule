function New-NMMAccountsByAccountIdRecoveryVault {
    <#
.SYNOPSIS
Create new vault
.DESCRIPTION
## Notes
- VaultName: Must be less then 20 symbols.
- Location: Region for new vault. E.g. centralus, eastus.
- ReplicationType: Replication type for new vault. Should be LocallyRedundant, GeoRedundant or ZoneRedundant.
- The ZoneRedundant replication type supports a limited list of regions: https://learn.microsoft.com/en-us/azure/backup/backup-support-matrix#zone-redundant-storage-support
.PARAMETER AccountId
No additional description is provided by the API specification.
.PARAMETER InputObject
The JSON request body. Objects and hashtables are serialized automatically.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
New-NMMAccountsByAccountIdRecoveryVault -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/recovery-vault
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [string] $AccountId,

        [Parameter(Mandatory = $false, ValueFromPipeline = $true)]
        [AllowNull()]
        [object] $InputObject,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['accountId'] = $AccountId
        $queryValues = @{}

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/accounts/{accountId}/recovery-vault', 'POST')) {
            Invoke-NMMApiRequest -Method 'POST' -Path '/rest-api/v1/accounts/{accountId}/recovery-vault' -PathValues $pathValues -QueryValues $queryValues -Body $InputObject -BodyWasBound:$PSBoundParameters.ContainsKey('InputObject') -Connection $Connection
        }
    }
}
