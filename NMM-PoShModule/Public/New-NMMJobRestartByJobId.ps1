function New-NMMJobRestartByJobId {
    <#
.SYNOPSIS
Restart job
.DESCRIPTION
No additional description is provided by the API specification.
.PARAMETER JobId
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
New-NMMJobRestartByJobId -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/job/restart/{jobId}
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [Alias('Id')]
        [int] $JobId,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['jobId'] = $JobId
        $queryValues = @{}

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/job/restart/{jobId}', 'POST')) {
            Invoke-NMMApiRequest -Method 'POST' -Path '/rest-api/v1/job/restart/{jobId}' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
        }
    }
}
