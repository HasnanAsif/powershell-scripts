# The script prompts an administrator for a target computer name and credentials, retrieves a list of stopped services on the specified remote computer, displays them in a table, and saves the results to a text file.

#Begin
# Prompt the administrator to enter the name of the target computer
$computerName = Read-Host "Enter the name of the computer to manage"

# Prompt the administrator for credentials
$credentials = Get-Credential

# Fetch stopped services on the remote computer
try {
    $stoppedServices = Invoke-Command -ComputerName $computerName -Credential $credentials -ScriptBlock {
        Get-Service | Where-Object { $_.Status -eq "Stopped" } | Select-Object Name, DisplayName, Status, CanStop
    }

    if ($stoppedServices) {
        # Display the stopped services
        $stoppedServices | Format-Table -AutoSize

        # Save the information to a text file
        $outputPath = "C:\pswork\servicestopped.txt"
        $stoppedServices | Out-File -FilePath $outputPath -Encoding UTF8

        Write-Host "Stopped services information saved to: $outputPath"
    } else {
        Write-Host "No stopped services found on $computerName."
    }
} catch {
    Write-Host "An error occurred while fetching services. Please check the computer name or credentials."
    Write-Host "Error: $($_.Exception.Message)"
}
#End
