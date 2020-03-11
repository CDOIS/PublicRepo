#Set the execution policy as bypass, from  (so you don't get annoyin messages from windows, asking for permission)
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope LocalMachine -Force
#Set and store password as a secure string
$Secure_String_Pwd = ConvertTo-SecureString "student" -asPlainText -Force
#Set user name as a variable
$UsrName = "Max"
#Set group name as a variable
$GrpName = "ITAdmins"
#Create the new user, set it's password
New-LocalUser $UsrName -Password $Secure_String_Pwd -FullName "Maxwell Silverhammer" -Description "Clang Clang" -AccountNeverExpires 
#Enable the local user (Don't think that's needed, but got it done when trying out the Logon Screen)
Enable-LocalUser $UsrName
#Create Local Group
New-LocalGroup $GrpName
#Add the user to the Local Group "Users"
Add-LocalGroupMember -Group "Users" -Member $UsrName
#Add the user to the Local Group "ITAdmins"
Add-LocalGroupMember -Group $GrpName -Member $UsrName
#Add the local group "ITAdmins" to the "Administrators" group
Add-LocalGroupMember -Group "Administrators" -Member $GrpName
#Create the new directory "Backup"
New-Item -ItemType "Directory" -Path "C:\Backup"
#Copy the folder and content to the "Backup" folder
Copy-Item -Path "E:\CompanyInc" -Destination "C:\Backup" -Recurse -Container
