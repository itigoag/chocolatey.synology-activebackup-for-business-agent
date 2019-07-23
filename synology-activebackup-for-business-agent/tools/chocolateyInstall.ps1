$ErrorActionPreference = 'Stop';
$PackageParameters = Get-PackageParameters

$toolsDir   = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Import-Module -Name "$($toolsDir)\helpers.ps1"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'msi'
	url            = 'https://global.download.synology.com/download/Tools/ActiveBackupBusinessAgent/2.0.4-0621/Windows/i686/Synology%20Active%20Backup%20for%20Business%20Agent-2.0.4-0621-x86.msi'
    url64          = 'https://global.download.synology.com/download/Tools/ActiveBackupBusinessAgent/2.0.4-0621/Windows/x86_64/Synology%20Active%20Backup%20for%20Business%20Agent-2.0.4-0621-x64.msi'
    checksum       = 'EE9E5E16C3ECF2282FBA387374F1D6FE56989BF0E3358ED78A8B142E4E18543E'
    checksumType   = 'SHA256'
    checksum64     = 'DCA40C40A815C11B311F61D413E1CED175121B080882BC23993A22D6923142A7'
    checksumType64 = 'SHA256'
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
