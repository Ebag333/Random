Set oShell = createObject("wscript.shell")
Set oStdOut = Wscript.StdOut
set oFS = createObject("scripting.FileSystemObject")
Set cArguments = WScript.Arguments.Named



oStdOut.WriteLine "Initializing..."


sTargetLocation = cArguments.Item("TargetLocation")
sShortcutLocation = cArguments.Item("ShortcutLocation")
sArguments = cArguments.Item("Arguments")
sName = cArguments.Item("Name")
sIconLocation = cArguments.Item("IconLocation")
sWorkingDirectory = cArguments.Item("WorkingDirectory")

If isNull(sTargetLocation) OR isEmpty(sTargetLocation) Then
	oStdOut.WriteLine "TargetLocation is a required parameter, exiting..."
	Wscript.quit(1)
End If

If isNull(sShortcutLocation) OR isEmpty(sShortcutLocation) Then
	oStdOut.WriteLine "ShortcutLocation is a required parameter, exiting..."
	Wscript.quit(1)
End If


If NOT oFS.FileExists(sTargetLocation) Then
	oStdOut.WriteLine "Invalid Target Location, does not exist. Exiting..."
	Wscript.quit(1)
End If


If NOT oFS.FolderExists(sShortcutLocation) Then
	oStdOut.WriteLine "Invalid Shortcut Location, does not exist. Exiting..."
	Wscript.quit(1)
End If

If NOT isNull(sName) AND NOT isEmpty(sName) Then
	If instr(UCASE(sName),".LNK") Then
		sName = mid(sName,1,len(sName-4))
		oStdOut.WriteLine "Modified Name:" & sName
	End If
	
	If Mid(sShortcutLocation,len(sShortcutLocation),1) = "\" Then
		sShortcutLocation = Mid(sShortcutLocation,1,len(sShortcutLocation)-1)
		oStdOut.WriteLine "Modified ShortcutLocation:" & sShortcutLocation
	End If
	sShortcutLocation = sShortcutLocation & "\" & sName & ".lnk"
	oStdOut.WriteLine "Modified ShortcutLocation:" & sShortcutLocation
	
	Else
		If Mid(sShortcutLocation,len(sShortcutLocation),1) = "\" Then
			sShortcutLocation = Mid(sShortcutLocation,1,len(sShortcutLocation)-1)
			oStdOut.WriteLine "Modified ShortcutLocation:" & sShortcutLocation
		End If
		
		If InstrRev(sTargetLocation,".") > InstrRev(sTargetLocation,"\") Then
			sShortcutLocation = sShortcutLocation & "\" & Mid(sTargetLocation, InstrRev(sTargetLocation,"\")+1, InstrRev(sTargetLocation,".") - InstrRev(sTargetLocation,"\")-1 ) & ".lnk"
			oStdOut.WriteLine "Modified ShortcutLocation:" & sShortcutLocation
			Else
				sShortcutLocation = sShortcutLocation & "\" & Mid(sTargetLocation, InstrRev(sTargetLocation,"\") + 1) & ".lnk"
				oStdOut.WriteLine "Modified ShortcutLocation:" & sShortcutLocation
		End If
End If

On Error Resume Next
Set oShortcut = oShell.CreateShortcut(sShortcutLocation)
IF err.Number <> 0 THEN
	oStdOut.WriteLine "ERROR: Unable to create shortcut, Exiting..."
	wscript.quit(1)
End If
ON ERROR GOTO 0

oShortcut.TargetPath = sTargetLocation

If NOT isNull(sIconLocation) AND NOT isEmpty(sIconLocation) AND oFS.FileExists(sIconLocation) Then
	oStdOut.WriteLine "Using IconLocation:" & sIconLocation
	oShortcut.IconLocation = sIconLocation
End If

If NOT isNull(sWorkingDirectory) AND NOT isEmpty(sWorkingDirectory) AND oFS.FolderExists(sWorkingDirectory) Then
	oStdOut.WriteLine "Using WorkingDirectory:" & sWorkingDirectory
	oShortcut.WorkingDirectory = sWorkingDirectory
End If

If NOT isNull(sArguments) AND NOT isEmpty(sArguments)Then
	oStdOut.WriteLine "Using Arguments:" & sArguments
	oShortcut.Arguments = sArguments
End If

On Error Resume Next
oShortcut.Save
IF err.Number <> 0 THEN
	oStdOut.WriteLine "ERROR: Unable to save shortcut, Exiting..."
	wscript.quit(1)	
End If







