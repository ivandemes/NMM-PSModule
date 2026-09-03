# Get-NMMHealthStatus

## Synopsis

A basic health check

## Syntax

~~~powershell
Get-NMMHealthStatus [-Connection <psobject>]
~~~

## Description

## Notes
Completes a basic health check for 
 - App Service
 - Database
 - Web Jobs
 
 returns **'OK'** or **'Error'** and is limited to **1** request a minute

## API operation

GET /rest-api/v1/health-status
