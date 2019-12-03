$ErrorActionPreference = 'Stop';
$PackageParameters = Get-PackageParameters

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Import-Module -Name "$($toolsDir)\helpers.ps1"

$args = ""

if ($PackageParameters['Address']) {
    $args = $args + " ADDRESS=" + $PackageParameters['Address']
}

if ($PackageParameters['Username']) {
    $args = $args + " USERNAME=" + $PackageParameters['Username']
}

if ($PackageParameters['Password']) {
    $args = $args + " PASSWORD=" + $PackageParameters['Password']
}

if ($PackageParameters['ProxyAddress']) {
    $args = $args + " PROXY_ADDR=" + $PackageParameters['ProxyAddress']
}

if ($PackageParameters['ProxyPort']) {
    $args = $args + " PROXY_PORT=" + $PackageParameters['ProxyPort']
}

if ($PackageParameters['ProxyUsername']) {
    $args = $args + " PROXY_USERNAME=" + $PackageParameters['ProxyUsername']
}

if ($PackageParameters['ProxyPassword']) {
    $args = $args + " PROXY_PASSWORD=" + $PackageParameters['ProxyPassword']
}

if ($PackageParameters.RemoveShortcut) {
    $args = $args + " NO_SHORTCUT=1"
}

Write-Output $args

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'msi'
    url            = "https://global.download.synology.com/download/Tools/ActiveBackupBusinessAgent/2.1.0-0993/Windows/i686/Synology%20Active%20Backup%20for%20Business%20Agent-2.1.0-0993-x86.msi"
    url64          = "https://global.download.synology.com/download/Tools/ActiveBackupBusinessAgent/2.1.0-0993/Windows/x86_64/Synology%20Active%20Backup%20for%20Business%20Agent-2.1.0-0993-x64.msi"
    checksum       = "9047F1D924E4CE6D871846A6C281BDC9FEC6E48A44BE5FEDDC32ABBBDD4313483ED6D3DBD9D7B2AF2279E08952FFA0660AD5F1F24410F571909AA2AF4CB60BF2"
    checksumType   = 'SHA512'
    checksum64     = "1E40F626F890FC44DB999846C68BF2B7AFEBACACA3E1E935906DFB2798A7376CCC1E377889F712A48FF8BEC61D4558D4D731F15850976BA97D2740AD95EE96CD"
    checksumType64 = 'SHA512'
    silentArgs     = "$($args) /qn"
    ValidExitCodes = @(0, 1000, 1101)
}

Install-ChocolateyPackage @packageArgs
