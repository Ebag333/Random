# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
#
# Description: Manipulate registry keys for system background and copy files to appropriate path
# Author: jamescradit
# Date: 7/30/2013
# Version: 1.0
# Changelog: 1.0 - Initial Version
#
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\


$Key = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\Background"


IF (-not (Test-Path $Key)) {

New-Item $Key -ItemType Registry -Force

}

New-ItemProperty $Key -Name "OEMBackground" -Value 1 -PropertyType DWORD -Force



$Path = "C:\Windows\System32\OOBE\Info\Backgrounds\"

IF (-not (Test-Path $Path)) {

New-Item $Path -ItemType Directory -Force

}

Copy-Item backgrounddefault.jpg -Destination $Path -Force