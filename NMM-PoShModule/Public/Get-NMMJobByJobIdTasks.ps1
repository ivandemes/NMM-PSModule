function Get-NMMJobByJobIdTasks {
    <#
.SYNOPSIS
Get all tasks of job by jobId
.DESCRIPTION
No additional description is provided by the API specification.
.PARAMETER JobId
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Get-NMMJobByJobIdTasks -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/job/{jobId}/tasks
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

        Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/job/{jobId}/tasks' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
    }
}
