function New-NMMAccountsByAccountIdBackupValidate {
    <#
.SYNOPSIS
Validate recovery point
.DESCRIPTION
Validate chosen recovery point of resource.
## Notes
- SourceResourceId: Id of resource for which backup will be validated.
- RecoveryPointId: Id of chosen recovery point.
- UseBootDiagnosticInsights: Boot Diagnostic Insights utilized Azure AI Computer Vision to analyze Boot Diagnostic Images for valid boot states.
- BlockInternetAccess: Disable Virtual Machine Internet Access during Validation. Disabling internet access for the validation virtual machine can prevent alerts from being generated in monitoring tools.
.PARAMETER AccountId
No additional description is provided by the API specification.
.PARAMETER InputObject
The JSON request body. Objects and hashtables are serialized automatically.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
New-NMMAccountsByAccountIdBackupValidate -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/backup/validate
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [string] $AccountId,

        [Parameter(Mandatory = $false, ValueFromPipeline = $true)]
        [AllowNull()]
        [object] $InputObject,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['accountId'] = $AccountId
        $queryValues = @{}

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/accounts/{accountId}/backup/validate', 'POST')) {
            Invoke-NMMApiRequest -Method 'POST' -Path '/rest-api/v1/accounts/{accountId}/backup/validate' -PathValues $pathValues -QueryValues $queryValues -Body $InputObject -BodyWasBound:$PSBoundParameters.ContainsKey('InputObject') -Connection $Connection
        }
    }
}
