# This script renames .ps1 files in a specified folder by appending a number to their names. It also offers the option to reverse the changes, restoring the files to their original names.

#Begin
[int] $i = 1
Foreach ($file in Get-ChildItem "C:\Users\Administrator\Desktop\tmp\*.ps1") {
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

Write-Host "Total number of PS file name changes: $($i-1). Please check the new names in the folder."

$reverse = Read-Host "Do you want to reverse the changes? (Yes/No)"

if ($reverse -eq "Yes") {

    [int] $i = 1
    Foreach ($file in Get-ChildItem "C:\Users\Administrator\Desktop\tmp\*.ps1") {
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

    Write-Host "All files have been restored to their original names."
}

Write-Host "Total number of PS file name restorations: $($i-1). Please check the original names in the folder."
#End
