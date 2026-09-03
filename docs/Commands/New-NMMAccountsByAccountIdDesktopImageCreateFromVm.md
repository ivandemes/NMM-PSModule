# New-NMMAccountsByAccountIdDesktopImageCreateFromVm

## Synopsis

Create the desktop image from Azure VM

## Syntax

~~~powershell
New-NMMAccountsByAccountIdDesktopImageCreateFromVm -AccountId <string> [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes
- SASUri: Paste the SAS URL link exported from the source VM’s managed disk. To generate the SAS URL, go to Azure Portal and find the source VM you want to 
import as an image. Stop it and go to its managed OS disk object. Click on Disk Export under the Settings section. 
Type in the expiration duration in seconds (be sure it’s at least several hours for the copy process to complete) and click Generate URL.
- HyperVGeneration: <a href="https://docs.microsoft.com/en-us/azure/virtual-machines/generation-2" target="_blank" rel="noopener noreferrer">Learn more</a> about 
differences between Gen1 and Gen2 VMs.
- UninstallFSLogix: Use this option if FSLogix app is already installed in the base image and you want to remove it in order to allow Nerdio Manager to manage FSLogix.
- UninstallWVDAgent: Use this option if you’re creating an image from an existing AVD session host where the AVD agent has been previously installed.
- ImageId: Desktop Image id to be used as the golden image for newly created session hosts.You can use existing one, or create new. Examples of images: 
MicrosoftWindowsDesktop/Windows-10/win10-22h2-avd/latest, MicrosoftWindowsDesktop/Office-365/19h2-evd-o365pp/latest.
- VmSize: VM size of newly created session hosts.The most popular session host VM families are Dsv3 and Esv3.Examples of sizes for this field: Standard_B1ls, 
Standard_D2_v3.
- StorageType and DiskSize: OS Disk type and size of newly created session hosts. Must be equal to or larger than the size of the Desktop Image selected above. 
Using Standard HDD(S-type) disks is not recommended.Premium SSD provides best performance. StorageType varieties: Standard_LRS, Premium_LRS, StandardSSD_LRS, UltraSSD_LRS.
- ResourceGroupId: Choose one from managed resource groups.
- NetworkId: Choose one from managed networks. If SubnetName is not provided, NetworkId must uniquely identify a linked network. If multiple linked subnets exist for the same NetworkId, specify SubnetName to avoid deploying into an unexpected subnet.
- SubnetName: Optional subnet name within the selected virtual network. When provided, the API will use the matching subnet for an exact lookup. When empty, the API automatically uses the linked subnet, but only when a single subnet in the vNet is linked. A 404 code will be returned if multiple subnets in the vNet are linked.
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
- UseForCloudPc: Use the image for cloud PC if cloud PC is enabled. The image will be uploaded and tested for compatibility with cloud PC. 
This process can take a long time. There is a limit of 20 images that can be uploaded. 
**Important note**: Make sure that selected image satisfies following 
<a href="https://docs.microsoft.com/en-us/windows-365/enterprise/device-images#image-requirements" target="_blank">requirements</a>.
- InstallCertificates: Install all stored certificates on image VM if any.
- GalleryImageParams: Store image in Azure compute gallery and automatically distribute to selected Azure regions.
-- GalleryId: Select an existing Azure compute gallery or create a new one. Only one gallery can be selected. Existing gallery must be in a linked resource group.
-- TargetRegions: Select Azure regions where the Image version should be replicated. The current Azure region must be part of the selection.
-- SetInactive: Use false for distribution
-- StorageAccountType: Specify the storage account type for the managed disk. Possible values: Standard_LRS, Premium_LRS.
- UseTrustedLaunch: Azure offers trusted launch as a seamless way to improve the security of generation 2 VMs. Trusted launch protects against advanced and persistent attack techniques. 
Trusted launch is composed of several, coordinated infrastructure technologies that can be enabled independently. Each technology provides another layer of defense against sophisticated threats.
GalleryId is required for trusted launch.
- ValidateImage: Validating the image will apply the image to Virtual Machine, gather boot diagnostics, and verify the virtual machine successfully boots before creating a Managed Image or publishing to Azure Compute Gallery.
- UseBootDiagnosticInsights: Boot Diagnostic Insights utilized Azure AI Computer Vision to analyze Boot Diagnostic Images for valid boot states.

## API operation

POST /rest-api/v1/accounts/{accountId}/desktop-image/create-from-vm
