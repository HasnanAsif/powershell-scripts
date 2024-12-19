# This script retrieves the total and free space of the C: drive, analyzes the free space, 
# and provides feedback based on the available disk space, such as whether it's too low, normal, or shareable.


# Define a function to analyze the free space of the disk and provide feedback
Function Get-Testresult {
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipeline)] # Input parameter for the free space size (in GB)
        $item
    )

    Write-Host "You passed the free space size $item GB into the free space analysis function."  
    
    # Analyze the free space and provide feedback based on its value
    if ($item -le 100) { 
        Write-Host "Free Space is too limited! Please act upon instantly." -ForegroundColor Red 
    } 
    elseif ($item -ge 5000) {
        Write-Host "The disk space can be shared with more others." -ForegroundColor Green 
    } 
    else {
        Write-Host "Normal free space." 
    }
}

# Get C: drive details and calculate total and free space in GB
$disk = Get-WmiObject Win32_LogicalDisk -Filter "DeviceID='C:'" | Select-Object Size, FreeSpace 
$tdisk = $disk.Size / 1GB 
"Total C: drive space is $tdisk GB" 
$fdisk = $disk.FreeSpace / 1GB 
Get-Testresult -item $fdisk 


