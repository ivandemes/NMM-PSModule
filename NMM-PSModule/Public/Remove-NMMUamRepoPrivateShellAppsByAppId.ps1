function Remove-NMMUamRepoPrivateShellAppsByAppId {
    <#
.SYNOPSIS
Delete Shell application.
.DESCRIPTION
No additional description is provided by the API specification.
.PARAMETER AppId
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Remove-NMMUamRepoPrivateShellAppsByAppId -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/uam/repo/private/shell/apps/{appId}
#>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
    param(
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [Alias('Id')]
        [int] $AppId,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['appId'] = $AppId
        $queryValues = @{}

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/uam/repo/private/shell/apps/{appId}', 'DELETE')) {
            Invoke-NMMApiRequest -Method 'DELETE' -Path '/rest-api/v1/uam/repo/private/shell/apps/{appId}' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
        }
    }
}
