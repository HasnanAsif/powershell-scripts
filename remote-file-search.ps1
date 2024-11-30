# This script is designed to search for files of a specific type on a remote computer, provided the user can input the target computer name and file type.


$ComputerName = Read-Host "Please enter the target ComputerName for file search" # Prompt the user to input the target computer name
$FileType = Read-Host "Please enter the file type to search (e.g., .ps1, .txt, .csv, etc.)" # Prompt the user to input the file type to search
Write-Host "Searching for $FileType files on $ComputerName..." # Display a message indicating the search type and target

$status = Test-Connection -ComputerName $ComputerName -Count 1 # Test the connection to the target computer by pinging it

# If the connection is successful, the status code will be 0
if ($status.StatusCode -eq 0) {
    Write-Host "Connection test result is $True. Retrieving files from $ComputerName..."

    $job = Invoke-Command -ComputerName $ComputerName -AsJob -ScriptBlock { # Execute the file search on the remote computer as a background job
        param ($FileType) # Change directory to c:\pswork (adjust path as needed)
        cd c:\pswork

        dir *$FileType -Recurse -ErrorAction SilentlyContinue |  # Recursively search for files of the specified type and select key properties
            Select-Object FullName, Length, CreationTime, LastWriteTime
    } -ArgumentList $FileType

    $job | Wait-Job # Wait for the background job to complete
    $output = Receive-Job -Job $job # Retrieve the output from the completed job

    if ($output) { # If files are found, display the results and the total number of files found
        $output
        Write-Host "`nTotal number of $FileType files found: $($output.Count)" -ForegroundColor Green
    } else {
        Write-Host "No $FileType files found on $ComputerName." -ForegroundColor Yellow # If no files are found, inform the user
    }

    Remove-Job -Job $job # Clean up and remove the completed job from the session
} else {
    Write-Host "Connection test result is $False." -ForegroundColor DarkRed # If the connection test fails, display an error message
}

