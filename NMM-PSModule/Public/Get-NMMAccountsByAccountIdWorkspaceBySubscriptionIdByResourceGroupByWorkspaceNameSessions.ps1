function Get-NMMAccountsByAccountIdWorkspaceBySubscriptionIdByResourceGroupByWorkspaceNameSessions {
    <#
.SYNOPSIS
Get workspace user sessions
.DESCRIPTION
No additional description is provided by the API specification.
.PARAMETER SubscriptionId
No additional description is provided by the API specification.
.PARAMETER ResourceGroup
No additional description is provided by the API specification.
.PARAMETER WorkspaceName
No additional description is provided by the API specification.
.PARAMETER AccountId
No additional description is provided by the API specification.
.PARAMETER Filter
A client-side filter applied to each item returned by the API. Accepts a script block such as { $_.name -like 'Prod*' } or a string such as "name -like 'Prod*'". API-native query parameters should be preferred when available.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Get-NMMAccountsByAccountIdWorkspaceBySubscriptionIdByResourceGroupByWorkspaceNameSessions -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/workspace/{subscriptionId}/{resourceGroup}/{workspaceName}/sessions
#>
    [CmdletBinding(SupportsShouldProcess = $false)]
    param(
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [string] $SubscriptionId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [string] $ResourceGroup,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [string] $WorkspaceName,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [string] $AccountId,

        [Parameter()]
        [ValidateScript({ $_ -is [scriptblock] -or ($_ -is [string] -and -not [string]::IsNullOrWhiteSpace($_)) })]
        [object] $Filter,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['subscriptionId'] = $SubscriptionId
        $pathValues['resourceGroup'] = $ResourceGroup
        $pathValues['workspaceName'] = $WorkspaceName
        $pathValues['accountId'] = $AccountId
        $queryValues = @{}

        $response = Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/accounts/{accountId}/workspace/{subscriptionId}/{resourceGroup}/{workspaceName}/sessions' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
        if ($PSBoundParameters.ContainsKey('Filter')) {
            $filterScript = ConvertTo-NMMFilterScript -Filter $Filter
            $response | Where-Object -FilterScript $filterScript
        }
        else {
            $response
        }
    }
}
