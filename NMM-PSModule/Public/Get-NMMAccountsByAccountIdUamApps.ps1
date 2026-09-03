function Get-NMMAccountsByAccountIdUamApps {
    <#
.SYNOPSIS
Get applications available in certain account.
.DESCRIPTION
## Notes
Returns list of apps available to specified account, including:
- Apps assigned to the account.
- Mobile apps and Native Intune Windows apps from account's Intune tenant, assigned from MSP level. Note that mobile apps and Native Intune Windows apps from original repos are not included in this list.
- Apps from repos managed at Account level.
Use these apps to create deployment policies.
.PARAMETER AccountId
No additional description is provided by the API specification.
.PARAMETER Filter
A client-side filter applied to each item returned by the API. Accepts a script block such as { $_.name -like 'Prod*' } or a string such as "name -like 'Prod*'". API-native query parameters should be preferred when available.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Get-NMMAccountsByAccountIdUamApps -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/uam/apps
#>
    [CmdletBinding(SupportsShouldProcess = $false)]
    param(
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [Alias('Id')]
        [string] $AccountId,

        [Parameter()]
        [ValidateScript({ $_ -is [scriptblock] -or ($_ -is [string] -and -not [string]::IsNullOrWhiteSpace($_)) })]
        [object] $Filter,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['accountId'] = $AccountId
        $queryValues = @{}

        $response = Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/accounts/{accountId}/uam/apps' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
        if ($PSBoundParameters.ContainsKey('Filter')) {
            $filterScript = ConvertTo-NMMFilterScript -Filter $Filter
            $response | Where-Object -FilterScript $filterScript
        }
        else {
            $response
        }
    }
}
