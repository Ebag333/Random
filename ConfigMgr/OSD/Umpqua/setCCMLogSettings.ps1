# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
#
# Description: Set CCM Log parameters
# Author: jamescradit
# Date: 1/24/2014
# Version: 1.0
# Changelog: 1.0 - Initial Version
#
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\




$regPath = "HKLM:\Software\Microsoft\CCM\Logging\@Global"

New-ItemProperty $regPath -Name 'LogMaxSize' -Value 10000000 -PropertyType DWORD -Force
New-ItemProperty $regPath -Name 'LogMaxHistory' -Value 2 -PropertyType DWORD -Force