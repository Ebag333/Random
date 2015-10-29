# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
#
# Description: Set Folder permissions on umpqua user
# Author: jamescradit
# Date: 4/25/2013
# Version: 1.0
# Changelog: 1.0 - Initial Version
#
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\





cls

$aclArray = (
    
    "C:\Users\Umpqua\Desktop", `
    "C:\Users\Umpqua\Downloads", `
    "C:\Users\Umpqua\Favorites", `
    "C:\Users\Umpqua\Music", `
    "C:\Users\Umpqua\Pictures", `
    "C:\Users\Umpqua\Videos", `
    "C:\Users\Umpqua\Saved Games"

)


$objUser = New-Object System.Security.Principal.NTAccount("umpqua")



Foreach ( $i in $aclArray )

{
    
    
    $acl = (get-item $fsitem).GetAccessControl("Access")
    $acl.SetAccessRuleProtection($True,$False)

    $Rule = New-Object System.Security.AccessControl.FileSystemAccessRule($objuser,"ReadAndExecute", `
    "ContainerInherit,ObjectInherit","None","Allow")


    $acl.SetAccessRule($Rule)
    set-acl $i $acl
 

}


