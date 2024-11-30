# This script provides a list of all files and folders on the C: drive. 
# It displays the item number, name, creation time, and indicates whether it is a file or a folder.


[int] $i = 1 # Initialize a counter variable to track the number of files and folders

cd C:\ # Change the current directory to the root of the C: drive

# Iterate through all files and folders on the C: drive using Get-ChildItem
Foreach ($file in Get-ChildItem C:\) {
    Write-Host "File/Folder#: $i" -ForegroundColor DarkGreen # Display the item number with green text
    Write-Host "File/Folder Name: $file.Name" # Display the name of the file or folder
    Write-Host "Creation time: $file.CreationTime" # Display the creation time of the file or folder

    if ((Get-Item -Path $file).PSIsContainer) { # Check if the current item is a folder using the PSIsContainer property
        Write-Host "$($file.Name) is a folder." # Display a message indicating the item is a folder
    } else {
        Write-Host "$($file.Name) is a file." # Display a message indicating the item is a file
    }

    Write-Host " " # Add a blank line for better readability between items
    $i++ # Increment the counter
}

Write-Host "Total item number: $($i - 1)" # Display the total number of items processed


