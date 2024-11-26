# This PowerShell script provides an interactive menu to manage Active Directory users. It allows administrators to:
# 1. List all domain users
# 2. Add a new user to the domain
# 3. Remove an existing user from the domain 

#Begin
function add-newuser
{
$gname=read-host “Please key in domain new user’s Given Name:” 
$sname=read-host “Please key in domain new user’s Sur Name:”
$pass=read-host “Please key in domain new user’s password:”
New-ADUser -name “$gname $sname” -SamAccountName “$gname $sname”  -AccountPassword (ConvertTo-SecureString “$pass” -AsPlainText -Force) -DisplayName “$gname $sname” -Enabled $True -GivenName $gname -Surname $sname
write-host “New user account is now created properly!” -ForegroundColor  Green
} 

function list-adusers
{
write-host “List of doamin users’ information” -ForegroundColor Green 
get-ADUser  -filter *  |ft
} 

function d-user
{
$name1=read-host “Key in the user name which you want to remove from your domain”
remove-aduser $name1
} 

$option=”Null”
do
{
write-host “Please type L to list your domain users, 
type A to add a new domain user account,
type R to remove exiting domain user account 
and type any other key to exit:” -ForegroundColor Green

$option=read-host 
$x=1
 switch ($option)
 {
     ‘L’ {list-adusers}
     ‘A’ {add-newuser} 
     ‘R’ {d-user}
     Default {$x=2}
 }  
}
until ($x -eq 2) 
#End

