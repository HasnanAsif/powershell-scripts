# This script tests the connectivity to a specified computer using Test-Connection and provides feedback on whether the connection is successful.

#Begin
# Prompt the user to enter the target computer name
Write-host "Please enter ComputerName:"

# Capture the user input for the computer name
$ComputerName = read-host

# Display the entered computer name for confirmation
write-host "Reminder: the ComputerName is  $Computername." -ForegroundColor DarkYellow

# Use Test-Connection to test the connectivity to the specified computer
$status = Test-Connection  -ComputerName $Computername -count 1

# Check if the connection was successful (status code 0 indicates success)
if ($status.statuscode -eq 0) {
    # Display success message if the connection is successful
    Write-Output “Connection test result is $True.”
} 
else {
    # Display failure message if the connection fails
    Write-Output “Connection test result is $False.”
}
#End
