# In the ISE 
# open Powershell,  
# type set-executionPolicy unrestricted
# then hit Y to accept it.

#Save current suername on a variable
$cname = Get-Content env:username
#Save current date on a variable
$date = Get-Date -Format d.MMM.yyyy
#Save save a directory into a variable
$drive = "C:\Backup\$date"
#Save variable concatenation
$dest = $drive + $cname
#Create a new directory named as the concatenated variable (date/username)
New-Item -Path $dest -ItemType directory 
#Save variable with the specific directory
$path = "E:\CompanyInc"
#Save variable with "everything" wildcard
$include = @("*.*")
#Reach for the files/folders inside the directory and copy them to the $dest
Get-ChildItem -Path $path -Include $include -Recurse -Force -ErrorAction SilentlyContinue | foreach { copy-item -Path $_ -Destination $dest -Recurse -Container  } -ErrorAction SilentlyContinue