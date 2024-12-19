# This script provides a list of all files and folders on the C: drive. 
# It displays the item number, name, creation time, and indicates whether it is a file or a folder.


[int] $i = 1 # Counter for item numbering

cd C:\ # Switch to the root of the C: drive

# Loop through each item (file/folder) in the C: drive
Foreach ($file in Get-ChildItem C:\) {
    Write-Host "File/Folder#: $i" -ForegroundColor DarkGreen 
    Write-Host "File/Folder Name: $file.Name" 
    Write-Host "Creation time: $file.CreationTime" 

    # Indicate if it's a file or folder
    if ((Get-Item -Path $file).PSIsContainer) { 
        Write-Host "$($file.Name) is a folder." 
    } else {
        Write-Host "$($file.Name) is a file." 
    }

    Write-Host " " 
    $i++ # Increment the counter
}

Write-Host "Total item number: $($i - 1)" # Display the total number of items processed


