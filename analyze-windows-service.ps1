# This script checks if a specific Windows service is installed on the computer and displays its status.

#Begin

# Define a custom function to check if a Windows service is installed and display its status
Function Get-Testresult {
    [CmdletBinding()]
    Param(
        # Accept a parameter for the service name (ValueFromPipeline allows piping input)
        [Parameter(ValueFromPipeline)]
        $item  
    )
    
    # Attempt to retrieve the service details using Get-Service
    $Service = Get-Service -name $item -ErrorAction SilentlyContinue
    
    # If the service is not found, display a message indicating it is not installed
    If (-Not $Service) {
        $item + " is not installed on this computer."
    } 
    # If the service is found, display a message showing it is installed and its current status
    Else {
        $item + " is installed."
        $item + "'s status is: " + $service.Status
    }
}

# Initialize a variable to control whether the script should check another service
$domore = "Yes"

# Begin a loop that allows the user to check multiple services
Do {
    # Prompt the user to enter the name of the service to check
    $Name = Read-Host "Key in Service Name"
    
    # Pass the entered service name to the Get-Testresult function for processing
    $name | Get-Testresult
    
    # Ask the user if they want to check another service
    $domore = Read-Host "Do you want to test one more service? If so, please key in `"Yes`". Or press any key to stop"
} While ($domore -eq "Yes") # Continue the loop if the user enters "Yes"

# Display a message when the script ends
"Thanks, run it again if more services need to be analyzed." 

#End
