function New-NMMAccountsByAccountIdRecoveryVaultLinkVault {
    <#
.SYNOPSIS
Link to existing vault
.DESCRIPTION
No additional description is provided by the API specification.
.PARAMETER VaultId
No additional description is provided by the API specification.
.PARAMETER AccountId
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
New-NMMAccountsByAccountIdRecoveryVaultLinkVault -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/recovery-vault/link/vault
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
        if ($PSCmdlet.ShouldProcess('/rest-api/v1/accounts/{accountId}/recovery-vault/link/vault', 'POST')) {
            Invoke-NMMApiRequest -Method 'POST' -Path '/rest-api/v1/accounts/{accountId}/recovery-vault/link/vault' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
        }
    }
}
