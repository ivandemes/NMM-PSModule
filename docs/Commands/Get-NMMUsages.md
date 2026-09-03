# Get-NMMUsages

## Synopsis

Get usages

## Syntax

~~~powershell
Get-NMMUsages [-StartDate <string>] [-EndDate <string>] [-WithDetails <boolean>] [-Connection <psobject>]
~~~

## Description

- Start date: the beginning of the period for which usages is taken    
Default value: End date - 30 days    
- End date: the end of the period for which usages is taken    
Default value: current date    
- Period should be 31 days or less

## API operation

GET /rest-api/v1/usages
