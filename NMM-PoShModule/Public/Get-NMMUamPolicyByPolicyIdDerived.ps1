function Get-NMMUamPolicyByPolicyIdDerived {
    <#
.SYNOPSIS
Get derived account-level policies from MSP policy.
.DESCRIPTION
## Notes:
Returns a list of all account-level policies that were created from this MSP policy.
Each derived policy represents the MSP policy's deployment to a specific account.
.PARAMETER PolicyId
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Get-NMMUamPolicyByPolicyIdDerived -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/uam/policy/{policyId}/derived
#>
    [CmdletBinding(SupportsShouldProcess = $false)]
    param(
        [Parameter(Mandatory = $true)]
        [int] $PolicyId,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['policyId'] = $PolicyId
        $queryValues = @{}

        Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/uam/policy/{policyId}/derived' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
    }
}
