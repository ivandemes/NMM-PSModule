function New-NMMAccountprovisioningConfigurePsa {
    <#
.SYNOPSIS
Step 5: Start Configure PSA account mapping step (add job)
.DESCRIPTION
## Notes
Map this account to a customer in one or more configured PSA (Professional Services Automation) systems.
Use **/rest-api/v1/accountprovisioning/psaAccountConfigurations** to get the list of available PSA systems and their identifiers.
            
- AccountId: account ID.
- Configurations: list of PSA account mappings. Specify an entry for each PSA system you want to enable or disable for this account.
    - PsaAccountConfigurationId: identifier of the configured PSA system (see psaAccountConfigurations endpoint).
    - Enabled: indicates whether this account is mapped to the PSA system.
    - PsaAccountId: identifier of the customer in the PSA system. Required when Enabled is true. Specify null to disable the mapping.
.PARAMETER InputObject
The JSON request body. Objects and hashtables are serialized automatically.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
New-NMMAccountprovisioningConfigurePsa -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accountprovisioning/configurePsa
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $false, ValueFromPipeline = $true)]
        [AllowNull()]
        [object] $InputObject,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}

        $queryValues = @{}

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/accountprovisioning/configurePsa', 'POST')) {
            Invoke-NMMApiRequest -Method 'POST' -Path '/rest-api/v1/accountprovisioning/configurePsa' -PathValues $pathValues -QueryValues $queryValues -Body $InputObject -BodyWasBound:$PSBoundParameters.ContainsKey('InputObject') -Connection $Connection
        }
    }
}
