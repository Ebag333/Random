' /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
'
' Description: Launches DEPT.HTA
' Author: jamescradit
' Date: 8/13/2013
' Version: 1.0
' Changelog: 1.0 - Initial Version
'
' /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\

'ON ERROR RESUME NEXT


wscript.echo "Initializing OSD environment. This may take a while...."

Set oShell = createobject("wscript.shell")
Set oNet = createObject("wscript.network")
Set oFSO = createObject("scripting.FileSystemObject")


IF Err.Number <> 0 THEN
	wscript.echo "Error initializing objects. Restart and try again"
END IF




IF NOT oFSO.FileExists("z:\dept.hta") THEN
	wscript.echo "Attempting connection to network resource...."
	
	oResult = oNet.MapNetworkDrive("Z:","\\pdx-sccm-app01.umpquanet.local\OSDHTA$",,"PDX-SCCM-APP01\SCCMOSDHTA","zQHU*b4xuKHz")
	IF oResult <> 0 THEN
		wscript.echo "Failed to connect to map network drive. This is a catastrophic failure. Verify network connectivity and restart computer."
		wscript.sleep 999999
	ELSE
		wscript.echo "Connection to network resource established."
	END IF
ELSE
	wscript.echo "The network connection already exists. The script will continue."
END IF

wscript.echo "Launching Program...."
oResult = oShell.Run("z:\dept.hta",0,true)

IF oResult <> 0 THEN
	wscript.echo "Their was an error with the application. This is a catastrophic failure. Restart computer and try again."
	wscript.sleep 999999
END IF

IF Err.Number <> 0 THEN
	wscript.echo "Their was problems staging the OSD environment. Restart computer and try again."
ELSE
	wscript.echo "Successfully staged the OSD environment. Continuing...."
END IF
