function New-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameClone {
    <#
.SYNOPSIS
Clone the desktop image
.DESCRIPTION
## Notes
- ImageId: Desktop Image id to be used as the golden image for newly created session hosts.You can use existing one, or create new. Examples of images: 
MicrosoftWindowsDesktop/Windows-10/win10-22h2-avd/latest, MicrosoftWindowsDesktop/Office-365/19h2-evd-o365pp/latest.
- VmSize: VM size of newly created session hosts.The most popular session host VM families are Dsv3 and Esv3.Examples of sizes for this field: Standard_B1ls, 
Standard_D2_v3.
- StorageType and DiskSize: OS Disk type and size of newly created session hosts.Must be equal to or larger than the size of the Desktop Image selected above. 
Using Standard HDD(S-type) disks is not recommended.Premium SSD provides best performance. StorageType varieties: Standard_LRS, Premium_LRS, StandardSSD_LRS, UltraSSD_LRS.
- ResourceGroupId: Choose one from managed resource groups.
- NetworkId: Choose one from managed networks.
- ImageVMName: Name of desktop image that will be visible to the end-user. Alphanumeric characters only.
- LocalAdminCredentials: Provide custom credentials for a local administrator user. Leave it null to skip.
- Description: Description of desktop image for administrators.
- DirectoryProfileId: ID of predefined configuration. Leave it null to skip AD joining.
- NoImageObjectRequired: Create Desktop Image VM only but do not create an image object.
You will need to create the image object by using "Power off and set as image" request after the VM is created before this Desktop Image can be used for 
session host creation.Skipping image creation allows for changes to be made to the VM before it is converted to an image.
- EnableTimezoneRedirection: Enabling time zone redirection on the image allows each user to see their local device's timezone inside of their AVD desktop session.
- CustomScriptEnable: Current set of scripted actions is enabled for executing.
- ScriptedActionsIds: The list of int numbers of scripts.
- ScriptDirectoryProfileId: Pass directory id for credentials.Reference as $ADUsername and $ADPassword in the script. Can be null.
- VmTimezone: Configures the local time zone on image VM. Leave it null to default configuration.
- UseForCloudPc: Use the image for cloud PC if cloud PC is enabled.
- InstallCertificates: Install all stored certificates on image VM if any.
- GalleryImageParams: Store image in Azure compute gallery and automatically distribute to selected Azure regions.
-- GalleryId: Select an existing Azure compute gallery or create a new one. Only one gallery can be selected. Existing gallery must be in a linked resource group.
-- TargetRegions: Select Azure regions where the Image version should be replicated. The current Azure region must be part of the selection.
-- SetInactive: Use false for distribution
-- StorageAccountType: Specify the storage account type for the managed disk. Possible values: Standard_LRS, Premium_LRS.
.PARAMETER Name
No additional description is provided by the API specification.
.PARAMETER ResourceGroup
No additional description is provided by the API specification.
.PARAMETER SubscriptionId
No additional description is provided by the API specification.
.PARAMETER AccountId
No additional description is provided by the API specification.
.PARAMETER InputObject
The JSON request body. Objects and hashtables are serialized automatically.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
New-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameClone -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/desktop-image/{subscriptionId}/{resourceGroup}/{name}/clone
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [string] $Name,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [string] $ResourceGroup,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [string] $SubscriptionId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [string] $AccountId,

        [Parameter(Mandatory = $false, ValueFromPipeline = $true)]
        [AllowNull()]
        [object] $InputObject,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['name'] = $Name
        $pathValues['resourceGroup'] = $ResourceGroup
        $pathValues['subscriptionId'] = $SubscriptionId
        $pathValues['accountId'] = $AccountId
        $queryValues = @{}

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/accounts/{accountId}/desktop-image/{subscriptionId}/{resourceGroup}/{name}/clone', 'POST')) {
            Invoke-NMMApiRequest -Method 'POST' -Path '/rest-api/v1/accounts/{accountId}/desktop-image/{subscriptionId}/{resourceGroup}/{name}/clone' -PathValues $pathValues -QueryValues $queryValues -Body $InputObject -BodyWasBound:$PSBoundParameters.ContainsKey('InputObject') -Connection $Connection
        }
    }
}
