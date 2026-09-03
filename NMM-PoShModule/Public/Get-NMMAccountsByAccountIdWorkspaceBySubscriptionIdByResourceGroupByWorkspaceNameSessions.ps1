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
        [Parameter(Mandatory = $true)]
        [string] $SubscriptionId,

        [Parameter(Mandatory = $true)]
        [string] $ResourceGroup,

        [Parameter(Mandatory = $true)]
        [string] $WorkspaceName,

        [Parameter(Mandatory = $true)]
        [string] $AccountId,

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

        Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/accounts/{accountId}/workspace/{subscriptionId}/{resourceGroup}/{workspaceName}/sessions' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
    }
}
