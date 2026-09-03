function Get-NMMJobByJobId {
    <#
.SYNOPSIS
Get job information by id
.DESCRIPTION
No additional description is provided by the API specification.
.PARAMETER JobId
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Get-NMMJobByJobId -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/job/{jobId}
#>
    [CmdletBinding(SupportsShouldProcess = $false)]
    param(
        [Parameter(Mandatory = $true)]
        [int] $JobId,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['jobId'] = $JobId
        $queryValues = @{}

        Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/job/{jobId}' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
    }
}
