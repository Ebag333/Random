# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
#
# Description: Create kiosk user, kiosk group and add kiosk user to group
# Author: jamescradit
# Date: 4/24/2013
# Version: 1.0
# Changelog: 1.0 - Initial Version
#
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\


#Variables
$PASSWD_NO_CHANGE = 64
$DONT_EXPIRE_PW = 65536



#ADSI provider provides methods for all the work done below
$adsi = [ADSI]"WinNT://$env:computername"

#Create Group
$group = $adsi.Create("group","KIOSK_USERS")
$group.setinfo()
$group.description = "Restricted group that locks down users into Kiosk Mode."
$group.setinfo()

#Create User
$user = $adsi.Create("User", "Umpqua")
$user.setpassword("")
$user.Setinfo()
$user.description = "Umpqua User"
$user.Setinfo()
$user.UserFlags = $user.UserFlags.Value -bor $PASSWD_NO_CHANGE  #This sets the account to not be able to change the password
$user.UserFlags = $user.UserFlags.Value -bor $DONT_EXPIRE_PW    #This sets the account so the password never expires
$user.SetInfo()

#Add user to KIOSK_USERS group. 
$localkioskgroup=[ADSI]"WinNT://$env:computername/KIOSK_USERS,Group"
$localkioskgroup.Add("WinNT://$env:computername/Umpqua")

#Add user to Users Group.
$localusersgroup=[ADSI]"WinNT://$env:computername/Users,Group"
$localusersgroup.Add("WInNT://$env:computername/Umpqua")