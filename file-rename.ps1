# This script renames .ps1 files in a specified folder by appending a number to their names. It also offers the option to reverse the changes, restoring the files to their original names.


[int] $i = 1 # Counter for renaming

# Rename all .ps1 files in the specified folder
Foreach ($file in Get-ChildItem "C:\Users\Administrator\Desktop\tmp\*.ps1") {
    Write-Host "PS File#: $i" 
    Write-Host "Old PS File: $($file.Name)"
    
    $newname = $file.Name -replace "\.ps1$", "$i.ps1" # Append number to the file name
    Rename-Item -Path $file.FullName -NewName $newname # Rename the file
    
    Write-Host "New PS File: $newname" 
    Write-Host ""
    $i++ # Increment the counter
}

Write-Host "Total number of PS file name changes: $($i-1). Please check the new names in the folder." # Show total renamed files

$reverse = Read-Host "Do you want to reverse the changes? (Yes/No)" # Ask if changes should be undone

# Reverse the renaming if the user chooses "Yes"
if ($reverse -eq "Yes") {
    [int] $i = 1 # Reset counter

    # Restore original names of the .ps1 files
    Foreach ($file in Get-ChildItem "C:\Users\Administrator\Desktop\tmp\*.ps1") {
        Write-Host "PS File#: $i" 
        Write-Host "Current PS File: $($file.Name)"
    
        $originalName = $file.Name -replace "$i\.ps1$", ".ps1" # Restore original name
        Rename-Item -Path $file.FullName -NewName $originalName # Rename the file back
    
        Write-Host "Restored PS File: $originalName" 
        Write-Host ""
        $i++ # Increment the counter
    }
    
    Write-Host "All files have been restored to their original names." # Confirm restoration
}

Write-Host "Total number of PS file name restorations: $($i-1). Please check the original names in the folder." # Show total restored files
