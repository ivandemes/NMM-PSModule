# Get-NMMVulnerabilities

## Synopsis

Get the list of vulnerabilities

## Syntax

~~~powershell
Get-NMMVulnerabilities [-MinAffectedAccount <integer>] [-MinCvssV3 <integer>] [-MinAffectedEndpoints <integer>] [-Severity <string>] [-Connection <psobject>]
~~~

## Description

## Notes
- MinAffectedAccount: filters vulnerabilities that affected at least X accounts. Optional.
- MinCvssV3: filters vulnerabilities with at least X CVSS score. Optional.
- MinAffectedEndpoints: filters vulnerabilities that affected at least X devices. Optional.
- Severity: filters vulnerabilities with at specified severity. Optional.

## API operation

GET /rest-api/v1/vulnerabilities
