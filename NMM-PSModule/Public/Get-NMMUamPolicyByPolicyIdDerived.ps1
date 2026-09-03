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
.PARAMETER Filter
A client-side filter applied to each item returned by the API. Accepts a script block such as { $_.name -like 'Prod*' } or a string such as "name -like 'Prod*'". API-native query parameters should be preferred when available.
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
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [Alias('Id')]
        [int] $PolicyId,

        [Parameter()]
        [ValidateScript({ $_ -is [scriptblock] -or ($_ -is [string] -and -not [string]::IsNullOrWhiteSpace($_)) })]
        [object] $Filter,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['policyId'] = $PolicyId
        $queryValues = @{}

        $response = Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/uam/policy/{policyId}/derived' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
        if ($PSBoundParameters.ContainsKey('Filter')) {
            $filterScript = ConvertTo-NMMFilterScript -Filter $Filter
            $response | Where-Object -FilterScript $filterScript
        }
        else {
            $response
        }
    }
}
