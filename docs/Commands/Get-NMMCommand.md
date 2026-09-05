# Get-NMMCommand

## Synopsis

Lists commands exported by NMM-PSModule.

## Syntax

~~~powershell
Get-NMMCommand [[-Name] <string>] [-Verb <string>] [-ApiPath <string>] [-Category <string>] [-AsObject]
~~~

## Description

Displays exported commands in grouped, color-coded categories. Portable ASCII borders ensure that Windows `more.com` does not corrupt the display. Display lines are written to the success pipeline, so large command lists can be paged with `Get-NMMCommand | more`. Use `-AsObject` to return command metadata for filtering and pipelines. Generated API commands include their HTTP method and REST path.

## Examples

~~~powershell
Get-NMMCommand
Get-NMMCommand -Name '*HostPool*' -Verb Get
Get-NMMCommand -ApiPath '*/backup/*'
Get-NMMCommand -Category HostPool
Get-NMMCommand -Category Automation -AsObject
Get-NMMCommand | more
~~~
