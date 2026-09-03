function Get-NMMAccountprovisioningPsaAccountConfigurations {
    <#
.SYNOPSIS
Get the list of configured PSA (Professional Services Automation) systems
.DESCRIPTION
## Notes
Use this endpoint to discover the PSA systems that can be mapped in **/rest-api/v1/accountprovisioning/configurePsa**.
            
- PsaAccountConfigurationId: identifier of the configured PSA system. Provide this value as Configurations[].PsaAccountConfigurationId when calling configurePsa.
- DisplayName: display name of the configured PSA system.
- SystemType: type of the PSA system - Halo, Autotask or Connectwise.
- IsCredentialsConfigurationInvalid: when true, the PSA system's credentials are invalid and it cannot be mapped to an account until they are re-validated. Only configure a system with Enabled = true when this is false.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Get-NMMAccountprovisioningPsaAccountConfigurations -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accountprovisioning/psaAccountConfigurations
#>
    [CmdletBinding(SupportsShouldProcess = $false)]
    param(
        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}

        $queryValues = @{}

        Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/accountprovisioning/psaAccountConfigurations' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
    }
}
