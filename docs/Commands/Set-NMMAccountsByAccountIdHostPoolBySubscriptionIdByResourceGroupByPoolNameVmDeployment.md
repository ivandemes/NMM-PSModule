# Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameVmDeployment

## Synopsis

Set host pool VM deployment settings

## Syntax

~~~powershell
Set-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameVmDeployment -SubscriptionId <string> -ResourceGroup <string> -PoolName <string> -AccountId <string> [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes
Configure customizations to be applied to session host VMs as they are deployed in this host pool.
- EnableTimezoneRedirection: Enabling time zone redirection allows users to see their local device's time zone inside of their AVD session.
- VmTimezone: Sets system time zone on the session host VM as it's provisioned.
- IsAcceleratedNetworkingEnabled: Azure Accelerated Networking is an option on the NIC level providing several benefits by enabling single root I/O 
virtualization (SR-IOV) to a VM, greatly improving its networking performance. This high-performance path bypasses the host from the datapath, reducing latency, 
jitter, and CPU utilization, for use with the most demanding network workloads on supported VM types. You would typically use this feature with heavy workloads 
that need to send or receive data at high speed with reliable streaming and lower CPU utilization. It will enable speeds of up to 25Gbps per Virtual Machine. 
Best of all, it is free! Not all VM sizes support Accelerated Networking.If a VM size doesn't support it, Accelerated Networking will not be enabled.
- InstallGPUDrivers: GPU driver can be installed on VM sizes of N-series. Either NVidia or AMD driver will be installed.
- ScriptedActions: Windows scripts will be executed via Azure Custom Script extension and will run in the context of LocalSystem account. 
Azure runbooks will be executed via Azure automation account and run in the context of app service principal.Windows scripts will be executed via Azure 
Custom Script extension and will run in the context of LocalSystem account. 
Azure runbooks will be executed via Azure automation account and run in the context of app service principal.
- OnCreateScriptedActions: Run Scripted actions when host VM is CREATED.
- OnStartScriptedActions: Run Scripted actions when host VM is STARTED.
- OnStopScriptedActions: Run Scripted actions when host VM is STOPPED.
- OnRemoveScriptedActions: Run Scripted actions when host VM is REMOVED.
- Enabled: Current set of scripted actions is enabled for executing.
- ScriptedActionsIds: The list of int numbers of scripts.
- DirectoryProfileId: Pass directory id for credentials. Reference as $ADUsername and $ADPassword in the script. Can be null.
- EnableVmDeallocation: When enabled, a periodic task will check if any session host VMs are in powered off (but not deallocated) state and deallocate them 
automatically to save on Azure compute costs.
- Assignments: Users or groups. Can be specified only if IsShadowUsersEnabled = true.
- IsShadowUsersEnabled: Allow non-admin users to shadow sessiond. By default, only local administrator can shadow user sessions. Turning on this feature, 
will allow selected non-admin users/groups to shadow sessions on this host pool. NOTE: Session shadowing is only available with multi-session version of Windows OS. 
This feature will not work with Windows 10 Enterprise (single session). Can be changed if host pool AD type != Azure AD or this option was true.
- UseAvailabilityZones: When enabled, newly created or re-imaged session host VMs will be automatically distributed across Availability Zones in the 
selected Azure region.
- InstallCertificates: Install all stored certificates if MSIX App Attach packages are added to this host pool.
- SecurityProfile: Azure offers trusted launch as a seamless way to improve the security of generation 2 VMs. Trusted launch protects against advanced and persistent attack techniques.
Trusted launch is composed of several, coordinated infrastructure technologies that can be enabled independently. Each technology provides another layer of defense against sophisticated threats.
Be sure that the desktop image used for this host pool supports Trusted Launch.It must be an Azure Marketplace image or an Azure Compute Gallery image with Trusted Launch enabled.
-- UseTrustedLaunch: true for using trusted launch
-- SecureBootEnabled: Secure boot helps protect your VMs against boot kits, rootkits, and kernel-level malware.
-- VTpmEnabled: Virtual Trusted Platform Module (vTPM) is TPM2.0 compliant and validates your VM boot integrity apart from securely storing keys and secrets.
- **NOTE**: These changes will apply only to newly created (or re-imaged) hosts in this pool.

## API operation

PUT /rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/vm-deployment
