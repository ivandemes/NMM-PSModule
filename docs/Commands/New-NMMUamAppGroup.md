# New-NMMUamAppGroup

## Synopsis

Create app group.

## Syntax

~~~powershell
New-NMMUamAppGroup [-InputObject <object>] [-Connection <psobject>]
~~~

## Description

## Notes
- Name: app group name. Must begin with a letter, can contain letters, numbers, underscore ('_') and hyphens ('-') only and can not be longer than 30 chars.
- Items: apps included in the groups.
- Items.RepoId: repo ID.
- Items.ExternalId: app ID.
- Items.Version: app version. Use 'latest' to install and maintain latest version.
- Items.Order: the order in which the application will be installed/uninstalled.

## API operation

POST /rest-api/v1/uam/appGroup
