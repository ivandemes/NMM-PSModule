function Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameScheduleRunScript {
    <#
.SYNOPSIS
Run scripted actions on desktop image
.DESCRIPTION
## Notes
- ScriptedActionsIds: Run the following scripted actions before set as image. List of int.
- DirectoryProfileId: ID of predefined configuration. Can be null.
- RestartVM: if true, VM will be restarted after script execution. Prefer setting this parameter to using any restarting Powershell commands as Custom Script extension will fail if script restarts the computer.
- Schedule: With the schedule set to null action will be performed immediately. With schedule turned ON and specified, the task will be 
performed according to the specified schedule. Can be null.
    - Id: Schedule id to edit. Can be null.
    - ProfileId: Global or Account schedule profile id. Can be null.
    - DisplayName: Friendly name of the schedule.
    - StartDate: Start date when operation can begin.
    - StartHour and StartMinute: Start time when operation can begin.
    - TimeZoneId: Enter your time zone or use UTC.
    - ScheduleRecurrenceType: Specify whether to run this operation once or repeat it on recurring schedule.
    - WeeklySettings: Specify in case of ScheduleRecurrenceType = Weekly.
        - Days: Days of week when the task will repeat.
        - Period: Period in weeks when the task will repeat. If Period is equal 1, the task will repeat every week.
    - MonthlySettings: Specify in case of ScheduleRecurrenceType = Monthly.
        - MultiDaysMode: 
            - Days: Specific days of month when the task will repeat.
        - SingleDayMode: 
            - DayOfWeekNumber: The task will repeat every month on this day. 
            E.g. you want to repeat this operation monthly every Second Friday, then you choose DayOfWeekNumber = Second, DayOfWeek = Friday.
            - DayOfWeek: The task will run on this day of week.
        - Period: Period in months when the task will repeat. If Period is equal 1, the task will repeat every month.
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
Set-NMMAccountsByAccountIdDesktopImageBySubscriptionIdByResourceGroupByNameScheduleRunScript -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/desktop-image/{subscriptionId}/{resourceGroup}/{name}/schedule/run-script
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

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/accounts/{accountId}/desktop-image/{subscriptionId}/{resourceGroup}/{name}/schedule/run-script', 'PUT')) {
            Invoke-NMMApiRequest -Method 'PUT' -Path '/rest-api/v1/accounts/{accountId}/desktop-image/{subscriptionId}/{resourceGroup}/{name}/schedule/run-script' -PathValues $pathValues -QueryValues $queryValues -Body $InputObject -BodyWasBound:$PSBoundParameters.ContainsKey('InputObject') -Connection $Connection
        }
    }
}
