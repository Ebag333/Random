#Create Umpqua Directory

$tsEnv = New-Object -ComObject Microsoft.SMS.TSEnvironment

$DrivePath = $tsEnv.Value("OSDTargetSystemDrive")


$programDataDir = $DrivePath + "\ProgramData"

New-Item -ItemType Directory -Path $programDataDir\Umpqua\ClientEngineering\Applications\Logs -Force
New-Item -ItemType Directory -Path $programDataDir\Umpqua\ClientEngineering\Theme -Force
New-Item -ItemType Directory -Path $programDataDir\Umpqua\ClientEngineering\Scripts -Force
New-Item -ItemType Directory -Path $programDataDir\Umpqua\ClientEngineering\Temp -Force


$Path = $DrivePath + "\ProgramData\Umpqua\ClientEngineering\Theme"

Copy-Item umpquadesktop.jpg -Destination $Path -Force
Copy-Item umpquaicon.png -Destination $Path -Force