# This script is designed to search for files of a specific type on a remote computer, provided the user can input the target computer name and file type.

# Get the user to input target computer and file type to search, then output search details
$ComputerName = Read-Host "Please enter the target ComputerName for file search" 
$FileType = Read-Host "Please enter the file type to search (e.g., .ps1, .txt, .csv, etc.)" 
Write-Host "Searching for $FileType files on $ComputerName..." 

$status = Test-Connection -ComputerName $ComputerName -Count 1 # Check if the computer is reachable by pinging it

# If the connection is successful
if ($status.StatusCode -eq 0) {
    Write-Host "Connection test result is $True. Retrieving files from $ComputerName..."

    # Searches for specified file type in C:\pswork on remote computer
    $job = Invoke-Command -ComputerName $ComputerName -AsJob -ScriptBlock { 
        param ($FileType) 
        cd c:\pswork 
        dir *$FileType -Recurse -ErrorAction SilentlyContinue |  
            Select-Object FullName, Length, CreationTime, LastWriteTime
    } -ArgumentList $FileType

    $job | Wait-Job                   
    $output = Receive-Job -Job $job  # Waits for the job to complete and retrieves the output.

    if ($output) { # If files are found, display the results and the total number of files found
        $output
        Write-Host "`nTotal number of $FileType files found: $($output.Count)" -ForegroundColor Green
    } else {
        Write-Host "No $FileType files found on $ComputerName." -ForegroundColor Yellow 
    }

    Remove-Job -Job $job # Clean up and remove the completed job from the session
} else {
    Write-Host "Connection test result is $False." -ForegroundColor DarkRed # If the connection test fails, display an error message
}

