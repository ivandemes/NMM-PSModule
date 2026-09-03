function New-NMMUamRepoPrivateShell {
    <#
.SYNOPSIS
Create new Shell Apps repository
.DESCRIPTION
## Notes
You can leave all fields empty to create repo without storage
- LinkedResourceGroupId: ID of linked Azure resource group where Shell Repo resources will be created.
- Region: Azure region where Shell Repo resources will be created.
- StorageAccountId: ID of existing storage account. Leave empty if need to create new storage account.
- StorageAccountName: Name of new storage account to be created. Leave empty if need to re-use existing storage account.
.PARAMETER InputObject
The JSON request body. Objects and hashtables are serialized automatically.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
New-NMMUamRepoPrivateShell -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/uam/repo/private/shell
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

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/uam/repo/private/shell', 'POST')) {
            Invoke-NMMApiRequest -Method 'POST' -Path '/rest-api/v1/uam/repo/private/shell' -PathValues $pathValues -QueryValues $queryValues -Body $InputObject -BodyWasBound:$PSBoundParameters.ContainsKey('InputObject') -Connection $Connection
        }
    }
}
