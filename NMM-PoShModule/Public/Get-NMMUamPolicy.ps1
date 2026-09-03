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
        [psobject] $Connection
    )

    process {
        $pathValues = @{}

        $queryValues = @{}
        if ($PSBoundParameters.ContainsKey('IncludeRecurrent')) { $queryValues['includeRecurrent'] = $IncludeRecurrent }
        if ($PSBoundParameters.ContainsKey('IncludeOneTime')) { $queryValues['includeOneTime'] = $IncludeOneTime }
        Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/uam/policy' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
    }
}
