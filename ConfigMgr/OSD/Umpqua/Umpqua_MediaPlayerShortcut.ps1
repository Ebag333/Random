# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
#
# Description: This adds a Media Player shortcut to the start menu due to removing all links from unattend.xml
# Author: jamescradit
# Date: 8/13/2013
# Version: 1.0
# Changelog: 1.0 - Initial Version
#
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\


$oShell = New-Object -comObject wscript.shell


$targetLink = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Windows Media Player.lnk"

$ShortCut = $oShell.CreateShortCut($targetLink)
$ShortCut.TargetPath = "C:\Program Files (x86)\Windows Media Player\wmplayer.exe"
$shortcut.Save()

