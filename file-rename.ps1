# This script renames .ps1 files in a specified folder by appending a number to their names. It also offers the option to reverse the changes, restoring the files to their original names.

#Begin

[int] $i = 1 # Initialize a counter variable to number the files during renaming

# Iterate through all .ps1 files in the specified folder
Foreach ($file in Get-ChildItem "C:\Users\Administrator\Desktop\tmp\*.ps1") {

    # Display the file number and the old file name
    Write-Host "PS File#: $i"
    Write-Host "Old PS File: $($file.Name)"
    
    # Create new name with $i replacing ".ps1" with "$i.ps1"
    $newname = $file.Name -replace "\.ps1$", "$i.ps1"
    
    # Rename the file with its full path
    Rename-Item -Path $file.FullName -NewName $newname
    
    Write-Host "New PS File: $newname"
    Write-Host ""
    
    # Increment the counter
    $i++
}

# Display the total number of files that were renamed
Write-Host "Total number of PS file name changes: $($i-1). Please check the new names in the folder."

# Ask the user if they want to reverse the renaming process
$reverse = Read-Host "Do you want to reverse the changes? (Yes/No)"

# If the user chooses to reverse the changes
if ($reverse -eq "Yes") {

    [int] $i = 1 # Reinitialize the counter to start from 1 for restoration

    # Iterate through the renamed .ps1 files in the folder
    Foreach ($file in Get-ChildItem "C:\Users\Administrator\Desktop\tmp\*.ps1") {

        # Display the file number and the current file name
        Write-Host "PS File#: $i"
        Write-Host "Current PS File: $($file.Name)"
    
        # Create original name by removing the appended number
        $originalName = $file.Name -replace "$i\.ps1$", ".ps1"
    
        # Rename the file with its full path
        Rename-Item -Path $file.FullName -NewName $originalName
    
        Write-Host "Restored PS File: $originalName"
        Write-Host ""
    
        # Increment the counter
        $i++
    }
    
    # Inform the user that all files have been restored to their original names
    Write-Host "All files have been restored to their original names."
}

# Display the total number of files that were restored
Write-Host "Total number of PS file name restorations: $($i-1). Please check the original names in the folder."

#End
