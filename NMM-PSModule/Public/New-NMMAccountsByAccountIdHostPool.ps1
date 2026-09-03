function New-NMMAccountsByAccountIdHostPool {
    <#
.SYNOPSIS
Create host pool
.DESCRIPTION
## Notes
- Name: Name of host pool that will be visible to the end-user. Alphanumeric characters only.
- Description: Description of host pool for administrators. Description are limited to 512 characters.
- AssignmentType: If *wvdPoolUserExperience = PersonalSingleUserDesktop* then *assignmentType* property must be specified else leave it null. Could
be Automatic or Direct.
- WvdPoolUserExperience: The desktop experience to be provided by the newly created host pool to end-users. Could be PooledMultiUserDesktop,
PooledMultiUserRemoteApp, PooledSingleUserDesktop, PersonalSingleUserDesktop.
- HostsCount: Required in case of personalSingleUserDesktop WvdPoolUserExperience. Number of session hosts to add to the host pool during creation. 
Static host pools can be created with 0 or more session hosts. New session hosts can be added later or deleted at any time.
- TimeZoneId: Enter your time zone or use UTC.
- WorkspaceId: This is a container for host pools and session hosts that provides desktops and RemoteApps to users. Go to Workspaces section and choose one. In case if there is no
workspaces - create a new one.
- UsersToAssign: Can be either an array of principals or GUIDs.
- GroupsToAssign: Can be an array of GUID only.
- *VmTemplate*:
- Prefix: Name prefix to be used when creating multiple session hosts. Pattern characters must be enclosed in {} and can be # (for sequential numbers) and/or ? (for random alphanumeric characters). One # implies numbers from 0 to 9, two #s implies numbers of 0 to 99, etc.
Example 1: AVDHOST{###} (AVDHOST000..AVDHOST999). 
Example 2: AVDHOST-{???} (AVDHOST-d83, AVDHOST-7sl, etc.).
- Size: VM size of newly created session hosts. The most popular session host VM families are Dsv3 and Esv3. 
Examples of sizes for this field: Standard_B1ls, Standard_D2_v3.
- Image: Desktop Image id to be used as the golden image for newly created session hosts. You can use existing one, or create new. Examples of 
images: MicrosoftWindowsDesktop/Windows-10/win10-22h2-avd/latest, MicrosoftWindowsDesktop/Office-365/19h2-evd-o365pp/latest.
- StorageType and DiskSize: OS Disk type and size of newly created session hosts. Must be equal to or larger than the size of the Desktop Image selected above.
Using Standard HDD(S-type) disks is not recommended. Premium SSD provides best performance. StorageType varieties: Standard_LRS, Premium_LRS, StandardSSD_LRS, UltraSSD_LRS.
- ResourceGroupId: Choose one from managed resource groups.
- NetworkId: Choose one from managed networks.
- HasEphemeralOSDisk: Ephemeral OS disks are created on the local virtual machine (VM) storage and not saved to the remote Azure Storage. 
An Ephemeral OS disk is stored on local storage and is therefore faster and free, but it is not persistent. 
It is therefore only used in situations where the VM is based on an image and every time it is started the OS disk will get “regenerated” from 
the generalized image and any changes made to the OS disk (C:) will be lost if the VM moves to another host or is reallocated. 
- AdConfiguration: 
- Type: 0 option will always use the global default AD configuration of the application. Using one of "Predefined" global configurations will 
allow always using the selected one even if the default changes (Select 1).
NOTE : The "Type" value here is not the same as the "Type" value in the Directories API response.
- DirectoryProfileId: If Type = 1 then define it (you can get DirectoryProfileId from Directories request), else leave it null.
- Custom: Not supported now, leave it null.
- *FsLogixConfiguration*: Choose FSLogix configuration profile to be used when creating or re-imaging hosts within this host pool.
- Type: Can be Default = 0, Predefined = 1, Custom = 2, Disabled = 3.
- PredefinedConfigId: Must be specified in case if Type = Predefined. You can get config id from separate request FSLogix configs.
- AppSettings: List of string. FSLogix App Services settings that are not specific to profile or ODFC containers or Cloud Cache.
- CloudCacheSettings: List of string. Global Cloud Cache settings.
- ProfilesPaths: List of strings. Must be specified in case if Type = Custom. Specify the FSLogix storage location by selecting Azure Files share or type in a UNC path.
- RegistryOptions: Must be specified in case if Type = Custom. Specify FSLogix configuration that will be applied when a session host VM is provisioned and FSLogix is installed.
These settings can be set globally or per host pool.
- ODFCPaths: List of strings. Can be specified in case if Type = Custom. Specify the FSLogix storage location by selecting Azure Files share or type in a UNC path.
- ODFCRegistryOptions: Can be specified in case if Type = Custom. Specify FSLogix configuration that will be applied when a session host VM is provisioned and FSLogix is installed.
- UseCloudCache: Must be specified in case if Type = Custom. Enable FSLogix Cloud Cache.
See <a href="https://docs.microsoft.com/en-us/fslogix/cloud-cache-resiliency-availability-cncpt" target="_blank" rel="noopener noreferrer">this article</a> for more info.
- SetupRegistryForAADJoinedStorage: Must be specified in case if Type = Custom. Enable Azure AD Kerberos functionality and AAD account credentials loading.
- Version: The version of FSLogix. Specify null for the latest version.
- ForceUpdate: Force the installation of FSLogix apps even if already installed
- ExcludeNerdioAdmin: This option allows to prevent Nerdio admin's profile creation in FSLogix storage location.
- ExcludeDomainAdmin: This option allows to prevent domain admin's profile creation in FSLogix storage location.
- DomainAdminUsername: domain admin username for excluding. Specify null for using username from AD configuration.
- UseTrustedLaunch: Azure offers trusted launch as a seamless way to improve the security of generation 2 VMs. Trusted launch protects against advanced and persistent attack techniques. 
Trusted launch is composed of several, coordinated infrastructure technologies that can be enabled independently. Each technology provides another layer of defense against sophisticated threats.
.PARAMETER AccountId
No additional description is provided by the API specification.
.PARAMETER InputObject
The JSON request body. Objects and hashtables are serialized automatically.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
New-NMMAccountsByAccountIdHostPool -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/host-pool
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [Alias('Id')]
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

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/accounts/{accountId}/host-pool', 'POST')) {
            Invoke-NMMApiRequest -Method 'POST' -Path '/rest-api/v1/accounts/{accountId}/host-pool' -PathValues $pathValues -QueryValues $queryValues -Body $InputObject -BodyWasBound:$PSBoundParameters.ContainsKey('InputObject') -Connection $Connection
        }
    }
}
