# The script prompts an administrator for a target computer name and credentials, retrieves a list of stopped services on the specified remote computer, displays them in a table, and saves the results to a text file.


$computerName = Read-Host "Enter the name of the computer to manage" # Prompt the administrator to enter the name of the target computer
$credentials = Get-Credential # Prompt the administrator for credentials

# Fetch stopped services on the remote computer
try {
    $stoppedServices = Invoke-Command -ComputerName $computerName -Credential $credentials -ScriptBlock {
        Get-Service | Where-Object { $_.Status -eq "Stopped" } | Select-Object Name, DisplayName, Status, CanStop
    }

    if ($stoppedServices) {
        $stoppedServices | Format-Table -AutoSize # Display the stopped services

        $outputPath = "C:\pswork\servicestopped.txt" # Save the information to a text file
        $stoppedServices | Out-File -FilePath $outputPath -Encoding UTF8

        Write-Host "Stopped services information saved to: $outputPath" # Notify that the data was saved successfully

    } else {
        Write-Host "No stopped services found on $computerName." # Inform the user if no stopped services were found
    }
} catch {
    Write-Host "An error occurred while fetching services. Please check the computer name or credentials." # Handle errors if the command fails
    Write-Host "Error: $($_.Exception.Message)" # Display the specific error message
}


