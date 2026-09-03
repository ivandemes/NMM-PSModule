function New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHosts {
    <#
.SYNOPSIS
Create host
.DESCRIPTION
## Notes
Add one or more session hosts to the host pool.
- Count: Number of session hosts to add to the host pool. You can add one or multiple hosts.
- HostConfiguration:
- Prefix or host name: Specify naming for new hosts to be added.
"Exact" applies when adding a single host and specifying an exact name.
Example: MYAVDHOST
"Pattern" can be used to specify an advanced naming convention for new hosts.Pattern characters must be enclosed in {} and can be # (for sequential numbers) and/or ? (for random alphanumeric characters). One # implies numbers from 0 to 9, two #s implies numbers of 0 to 99, etc.
Example 1: AVDHOST{###} (AVDHOST000..AVDHOST999). 
Example 2: AVDHOST-{???} (AVDHOST-d83, AVDHOST-7sl, etc.).
- Size: VM size of newly created session hosts. The most popular session host VM families are Dsv3 and Esv3. 
Examples of sizes for this field: Standard_B1ls, Standard_D2_v3.
- Image: Desktop Image id to be used as the golden image for newly created session hosts. You can use existing one, or create new. Examples of images: MicrosoftWindowsDesktop/Windows-10/win10-22h2-avd/latest,
MicrosoftWindowsDesktop/Office-365/19h2-evd-o365pp/latest.
- StorageType and DiskSize: OS Disk type and size of newly created session hosts. Must be equal to or larger than the size of the Desktop Image selected above.
Using Standard HDD(S-type) disks is not recommended. Premium SSD provides best performance. StorageType varieties: Standard_LRS, Premium_LRS, StandardSSD_LRS, UltraSSD_LRS.
- ObjectsToAssign: Users Guids to pre-assign to newly created desktops. The number of users specified cannot exceed the number of hosts being added. 
Assignment is able only if current Host pool is Personal. Could be null.
- BulkParameters: Must be specified in case of count > 1. Can be null.
    - TaskParallelism: Specify the number of concurrent operations when performing this bulk action. 
    Large number of concurrent operations will allow the process to complete quicker but if there is an issue with Azure many hosts may end 
    up in an error state.
    - CountFailedTaskToStopWork: Stop the process after this many failures. This setting can help prevent a problem on Azure from making 
    all session hosts unavailable to users.
- Deactivate: Set new host in Drain mode.
- ScheduleConfiguration: With the schedule set to null action will be performed immediately. With schedule turned ON and specified, the task will be 
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
.PARAMETER AccountId
No additional description is provided by the API specification.
.PARAMETER InputObject
The JSON request body. Objects and hashtables are serialized automatically.
.PARAMETER Connection
A connection returned by Connect-NMMApi. When omitted, the module's current connection is used.
.EXAMPLE
New-NMMAccountsByAccountIdHostPoolBySubscriptionIdByResourceGroupByPoolNameHosts -Connection $connection
.OUTPUTS
System.Management.Automation.PSObject
.LINK
/rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/hosts
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [string] $SubscriptionId,

        [Parameter(Mandatory = $true)]
        [string] $ResourceGroup,

        [Parameter(Mandatory = $true)]
        [string] $PoolName,

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
        $pathValues['subscriptionId'] = $SubscriptionId
        $pathValues['resourceGroup'] = $ResourceGroup
        $pathValues['poolName'] = $PoolName
        $pathValues['accountId'] = $AccountId
        $queryValues = @{}

        if ($PSCmdlet.ShouldProcess('/rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/hosts', 'POST')) {
            Invoke-NMMApiRequest -Method 'POST' -Path '/rest-api/v1/accounts/{accountId}/host-pool/{subscriptionId}/{resourceGroup}/{poolName}/hosts' -PathValues $pathValues -QueryValues $queryValues -Body $InputObject -BodyWasBound:$PSBoundParameters.ContainsKey('InputObject') -Connection $Connection
        }
    }
}
