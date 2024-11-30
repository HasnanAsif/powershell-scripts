# This PowerShell script provides an interactive menu to manage Active Directory users. It allows administrators to:
# 1. List all domain users
# 2. Add a new user to the domain
# 3. Remove an existing user from the domain 

#Begin
function add-newuser
{
    # Prompt for the new user's given name
    $gname=read-host “Please key in domain new user’s Given Name:” 
    
    # Prompt for the new user's surname
    $sname=read-host “Please key in domain new user’s Sur Name:”
    
    # Prompt for the new user's password
    $pass=read-host “Please key in domain new user’s password:”
    
    # Create a new Active Directory user with the provided information
    New-ADUser -name “$gname $sname” -SamAccountName “$gname $sname”  -AccountPassword (ConvertTo-SecureString “$pass” -AsPlainText -Force) -DisplayName “$gname $sname” -Enabled $True -GivenName $gname -Surname $sname
    
    # Notify the administrator that the new user account is created
    write-host “New user account is now created properly!” -ForegroundColor Green
} 

function list-adusers
{
    # Display a list of all domain users' information
    write-host “List of domain users’ information” -ForegroundColor Green 
    get-ADUser  -filter *  |ft
} 

function d-user
{
    # Prompt for the username of the user to be removed
    $name1=read-host “Key in the user name which you want to remove from your domain”
    
    # Remove the specified Active Directory user
    remove-aduser $name1
} 

# Initialize the option variable and enter the loop
$option=”Null”
do
{
    # Display menu options for the administrator
    write-host “Please type L to list your domain users, 
                 type A to add a new domain user account,
                 type R to remove existing domain user account 
                 and type any other key to exit:” -ForegroundColor Green

    # Read the administrator's menu choice
    $option=read-host 
    $x=1

    # Handle the menu choice with a switch statement
    switch ($option)
    {
        ‘L’ {list-adusers}  # List all domain users
        ‘A’ {add-newuser}   # Add a new user to the domain
        ‘R’ {d-user}        # Remove an existing user from the domain
        Default {$x=2}       # Exit the loop for any other key input
    }  
}
until ($x -eq 2)  # Exit the loop when $x is 2
#End


