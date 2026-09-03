function Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameSetAsImage {
    <#
.SYNOPSIS
Power off and set as image
.DESCRIPTION
## Notes
- Schedule: With the schedule set to null action will be performed immediately. With schedule turned ON and specified, the task will be 
performed according to the specified schedule. Can be null.
- StartDate: Start date when operation can begin.
- StartHour and StartMinute: Start time when operation can begin.
- TimeZoneId: Enter your time zone or use UTC.
- ScheduleRecurrenceType: Specify whether to run this operation once or repeat it on recurring schedule.
- DayOfWeekNumber: Specify in case of ScheduleRecurrenceType = Monthly.
This field means that operation will repeat every month on this day. 
E.g. you want to repeat this operation monthly every Second Friday. Then you choose ScheduleRecurrenceType = Monthly, DayOfWeekNumber = second, DayOfWeek = Friday.
- DayOfWeek: Specify in case of ScheduleRecurrenceType is equal Weekly or Monthly. This task will repeat every week on this day.
- SetAsImageConfiguration: 
- CustomScriptEnable: Windows scripts will be executed via Azure Custom Script extension and will run in the context of LocalSystem account on 
the CLONE of the desktop image VM before it is Syspreped. These command WILL NOT run on the image VM itself.
- ScriptedActionsIds: Run the following scripted actions before set as image. List of int.
- DirectoryProfileId: ID of predefined configuration. Can be null.
- ChangeLog: List changes made to this image.
- RetainOldImage: Save current image as a backup. Selecting this option will retain the existing image as a standalone object and not overwrite it with the new one. 
- OldImageRetention: Number of image versions to retain. Must be between 1 and 999 for new schedules or tasks. Must be null if the image already has a schedule with retaining enabled (RetainOldImage == true) but retention missed (OldImageRetention == null).
This image will not be visible or manageable via Nerdio Manager so be sure to delete it manually when no longer needed to avoid unnecessary 
Azure storage costs. You will be able to find old image in Azure portal>Images and it will be listed under "Custom images" 
in Nerdio Manager's image selector drop-down.
- InstallCertificates: Install all stored certificates on image VM if any.
Note: Please ensure that Azure agent is 
<a href="https://docs.microsoft.com/en-us/azure/virtual-machines/extensions/agent-windows#manual-detection" target="_blank" rel="noopener noreferrer">installed</a> 
and AVD agent is not installed.
- GalleryImageParams: Store image in Azure compute gallery and automatically distribute to selected Azure regions.
-- GalleryId: Select an existing Azure compute gallery or create a new one. Only one gallery can be selected. Existing gallery must be in a linked resource group.
-- TargetRegions: Select Azure regions where the Image version should be replicated. The current Azure region must be part of the selection.
-- SetInactive: Use false for distribution
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
Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameSetAsImage -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/desktop-image/{subscriptionId}/{resourceGroup}/{name}/set-as-image
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [string] $Name,

        [Parameter(Mandatory = $true)]
        [string] $ResourceGroup,

        [Parameter(Mandatory = $true)]
        [string] $SubscriptionId,

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
        $pathValues['name'] = $Name
        $pathValues['resourceGroup'] = $ResourceGroup
        $pathValues['subscriptionId'] = $SubscriptionId
        $pathValues['accountId'] = $AccountId
        $queryValues = @{}

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/accounts/{accountId}/desktop-image/{subscriptionId}/{resourceGroup}/{name}/set-as-image', 'PUT')) {
            Invoke-NMMApiRequest -Method 'PUT' -Path '/rest-api/v1/accounts/{accountId}/desktop-image/{subscriptionId}/{resourceGroup}/{name}/set-as-image' -PathValues $pathValues -QueryValues $queryValues -Body $InputObject -BodyWasBound:$PSBoundParameters.ContainsKey('InputObject') -Connection $Connection
        }
    }
}
