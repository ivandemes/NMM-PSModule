function Get-NMMAccountprovisioningPsaAccountConfigurationsByPsaAccountConfigurationIdCustomersLoadingState {
    <#
.SYNOPSIS
Get the loading state of a configured PSA system's customers
.DESCRIPTION
## Notes
Use this endpoint to track the progress of the customers loading job started with
**/rest-api/v1/accountprovisioning/psaAccountConfigurations/{psaAccountConfigurationId}/customers/refresh**.
            
- IsLoading: indicates whether a customers loading job is currently in progress. Once it becomes false, the customers list is ready.
- LoadedCount / TotalCount: progress of the loading job. Available while IsLoading is true.
- LoadedUtc: UTC date and time when the customers cache was last successfully populated.
            
- psaAccountConfigurationId: identifier of the configured PSA system (see psaAccountConfigurations endpoint).
.PARAMETER PsaAccountConfigurationId
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Get-NMMAccountprovisioningPsaAccountConfigurationsByPsaAccountConfigurationIdCustomersLoadingState -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accountprovisioning/psaAccountConfigurations/{psaAccountConfigurationId}/customers/loading-state
#>
    [CmdletBinding(SupportsShouldProcess = $false)]
    param(
        [Parameter(Mandatory = $true)]
        [int] $PsaAccountConfigurationId,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['psaAccountConfigurationId'] = $PsaAccountConfigurationId
        $queryValues = @{}

        Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/accountprovisioning/psaAccountConfigurations/{psaAccountConfigurationId}/customers/loading-state' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
    }
}
