# Chocolatey Package: synology-activebackup-for-business-agent

[![Build Status](https://img.shields.io/travis/itigoag/chocolatey.synology-activebackup-for-business-agent?style=flat-square)](https://travis-ci.org/itigoag/chocolatey.synology-activebackup-for-business-agent) [![license](https://img.shields.io/github/license/mashape/apistatus.svg?style=popout-square)](licence) [![Chocolatey](https://img.shields.io/chocolatey/v/synology-activebackup-for-business-agent?label=package%20version)](https://chocolatey.org/packages/synology-activebackup-for-business-agent) [![Chocolatey](https://img.shields.io/chocolatey/dt/synology-activebackup-for-business-agent?label=package%20downloads&style=flat-square)](https://chocolatey.org/packages/synology-activebackup-for-business-agent)

## Description

Active Backup for Business is the all-in-one backup solution, designed for streamlining and enhancing data protection in businesses' diverse IT environments. Before protecting and backing up data stored on personal computers as well as physical Windows Servers, this Active Backup Agent is required to be installed on the target device to carry out the designed backup tasks and store the backed up data. As the management is centralized on the server end, most of the actions require either DSM or device's administrative privilege.

## Package Parameters

- `/RemoveDesktopIcons` Removes the desktop icon from Synology ActiveBackup for Business Agent.
- `/CleanStartmenu` Removes frequently used Synology ActiveBackup for Business Agent shortcuts from the Startmenu.

## Installation

installation without parameters.

```ps1
 choco install synology-activebackup-for-business-agent
```

installation with parameters.

```ps1
 choco install synology-activebackup-for-business-agent --params="'/RemoveDesktopIcons /CleanStartmenu'"
```

## Disclaimer

These Chocolatey Packages only contain installation routines. The software itself is downloaded from the official sources of the software developer. ITIGO AG has no affilation with the software developer.

## Author

- [Simon Bärlocher](https://sbaerlocher.ch)
- [ITIGO AG](https://www.itigo.ch)

## License

This project is under the MIT License. See the [LICENSE](licence) file for the full license text.

## Copyright

(c) 2019, ITIGO AG
