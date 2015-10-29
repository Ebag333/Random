Set-Service 'BDESVC' -startuptype "disabled"
Set-Service 'wbengine' -startuptype "disabled"
Set-Service 'DPS' -startuptype "disabled"
Set-Service 'UxSms' -startuptype "disabled"
Set-Service 'Defragsvc' -startuptype "disabled"
Set-Service 'HomeGroupListener' -startuptype "disabled"
Set-Service 'HomeGroupProvider' -startuptype "disabled"
Set-Service 'iphlpsvc' -startuptype "disabled"
Set-Service 'MSiSCSI' -startuptype "disabled"
Set-Service 'swprv' -startuptype "disabled"
Set-Service 'CscService' -startuptype "disabled"
Set-Service 'SstpSvc' -startuptype "disabled"
Set-Service 'wscsvc' -startuptype "disabled"
Set-Service 'SSDPSRV' -startuptype "disabled"
Set-Service 'SysMain' -startuptype "disabled"
Set-Service 'TabletInputService' -startuptype "disabled"
Set-Service 'Themes' -startuptype "disabled"
Set-Service 'upnphost' -startuptype "disabled"
Set-Service 'VSS' -startuptype "disabled"
Set-Service 'SDRSVC' -startuptype "disabled"
Set-Service 'WinDefend' -startuptype "disabled"
Set-Service 'WerSvc' -startuptype "disabled"
Set-Service 'ehRecvr' -startuptype "disabled"
Set-Service 'ehSched' -startuptype "disabled"
Set-Service 'WSearch' -startuptype "disabled"
Set-Service 'Wlansvc' -startuptype "disabled"
Set-Service 'WwanSvc' -startuptype "disabled"
disable-computerrestore -drive c:\




bcdedit /set BOOTUX disabled
vssadmin delete shadows /All /Quiet
powercfg -H OFF
fsutil behavior set DisableLastAccess 1
schtasks /change /TN "\Microsoft\Windows\Defrag\ScheduledDefrag" /Disable
schtasks /change /TN "\Microsoft\Windows\SystemRestore\SR" /Disable
schtasks /change /TN "\Microsoft\Windows\Registry\RegIdleBackup" /Disable
schtasks /change /TN "\Microsoft\Windows Defender\MPIdleTask" /Disable
schtasks /change /TN "\Microsoft\Windows Defender\MP Scheduled Scan" /Disable
schtasks /change /TN "\Microsoft\Windows\Maintenance\WinSAT" /Disable