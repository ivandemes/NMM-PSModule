function Get-NMMUamPolicy {
    <#
.SYNOPSIS
Get MSP app deployment policies.
.DESCRIPTION
No additional description is provided by the API specification.
.PARAMETER IncludeRecurrent
No additional description is provided by the API specification.
.PARAMETER IncludeOneTime
No additional description is provided by the API specification.
.PARAMETER Filter
A client-side filter applied to each item returned by the API. Accepts a script block such as { $_.name -like 'Prod*' } or a string such as "name -like 'Prod*'". API-native query parameters should be preferred when available.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Get-NMMUamPolicy -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/uam/policy
#>
    [CmdletBinding(SupportsShouldProcess = $false)]
    param(
        [Parameter(Mandatory = $false)]
        [bool] $IncludeRecurrent,

        [Parameter(Mandatory = $false)]
        [bool] $IncludeOneTime,

        [Parameter()]
        [ValidateScript({ $_ -is [scriptblock] -or ($_ -is [string] -and -not [string]::IsNullOrWhiteSpace($_)) })]
        [object] $Filter,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}

        $queryValues = @{}
        if ($PSBoundParameters.ContainsKey('IncludeRecurrent')) { $queryValues['includeRecurrent'] = $IncludeRecurrent }
        if ($PSBoundParameters.ContainsKey('IncludeOneTime')) { $queryValues['includeOneTime'] = $IncludeOneTime }
        $response = Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/uam/policy' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
        if ($PSBoundParameters.ContainsKey('Filter')) {
            $filterScript = ConvertTo-NMMFilterScript -Filter $Filter
            $response | Where-Object -FilterScript $filterScript
        }
        else {
            $response
        }
    }
}
