function Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameRdpSettings {
    <#
.SYNOPSIS
Get host pool RDP settings
.DESCRIPTION
## Notes
### Global RDP properties
- globalRdpPropertiesId: Global RDP properties ID with which host pool is synced
### RDP properties
- alternate shell: Determines whether a program starts automatically when you connect with RDP. To specify an alternate shell, enter a valid 
path to an executable file for the value, such as "C:\ProgramFiles\Office\word.exe". This setting also determines which path or alias of the 
Remote Application to be started at connection time if RemoteApplicationMode is enabled.
- audiocapturemode: Indicates whether audio input/output redirection is enabled.
- audiomode: Determines whether the local or remote machine plays audio.
- autoreconnection enabled: Determines whether the client computer will automatically try to reconnect to the remote computer if the connection 
is dropped, such as when there's a network connectivity interruption.
- bandwidthautodetect: Determines whether automatic network type detection is enabled.
- camerastoredirect: Configures which cameras to redirect. This setting uses a semicolon-delimited list of KSCATEGORY_VIDEO_CAMERA interfaces 
of cameras enabled for redirection.
- compression: Determines whether bulk compression is enabled when it is transmitted by RDP to the local computer.
- desktop size id: Specifies dimensions of the remote session desktop from a set of pre-defined options. This setting is overridden if either 
desktopheight or desktopwidth are specified.
- desktopheight: Determines the resolution height (in pixels) on the remote computer when you connect by using Remote Desktop Connection. 
This setting corresponds to the selection in the Display configuration slider on the Display tab under Options in RDC.
- desktopwidth: Determines the resolution width (in pixels) on the remote computer when you connect by using Remote Desktop Connection. 
This setting corresponds to the selection in the Display configuration slider on the Display tab under Options in RDC.
- disableconnectionsharing: Determines whether the remote desktop client reconnects to any existing open connections or initiate a new connection 
when a RemoteApp or desktop is launched.
- drivestoredirect: Determines which local disk drives on the client computer will be redirected and available in the remote session.
- enablecredsspsupport: Determines whether RDP will use the Credential Security Support Provider (CredSSP) for authentication if it is available.
- encode redirected video capture: Enables or disables encoding of redirected video.
- keyboardhook: Determines when Windows key combinations (WIN key, ALT+TAB) are applied to the remote session for desktop connections.
- networkautodetect: Determines whether or not to use automatic network bandwidth detection. Requires the option bandwidthautodetect to be set 
and correlates with connection type 7.
- redirectclipboard: Determines whether clipboard redirection is enabled.
- redirected video capture encoding quality: Controls the quality of encoded video.
- redirectprinters: Determines whether printers configured on the client computer will be redirected and available in the remote session when 
you connect to a remote computer by using Remote Desktop Connection.
- redirectsmartcards: Determines whether smart card devices on the client computer will be redirected and available in the remote session when 
you connect to a remote computer.
- screen mode id: Determines whether the remote session window appears full screen when you connect to the remote computer by using Remote Desktop Connection.
- singlemoninwindowedmode: Determines whether a multi display remote session automatically switches to single display when exiting full screen. 
Requires use multimon to be set to 1. Only available on the Windows Desktop (MSRDC) client.
- smart sizing: Determines whether or not the client computer can scale the content on the remote computer to fit the window size of the client computer.
- targetisaadjoined: Description.
- usbdevicestoredirect: USB redirection.
- use multimon: Configures multiple monitor support when you connect to the remote computer by using Remote Desktop Connection.
- videoplaybackmode: Determines if Remote Desktop Connection will use RDP-efficient multimedia streaming for video playback.
- workspaceid: Defines the RemoteApp and Desktop ID associated with the RDP file that contains this setting.
.PARAMETER SubscriptionId
No additional description is provided by the API specification.
.PARAMETER ResourceGroup
No additional description is provided by the API specification.
.PARAMETER PoolName
No additional description is provided by the API specification.
.PARAMETER AccountId
No additional description is provided by the API specification.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
Get-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameRdpSettings -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/rdp-settings
#>
    [CmdletBinding(SupportsShouldProcess = $false)]
    param(
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [string] $SubscriptionId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [string] $ResourceGroup,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [string] $PoolName,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [string] $AccountId,

        [Parameter()]
        [psobject] $Connection
    )

    process {
        $pathValues = @{}
        $pathValues['subscriptionId'] = $SubscriptionId
        $pathValues['resourceGroup'] = $ResourceGroup
        $pathValues['poolName'] = $PoolName
        $pathValues['accountId'] = $AccountId
        $queryValues = @{}

        Invoke-NMMApiRequest -Method 'GET' -Path '/rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/rdp-settings' -PathValues $pathValues -QueryValues $queryValues -Connection $Connection
    }
}
