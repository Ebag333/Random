

Set env = CreateObject("Microsoft.SMS.TSEnvironment")
Set oFSO = CreateObject("Scripting.FileSystemObject")


strRootPath = env("OSDisk")

strPath = strRootPath & "\ProgramData\"

oFSO.CreateFolder strPath & "Umpqua"
oFSO.CreateFolder strPath & "Umpqua\ClientEngineering"
oFSO.CreateFolder strPath & "Umpqua\ClientEngineering\Applications"
oFSO.CreateFolder strPath & "Umpqua\ClientEngineering\Applications\Logs"
oFSO.CreateFolder strPath & "Umpqua\ClientEngineering\Theme"
oFSO.CreateFolder strPath & "Umpqua\ClientEngineering\Scripts"
oFSO.CreateFolder strPath & "Umpqua\ClientEngineering\Temp"

