# New-NMMAccountprovisioningConfigureFileStorage

## Synopsis

Step 4: Start Configure file storage step (add job)

## Syntax

~~~powershell
New-NMMAccountprovisioningConfigureFileStorage [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes
- UncPath: existing share UNC path. Specify if you do not want to use Azure file and instead want to leverage another SMB file share storage technology (e.g. file server VM). Provide the path in UNC format that is accessible from the network specified in step 2. The share and file level permissions must be correctly configured to be used with virtual desktops. Specify null for using existing Azure file share or creating a new one.
- FileShareId: existing Azure file share ID. Specify an existing Azure file share that is integrated with Active Directory or Azure AD DS. FileShareId example: */subscriptions/subscription-id/resourceGroups/resource-group-name/providers/Microsoft.Storage/storageAccounts/storage-account-name/fileServices/default/shares/share-name*. Specify null for using UNC path or creating new Azure file share.
- NewFileShare: create a new Azure file share. Specify null for using UNC path or existing Azure file share.
    - StorageAccountName: name of existing storage account or new one.
    - ResourceGroupName: name of resource group for new storage account. Specify null for using existing storage account.
    - RegionName: location of new storage account. Specify null for using existing storage account.
    - Performance: type of storage account - Standard or Premium. Specify null for using existing storage account.
    - FileShareName: file share to be created in the storage account.
    - Quota: provisioned capacity (GiB). Provisioned capacity determines the cost and performance of Premium storage Azure file shares.
    - ProvisionedIops: provisioned IOPS of the share. This property is only for file shares created under Files Provisioned v2 account type.
    - ProvisionedBandwidthMibps: provisioned bandwidth of the share, in mebibytes per second. This property is only for file shares created under Files Provisioned v2 account type.
    - AssignNtfsPermissions: Nerdio Manager can assign NTFS file-level permissions to newly created file share. Default file permissions used on new Azure file shares can be found [here](https://docs.microsoft.com/en-us/azure/storage/files/storage-files-identity-ad-ds-configure-permissions#supported-permissions). This process will automatically create a temporary VM to perform the permission assignment task.
    - SmbMultichannelEnabled: Azure Files SMB Multichannel enables clients to use multiple network connections that provide increased performance. Increased performance is achieved through bandwidth aggregation over multiple NICs and utilizing Receive Side Scaling(RSS) support for NICs to distribute the IO load across multiple CPUs. Available for Premium file shares.

## API operation

POST /rest-api/v1/accountprovisioning/configureFileStorage
