# This PowerShell script provides an interactive menu to manage Active Directory users. It allows administrators to:
# 1. List all domain users
# 2. Add a new user to the domain
# 3. Remove an existing user from the domain 


function add-newuser
{
    # Prompt for the new user's information
    $gname=read-host “Please key in domain new user’s Given Name:” 
    $sname=read-host “Please key in domain new user’s Sur Name:”
    $pass=read-host “Please key in domain new user’s password:”
    
    # Create a new Active Directory user with the provided information
    New-ADUser -name “$gname $sname” -SamAccountName “$gname $sname”  -AccountPassword (ConvertTo-SecureString “$pass” -AsPlainText -Force) -DisplayName “$gname $sname” -Enabled $True -GivenName $gname -Surname $sname
    write-host “New user account is now created properly!” -ForegroundColor Green # Notify the administrator that the new user account is created
} 

function list-adusers
{
    write-host “List of domain users’ information” -ForegroundColor Green # Display a list of all domain users' information
    get-ADUser  -filter *  |ft
} 

function d-user
{
    $name1=read-host “Key in the user name which you want to remove from your domain” # Prompt for the username of the user to be removed
    remove-aduser $name1 # Remove the specified Active Directory user
} 

$option=”Null” # Initialize the option variable and enter the loop
do
{
    # Display menu options for the administrator
    write-host “Please type L to list your domain users, 
                 type A to add a new domain user account,
                 type R to remove existing domain user account 
                 and type any other key to exit:” -ForegroundColor Green

    $option=read-host # Read the administrator's menu choice
    $x=1

    switch ($option) # Handle the menu choice with a switch statement
    {
        ‘L’ {list-adusers}  # List all domain users
        ‘A’ {add-newuser}   # Add a new user to the domain
        ‘R’ {d-user}        # Remove an existing user from the domain
        Default {$x=2}       # Exit the loop for any other key input
    }  
}
until ($x -eq 2)  # Exit the loop when $x is 2
#End


