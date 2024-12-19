# This script checks if a specific Windows service is installed on the computer and displays its status.


# Define a custom function to check if a Windows service is installed and display its status
Function Get-Testresult {
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipeline)] 
        $item  
    )
    
    $Service = Get-Service -name $item -ErrorAction SilentlyContinue # Attempt to retrieve the service details using Get-Service
    
    If (-Not $Service) { 
        $item + " is not installed on this computer." 
    } 
    Else { 
        $item + " is installed."
        $item + "'s status is: " + $service.Status 
    }
}

$domore = "Yes" 

# Begin a loop that allows the user to check multiple services
Do {
    $Name = Read-Host "Key in Service Name"
    $name | Get-Testresult
    $domore = Read-Host "Do you want to test one more service? If so, please key in `"Yes`". Or press any key to stop" 
} While ($domore -eq "Yes") 

# Display a message when the script ends
"Thanks, run it again if more services need to be analyzed." 


