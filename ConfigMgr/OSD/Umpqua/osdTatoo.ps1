# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
#
# Description: Tatoo Image with custom information
# Author: jamescradit
# Date: 1/24/2014
# Version: 1.0
# Changelog: 1.0 - Initial Version
#
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\


$ts = New-Object -ComObject Microsoft.SMS.TSEnvironment
$regPath = "HKLM:\Software\Umpqua\ClientEngineering\OSDImage"

$DeploymentType = $ts.Value("DeploymentType")
$MP = $ts.Value("SMSTSMP")
$TaskSequence = $ts.Value("_SMSTSPackageName")
$Dept = $ts.Value("sDepartment")
$OSDStartTime = $ts.Value("OSDStartTime")
$OSDEndTime = $ts.Value("OSDEndTime")


if (-Not (Test-Path $regPath)) {
New-Item -Path $regPath -Force 
}

New-ItemProperty $regPath -Name 'DeploymentType' -Value $DeploymentType -PropertyType String -Force
New-ItemProperty $regPath -Name 'ManagementPoint' -Value $MP -PropertyType String -Force
New-ItemProperty $regPath -Name 'TaskSequence' -Value $TaskSequence -PropertyType String -Force
New-ItemProperty $regPath -Name 'Department' -Value $Dept -PropertyType String -Force
New-ItemProperty $regPath -Name 'ImageStartTime' -Value $OSDStartTime -PropertyType String -Force
New-ItemProperty $regPath -Name 'ImageEndTime' -Value $OSDEndTime -PropertyType String -Force



