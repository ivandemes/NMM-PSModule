function Get-NMMVulnerabilities {
    <#
.SYNOPSIS
Get the list of vulnerabilities
.DESCRIPTION
## Notes
- MinAffectedAccount: filters vulnerabilities that affected at least X accounts. Optional.
- MinCvssV3: filters vulnerabilities with at least X CVSS score. Optional.
- MinAffectedEndpoints: filters vulnerabilities that affected at least X devices. Optional.
- Severity: filters vulnerabilities with at specified severity. Optional.
.PARAMETER MinAffectedAccount
No additional description is provided by the API specification.
.PARAMETER MinCvssV3
No additional description is provided by the API specification.
.PARAMETER MinAffectedEndpoints
No additional description is provided by the API specification.
.PARAMETER Severity
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Get-NMMVulnerabilities -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/vulnerabilities
#>
    [CmdletBinding(SupportsShouldProcess = $false)]
    param(
        [Parameter(Mandatory = $false)]
        [int] $MinAffectedAccount,

        [Parameter(Mandatory = $false)]
        [int] $MinCvssV3,

        [Parameter(Mandatory = $false)]
        [int] $MinAffectedEndpoints,

        [Parameter(Mandatory = $false)]
        [string] $Severity,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}

        $queryValues = @{}
        if ($PSBoundParameters.ContainsKey('MinAffectedAccount')) { $queryValues['minAffectedAccount'] = $MinAffectedAccount }
        if ($PSBoundParameters.ContainsKey('MinCvssV3')) { $queryValues['minCvssV3'] = $MinCvssV3 }
        if ($PSBoundParameters.ContainsKey('MinAffectedEndpoints')) { $queryValues['minAffectedEndpoints'] = $MinAffectedEndpoints }
        if ($PSBoundParameters.ContainsKey('Severity')) { $queryValues['severity'] = $Severity }
        Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/vulnerabilities' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
    }
}
