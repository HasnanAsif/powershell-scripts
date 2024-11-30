# This script retrieves the total and free space of the C: drive, analyzes the free space, 
# and provides feedback based on the available disk space, such as whether it's too low, normal, or shareable.


# Define a function to analyze the free space of the disk and provide feedback
Function Get-Testresult {
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipeline)] # Accept a parameter for the free space size (in GB)
        $item
    )

    Write-Host "You passed the free space size $item GB into the free space analysis function."  # Inform the user of the passed free space size
    
    # Analyze the free space and provide feedback based on its value
    if ($item -le 100) { 
        Write-Host "Free Space is too limited! Please act upon instantly." -ForegroundColor Red # If free space is less than or equal to 100GB, warn the user to take immediate action
    } 
    elseif ($item -ge 5000) {
        Write-Host "The disk space can be shared with more others." -ForegroundColor Green # If free space is greater than or equal to 5000GB, inform the user that the space can be shared
    } 
    else {
        Write-Host "Normal free space." # For any other free space value, display a message indicating normal free space
    }
}

$disk = Get-WmiObject Win32_LogicalDisk -Filter "DeviceID='C:'" | Select-Object Size, FreeSpace # Retrieve the total and free space of the C: drive using WMI (Windows Management Instrumentation)

$tdisk = $disk.Size / 1GB # Calculate the total disk size in gigabyte

"Total C: drive space is $tdisk GB" # Display the total disk size to the user

$fdisk = $disk.FreeSpace / 1GB # Calculate the free disk space in gigabytes

Get-Testresult -item $fdisk # Call the Get-Testresult function to analyze the free space


