function Get-NMMAccountsByAccountIdRecoveryVaultPolicies {
    <#
.SYNOPSIS
Get all policies in the vault
.DESCRIPTION
No additional description is provided by the API specification.
.PARAMETER VaultId
No additional description is provided by the API specification.
.PARAMETER AccountId
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Get-NMMAccountsByAccountIdRecoveryVaultPolicies -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/recovery-vault/policies
#>
    [CmdletBinding(SupportsShouldProcess = $false)]
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
        Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/accounts/{accountId}/recovery-vault/policies' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
    }
}
