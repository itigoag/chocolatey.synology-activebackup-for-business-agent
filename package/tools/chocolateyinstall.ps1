$ErrorActionPreference = 'Stop';
$PackageParameters = Get-PackageParameters

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Import-Module -Name "$($toolsDir)\helpers.ps1"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'msi'
    url           = "https://global.download.synology.com/download/Tools/ActiveBackupBusinessAgent/2.0.4-0621/Windows/i686/Synology%20Active%20Backup%20for%20Business%20Agent-2.0.4-0621-x86.msi"
    url64         = "https://global.download.synology.com/download/Tools/ActiveBackupBusinessAgent/2.0.4-0621/Windows/x86_64/Synology%20Active%20Backup%20for%20Business%20Agent-2.0.4-0621-x64.msi"
    checksum      = "9047f1d924e4ce6d871846a6c281bdc9fec6e48a44be5feddc32abbbdd4313483ed6d3dbd9d7b2af2279e08952ffa0660ad5f1f24410f571909aa2af4cb60bf2"
    checksumType   = 'SHA512'
    checksum64    = "1aa9488020a1da85993f12f5ea05f66d21858457d104680a9cb1bee1e8318de28f2893c9aad790051df281fa42e2dc67a6203635f3b7b6392791d55240db8f17"
    checksumType64 = 'SHA512'
    silentArgs     = '/qn'
    ValidExitCodes = @(0, 1000, 1101)
}

Install-ChocolateyPackage @packageArgs

if ($PackageParameters.RemoveDesktopIcons) {
    Remove-DesktopIcons -Name "Synology Active Backup for Business Agent" -Desktop "Public"
}

if ($PackageParameters.CleanStartmenu) {
    Remove-FileItem `
        -Path "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Synology\Synology Active Backup for Business Agent.lnk"
}	
