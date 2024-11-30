# This script tests the connectivity to a specified computer using Test-Connection and provides feedback on whether the connection is successful.


Write-host "Please enter ComputerName:" # Prompt the user to enter the target computer name
$ComputerName = read-host # Capture the user input for the computer name

write-host "Reminder: the ComputerName is  $Computername." -ForegroundColor DarkYellow # Display the entered computer name for confirmation
$status = Test-Connection  -ComputerName $Computername -count 1 # Use Test-Connection to test the connectivity to the specified computer

# Check if the connection was successful (status code 0 indicates success)
if ($status.statuscode -eq 0) {
    Write-Output “Connection test result is $True.” # Display success message if the connection is successful
} 
else {
    Write-Output “Connection test result is $False.” # Display failure message if the connection fails
}

