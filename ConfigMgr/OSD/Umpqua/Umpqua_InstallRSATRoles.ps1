# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
#
# Description: Powershell Add RSAT roles
# Author: jamescradit
# Date: 8/15/2013
# Version: 1.0
# Changelog: 1.0 - Initial Version
#
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\

dism /Online /Enable-Feature /FeatureName:RemoteServerAdministrationTools /FeatureName:RemoteServerAdministrationTools-ServerManager /FeatureName:RemoteServerAdministrationTools-Roles /FeatureName:RemoteServerAdministrationTools-Roles-CertificateServices /FeatureName:RemoteServerAdministrationTools-Roles-CertificateServices-CA /FeatureName:RemoteServerAdministrationTools-Roles-CertificateServices-OnlineResponder /FeatureName:RemoteServerAdministrationTools-Roles-AD /FeatureName:RemoteServerAdministrationTools-Roles-AD-DS /FeatureName:RemoteServerAdministrationTools-Roles-AD-DS-SnapIns /FeatureName:RemoteServerAdministrationTools-Roles-AD-DS-AdministrativeCenter /FeatureName:RemoteServerAdministrationTools-Roles-AD-DS-NIS /FeatureName:RemoteServerAdministrationTools-Roles-AD-LDS /FeatureName:RemoteServerAdministrationTools-Roles-AD-Powershell /FeatureName:RemoteServerAdministrationTools-Roles-DHCP /FeatureName:RemoteServerAdministrationTools-Roles-DNS /FeatureName:RemoteServerAdministrationTools-Roles-FileServices /FeatureName:RemoteServerAdministrationTools-Roles-FileServices-Dfs /FeatureName:RemoteServerAdministrationTools-Roles-FileServices-Fsrm /FeatureName:RemoteServerAdministrationTools-Roles-FileServices-StorageMgmt /FeatureName:RemoteServerAdministrationTools-Roles-HyperV /FeatureName:RemoteServerAdministrationTools-Roles-RDS /FeatureName:RemoteServerAdministrationTools-Features /FeatureName:RemoteServerAdministrationTools-Features-BitLocker /FeatureName:RemoteServerAdministrationTools-Features-Clustering /FeatureName:RemoteServerAdministrationTools-Features-GP /FeatureName:RemoteServerAdministrationTools-Features-LoadBalancing /FeatureName:RemoteServerAdministrationTools-Features-StorageExplorer /FeatureName:RemoteServerAdministrationTools-Features-StorageManager /FeatureName:RemoteServerAdministrationTools-Features-Wsrm


