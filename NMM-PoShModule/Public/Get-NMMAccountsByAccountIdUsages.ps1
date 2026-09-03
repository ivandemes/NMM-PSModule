function Get-NMMAccountsByAccountIdUsages {
    <#
.SYNOPSIS
Get usages
.DESCRIPTION
- Start date: the beginning of the period for which usages is taken    
Default value: End date - 30 days    
- End date: the end of the period for which usages is taken    
Default value: current date    
- Period should be 31 days or less
.PARAMETER StartDate
No additional description is provided by the API specification.
.PARAMETER EndDate
No additional description is provided by the API specification.
.PARAMETER WithDetails
No additional description is provided by the API specification.
.PARAMETER AccountId
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Get-NMMAccountsByAccountIdUsages -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/usages
#>
    [CmdletBinding(SupportsShouldProcess = $false)]
    param(
        [Parameter(Mandatory = $false)]
        [datetime] $StartDate,

        [Parameter(Mandatory = $false)]
        [datetime] $EndDate,

        [Parameter(Mandatory = $false)]
        [bool] $WithDetails,

        [Parameter(Mandatory = $true)]
        [string] $AccountId,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['accountId'] = $AccountId
        $queryValues = @{}
        if ($PSBoundParameters.ContainsKey('StartDate')) { $queryValues['startDate'] = $StartDate }
        if ($PSBoundParameters.ContainsKey('EndDate')) { $queryValues['endDate'] = $EndDate }
        if ($PSBoundParameters.ContainsKey('WithDetails')) { $queryValues['withDetails'] = $WithDetails }
        Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/accounts/{accountId}/usages' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
    }
}
