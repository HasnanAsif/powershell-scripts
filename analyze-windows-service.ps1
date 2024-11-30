# This script checks if a specific Windows service is installed on the computer and displays its status.


# Define a custom function to check if a Windows service is installed and display its status
Function Get-Testresult {
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipeline)] # Accept a parameter for the service name (ValueFromPipeline allows piping input)
        $item  
    )
    
    $Service = Get-Service -name $item -ErrorAction SilentlyContinue # Attempt to retrieve the service details using Get-Service
    
    If (-Not $Service) { # If the service is not found, display a message indicating it is not installed
        $item + " is not installed on this computer."
    } 
    Else { # If the service is found, display a message showing it is installed and its current status
        $item + " is installed."
        $item + "'s status is: " + $service.Status
    }
}

$domore = "Yes" # Initialize a variable to control whether the script should check another service

# Begin a loop that allows the user to check multiple services
Do {
    $Name = Read-Host "Key in Service Name"
    $name | Get-Testresult
    $domore = Read-Host "Do you want to test one more service? If so, please key in `"Yes`". Or press any key to stop" # Ask the user if they want to check another service
} While ($domore -eq "Yes") # Continue the loop if the user enters "Yes"

# Display a message when the script ends
"Thanks, run it again if more services need to be analyzed." 


