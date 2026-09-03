function New-NMMAccountsByAccountIdRecoveryVaultUnlinkVault {
    <#
.SYNOPSIS
Unlink vault
.DESCRIPTION
No additional description is provided by the API specification.
.PARAMETER VaultId
No additional description is provided by the API specification.
.PARAMETER AccountId
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
New-NMMAccountsByAccountIdRecoveryVaultUnlinkVault -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/recovery-vault/unlink/vault
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [string] $VaultId,

        [Parameter(Mandatory = $true)]
        [string] $AccountId,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['accountId'] = $AccountId
        $queryValues = @{}
        if ($PSBoundParameters.ContainsKey('VaultId')) { $queryValues['vaultId'] = $VaultId }
        if ($PSCmdlet.ShouldProcess('/rest-api/v1/accounts/{accountId}/recovery-vault/unlink/vault', 'POST')) {
            Invoke-NMMApiRequest -Method 'POST' -Path '/rest-api/v1/accounts/{accountId}/recovery-vault/unlink/vault' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
        }
    }
}
