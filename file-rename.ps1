# This script renames .ps1 files in a specified folder by appending a number to their names. It also offers the option to reverse the changes, restoring the files to their original names.


[int] $i = 1 # Initialize a counter variable to number the files during renaming

# Iterate through all .ps1 files in the specified folder
Foreach ($file in Get-ChildItem "C:\Users\Administrator\Desktop\tmp\*.ps1") {

    Write-Host "PS File#: $i" # Display the file number and the old file name
    Write-Host "Old PS File: $($file.Name)"
    
    $newname = $file.Name -replace "\.ps1$", "$i.ps1" # Create new name with $i replacing ".ps1" with "$i.ps1"
    Rename-Item -Path $file.FullName -NewName $newname # Rename the file with its full path
    
    Write-Host "New PS File: $newname" # Display file new name
    Write-Host ""
    
    $i++ # Increment the counter
}

Write-Host "Total number of PS file name changes: $($i-1). Please check the new names in the folder." # Display the total number of files that were renamed

$reverse = Read-Host "Do you want to reverse the changes? (Yes/No)" # Ask the user if they want to reverse the renaming process

# If the user chooses to reverse the changes
if ($reverse -eq "Yes") {

    [int] $i = 1 # Reinitialize the counter to start from 1 for restoration

    # Iterate through the renamed .ps1 files in the folder
    Foreach ($file in Get-ChildItem "C:\Users\Administrator\Desktop\tmp\*.ps1") {

        Write-Host "PS File#: $i" # Display the file number and the current file name
        Write-Host "Current PS File: $($file.Name)"
    
        $originalName = $file.Name -replace "$i\.ps1$", ".ps1" # Create original name by removing the appended number
        Rename-Item -Path $file.FullName -NewName $originalName # Rename the file with its full path
    
        Write-Host "Restored PS File: $originalName" # Display file restored name
        Write-Host ""

        $i++ # Increment the counter
    }
    
    Write-Host "All files have been restored to their original names." # Inform the user that all files have been restored to their original names
}

Write-Host "Total number of PS file name restorations: $($i-1). Please check the original names in the folder." # Display the total number of files that were restored

