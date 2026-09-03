function New-NMMAccountprovisioningPsaAccountConfigurationsByPsaAccountConfigurationIdCustomersRefresh {
    <#
.SYNOPSIS
Start loading the customers of a configured PSA system (add job)
.DESCRIPTION
## Notes
Triggers a background job that loads the list of customers from the PSA (Professional Services Automation) system into Nerdio Manager.
The loaded customers are required to obtain the PsaAccountId used in **/rest-api/v1/accountprovisioning/configurePsa**.
            
If a loading job is already in progress for this PSA system, the existing job is returned (a new one is not started).
Poll **/rest-api/v1/accountprovisioning/psaAccountConfigurations/{psaAccountConfigurationId}/customers/loading-state** to track progress,
then read the customers from **/rest-api/v1/accountprovisioning/psaAccountConfigurations/{psaAccountConfigurationId}/customers**.
            
- psaAccountConfigurationId: identifier of the configured PSA system (see psaAccountConfigurations endpoint).
.PARAMETER PsaAccountConfigurationId
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
New-NMMAccountprovisioningPsaAccountConfigurationsByPsaAccountConfigurationIdCustomersRefresh -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accountprovisioning/psaAccountConfigurations/{psaAccountConfigurationId}/customers/refresh
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
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

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/accountprovisioning/psaAccountConfigurations/{psaAccountConfigurationId}/customers/refresh', 'POST')) {
            Invoke-NMMApiRequest -Method 'POST' -Path '/rest-api/v1/accountprovisioning/psaAccountConfigurations/{psaAccountConfigurationId}/customers/refresh' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
        }
    }
}
