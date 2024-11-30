# This script retrieves the total and free space of the C: drive, analyzes the free space, 
# and provides feedback based on the available disk space, such as whether it's too low, normal, or shareable.

#Begin

# Define a function to analyze the free space of the disk and provide feedback
Function Get-Testresult {
    [CmdletBinding()]
    Param(
        # Accept a parameter for the free space size (in GB)
        [Parameter(ValueFromPipeline)]
        $item
    )
    
    # Inform the user of the passed free space size
    Write-Host "You passed the free space size $item GB into the free space analysis function."
    
    # Analyze the free space and provide feedback based on its value
    if ($item -le 100) {
        # If free space is less than or equal to 100GB, warn the user to take immediate action
        Write-Host "Free Space is too limited! Please act upon instantly." -ForegroundColor Red
    } 
    elseif ($item -ge 5000) {
        # If free space is greater than or equal to 5000GB, inform the user that the space can be shared
        Write-Host "The disk space can be shared with more others." -ForegroundColor Green
    } 
    else {
        # For any other free space value, display a message indicating normal free space
        Write-Host "Normal free space."
    }
}

# Retrieve the total and free space of the C: drive using WMI (Windows Management Instrumentation)
$disk = Get-WmiObject Win32_LogicalDisk -Filter "DeviceID='C:'" | Select-Object Size, FreeSpace

# Calculate the total disk size in gigabytes
$tdisk = $disk.Size / 1GB

# Display the total disk size to the user
"Total C: drive space is $tdisk GB"

# Calculate the free disk space in gigabytes
$fdisk = $disk.FreeSpace / 1GB

# Call the Get-Testresult function to analyze the free space
Get-Testresult -item $fdisk

#End
