# This script is designed to search for files of a specific type on a remote computer, provided the user can input the target computer name and file type.

#Begin
# Prompt the user to input the target computer name
$ComputerName = Read-Host "Please enter the target ComputerName for file search"

# Prompt the user to input the file type to search for (e.g., .ps1, .txt, .csv)
$FileType = Read-Host "Please enter the file type to search (e.g., .ps1, .txt, .csv, etc.)"

# Display a message indicating the search type and target
Write-Host "Searching for $FileType files on $ComputerName..."

# Test the connection to the target computer by pinging it
$status = Test-Connection -ComputerName $ComputerName -Count 1

# If the connection is successful, the status code will be 0
if ($status.StatusCode -eq 0) {
    Write-Host "Connection test result is $True. Retrieving files from $ComputerName..."

    # Execute the file search on the remote computer as a background job
    $job = Invoke-Command -ComputerName $ComputerName -AsJob -ScriptBlock {
        param ($FileType)
        # Change directory to c:\pswork (adjust path as needed)
        cd c:\pswork
        # Recursively search for files of the specified type and select key properties
        dir *$FileType -Recurse -ErrorAction SilentlyContinue | 
            Select-Object FullName, Length, CreationTime, LastWriteTime
    } -ArgumentList $FileType

    # Wait for the background job to complete
    $job | Wait-Job
    # Retrieve the output from the completed job
    $output = Receive-Job -Job $job

    # If files are found, display the results and the total number of files found
    if ($output) {
        $output
        Write-Host "`nTotal number of $FileType files found: $($output.Count)" -ForegroundColor Green
    } else {
        # If no files are found, inform the user
        Write-Host "No $FileType files found on $ComputerName." -ForegroundColor Yellow
    }

    # Clean up and remove the completed job from the session
    Remove-Job -Job $job
} else {
    # If the connection test fails, display an error message
    Write-Host "Connection test result is $False." -ForegroundColor DarkRed
}
#End
