function New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameRestart {
    <#
.SYNOPSIS
Restart chosen host
.DESCRIPTION
## Notes
- LogOffUsers: All users will be logged off.
- Redeploy: Redeploying a VM helps if you are having trouble connecting via RDP or accessing applications on the VM. Redeploying will power off the VM, move the VM to a new node within Azure, and power it back on.
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
.PARAMETER SubscriptionId
No additional description is provided by the API specification.
.PARAMETER ResourceGroup
No additional description is provided by the API specification.
.PARAMETER PoolName
No additional description is provided by the API specification.
.PARAMETER HostName
No additional description is provided by the API specification.
.PARAMETER AccountId
No additional description is provided by the API specification.
.PARAMETER InputObject
The JSON request body. Objects and hashtables are serialized automatically.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHostsByHostNameRestart -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/hosts/{hostName}/restart
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [string] $SubscriptionId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [string] $ResourceGroup,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [string] $PoolName,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [string] $HostName,

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
        $pathValues['subscriptionId'] = $SubscriptionId
        $pathValues['resourceGroup'] = $ResourceGroup
        $pathValues['poolName'] = $PoolName
        $pathValues['hostName'] = $HostName
        $pathValues['accountId'] = $AccountId
        $queryValues = @{}

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/hosts/{hostName}/restart', 'POST')) {
            Invoke-NMMApiRequest -Method 'POST' -Path '/rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/hosts/{hostName}/restart' -PathValues $pathValues -QueryValues $queryValues -Body $InputObject -BodyWasBound:$PSBoundParameters.ContainsKey('InputObject') -Connection $Connection
        }
    }
}
