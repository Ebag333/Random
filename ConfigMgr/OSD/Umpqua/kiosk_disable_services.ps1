# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
#
# Description: Lock down services on Kiosk Machines
# Author: jamescradit
# Date: 4/25/2013
# Version: 1.0
# Changelog: 1.0 - Initial Version
#
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\



#Set Application Identity to Automatic. This is needed for Applocker. 
Set-Service -Name AppIDSvc -StartupType Automatic -Status Running




#Disable the following services:

#Application Layer Gateway Service
#File History Service
#HomeGroup Listener
#HomeGroup Provider
#Internet Connection Sharing
#Link-Layer Topology Discovery Mapper
#Microsoft Account Sign-In Assistant
#Offline Files
#Peer Name Resolution Protocol
#Peer Networking Grouping
#Peer Networking Identity Manager
#PNRP Machine Name Publication Service
#Program Compatibility Assistance Service
#Remote Access Auto Connection Manager
#Remote Registry
#Routing and Remote Access
#Server
#SSDP Discovery
#UPnP Device Host
#Windows Media Player Network Sharing Service



#Build Array for services

$serviceArray = ( 
    "ALG", `
    "FHSVC", `
    "HomeGroupLIstener", `
    "HomeGroupProvider", `
    "SharedAccess", `
    "lltdsvc", `
    "wlidsvc", `
    "CscService", `
    "PNRPsvc", `
    "p2psvc", `
    "p2pimsvc", `
    "PNRPsvc", `
    "PcaSvc", `
    "RasAuto", `
    "RemoteRegistry", `
    "RemoteAccess", `
    "LanManServer", `
    "SSDPSRV", `
    "upnphost", `
    "WMPNetworkSvc"
)


# Loop through array to disable services

Foreach ($i in $serviceArray)
{
    
    Set-Service -Name $i -StartupType Disabled
    write-host "Disabled $i"
}
