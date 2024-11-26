# This script tests the connectivity to a specified computer using Test-Connection and provides feedback on whether the connection is successful.

#Begin
Write-host "Please enter ComputerName:"
$ComputerName = read-host
write-host "Reminder: the ComputerName is  $Computername." -ForegroundColor DarkYellow
$status = Test-Connection  -ComputerName    $Computername   -count 1
if ($status.statuscode -eq 0) {
Write-Output “Connection test result is $True.”
} 
else {
Write-Output “Connection test result is $False.”
}
#End
