# This script is designed to search for files of a specific type on a remote computer, provided the user can input the target computer name and file type.

#Begin
$ComputerName = Read-Host "Please enter the target ComputerName for file search"
$FileType = Read-Host "Please enter the file type to search (e.g., .ps1, .txt, .csv, etc.)"
Write-Host "Searching for $FileType files on $ComputerName..."

# Test connection to the target computer
$status = Test-Connection -ComputerName $ComputerName -Count 1
if ($status.StatusCode -eq 0) {
    Write-Host "Connection test result is $True. Retrieving files from $ComputerName..."
    
    # Execute the search as a PowerShell job
    $job = Invoke-Command -ComputerName $ComputerName -AsJob -ScriptBlock {
        param ($FileType)
        cd c:\pswork
        dir *$FileType -Recurse -ErrorAction SilentlyContinue | 
            Select-Object FullName, Length, CreationTime, LastWriteTime
    } -ArgumentList $FileType

    # Wait for the job to finish
    $job | Wait-Job
    $output = Receive-Job -Job $job

    # Display the output
    if ($output) {
        $output
        Write-Host "`nTotal number of $FileType files found: $($output.Count)" -ForegroundColor Green
    } else {
        Write-Host "No $FileType files found on $ComputerName." -ForegroundColor Yellow
    }

    # Remove the completed job
    Remove-Job -Job $job
} else {
    Write-Host "Connection test result is $False." -ForegroundColor DarkRed
}
#End