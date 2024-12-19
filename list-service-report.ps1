# The script prompts an administrator for a target computer name and credentials, retrieves a list of stopped services on the specified remote computer, displays them in a table, and saves the results to a text file.


$computerName = Read-Host "Enter the name of the computer to manage" # Ask for the target computer name
$credentials = Get-Credential # Ask for administrator credentials

# Fetch stopped services on the remote computer
try {
    $stoppedServices = Invoke-Command -ComputerName $computerName -Credential $credentials -ScriptBlock {
        Get-Service | Where-Object { $_.Status -eq "Stopped" } | Select-Object Name, DisplayName, Status, CanStop
    }

    if ($stoppedServices) {
        $stoppedServices | Format-Table -AutoSize # Display the stopped services
        $outputPath = "C:\pswork\servicestopped.txt" 
        $stoppedServices | Out-File -FilePath $outputPath -Encoding UTF8 # Save results to a file
        Write-Host "Stopped services information saved to: $outputPath" 

    } else {
        Write-Host "No stopped services found on $computerName." # Inform if no services are stopped
    }
} catch {
    Write-Host "An error occurred while fetching services. Please check the computer name or credentials." # Handle errors
    Write-Host "Error: $($_.Exception.Message)" # Show detailed error
}


