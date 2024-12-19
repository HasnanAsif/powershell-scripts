# This script checks if a computer is reachable using Test-Connection.


Write-host "Please enter ComputerName:" # Prompt user for the target computer name
$ComputerName = read-host # Capture the computer name input

write-host "Reminder: the ComputerName is  $Computername." -ForegroundColor DarkYellow # Display the entered computer name for confirmation
$status = Test-Connection  -ComputerName $Computername -count 1 # Test connection to the specified computer

# Check if the connection was successful and inform user
if ($status.statuscode -eq 0) {
    Write-Output “Connection test result is $True.” 
} 
else {
    Write-Output “Connection test result is $False.” 
}

