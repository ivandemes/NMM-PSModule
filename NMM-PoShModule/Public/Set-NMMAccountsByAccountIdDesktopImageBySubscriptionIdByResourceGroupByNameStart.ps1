function Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameStart {
    <#
.SYNOPSIS
Power on current desktop image
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
- PowerOnConfiguration: 
- CustomScriptEnable: Windows scripts will be executed via Azure Custom Script extension and will run in the context of LocalSystem account. These command WILL run on the image VM itself.
- ScriptedActionsIds: Run the following scripted actions before set as image. List of int.
- DirectoryProfileId: ID of predefined configuration. Can be null.
- SchedulePowerOffHours: allows to schedule a power off after a specified period in hours. Must be between 1 and 168. Can be null if no scheduling required.
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
Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameStart -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/desktop-image/{subscriptionId}/{resourceGroup}/{name}/start
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

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/accounts/{accountId}/desktop-image/{subscriptionId}/{resourceGroup}/{name}/start', 'PUT')) {
            Invoke-NMMApiRequest -Method 'PUT' -Path '/rest-api/v1/accounts/{accountId}/desktop-image/{subscriptionId}/{resourceGroup}/{name}/start' -PathValues $pathValues -QueryValues $queryValues -Body $InputObject -BodyWasBound:$PSBoundParameters.ContainsKey('InputObject') -Connection $Connection
        }
    }
}
