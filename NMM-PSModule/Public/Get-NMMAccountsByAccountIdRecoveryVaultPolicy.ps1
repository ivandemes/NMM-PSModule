function Get-NMMAccountsByAccountIdRecoveryVaultPolicy {
    <#
.SYNOPSIS
Get full policy data
.DESCRIPTION
No additional description is provided by the API specification.
.PARAMETER VaultId
No additional description is provided by the API specification.
.PARAMETER PolicyName
No additional description is provided by the API specification.
.PARAMETER AccountId
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Get-NMMAccountsByAccountIdRecoveryVaultPolicy -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/recovery-vault/policy
#>
    [CmdletBinding(SupportsShouldProcess = $false)]
    param(
        [Parameter(Mandatory = $true)]
        [string] $VaultId,

        [Parameter(Mandatory = $true)]
        [string] $PolicyName,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [Alias('Id')]
        [string] $AccountId,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['accountId'] = $AccountId
        $queryValues = @{}
        if ($PSBoundParameters.ContainsKey('VaultId')) { $queryValues['vaultId'] = $VaultId }
        if ($PSBoundParameters.ContainsKey('PolicyName')) { $queryValues['policyName'] = $PolicyName }
        Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/accounts/{accountId}/recovery-vault/policy' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
    }
}
