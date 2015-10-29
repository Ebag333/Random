# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
#
# Description: Set PinItems to run in active setup
# Author: jamescradit
# Date: 8/12/2013
# Version: 1.0
# Changelog: 1.0 - Initial Version
#
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\

Param (

[string]$dept


)

if(-not($dept)) { 
write-host "You must supply a department value" 
write-host "Example: umpqua_pinitems.ps1 tag"
exit

}


$file = $env:ProgramData + "\Umpqua\ClientEngineering\Applications\PinItems\pin.exe "
$Key = "HKLM:\Software\Wow6432Node\Microsoft\Active Setup\Installed Components\_Umpqua_PinItems"

IF (-not (Test-Path $Key)) {

New-Item $Key -ItemType Registry

}

$regvalue = $file + $dept

Set-Item -Path $Key -Value "Pin Items to Taskbar" -Type String
New-ItemProperty $Key -Name "StubPath" -Value $regvalue -PropertyType String
New-ItemProperty $Key -Name "Version" -Value 1,0,0,0 -PropertyType String -Force
