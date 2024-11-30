# The function Get-LogFile is designed to search for a given keyword within .log files in the C:\Windows\logs directory and its subdirectories.


function Get-LogFile { # Function to search for a keyword in log files.
    [CmdletBinding()]
    Param (
        [Parameter(ValueFromPipeline)]
        [string]$Keyword
    )

    Process {
        $Directory = "C:\Windows\logs" # Define the base directory to search

        $Files = Get-ChildItem -Path $Directory -Recurse -Include *.log -ErrorAction SilentlyContinue # Search for log files (*.log) recursively

        if ($Files) {
            $Results = $Files | Select-String -Pattern $Keyword -ErrorAction SilentlyContinue | Group-Object Filename # Search for the keyword in the discovered log files

            if ($Results) {
                Write-Host "`nFiles containing '$Keyword':" -ForegroundColor Green # Notify user that files with the keyword are found
                $Results | ForEach-Object {
                    Write-Host "$($_.Name): $($_.Count) occurrences" # Display file name and the number of occurrences of the keyword
                }
            } else {
                Write-Host "No files contain the keyword '$Keyword'." -ForegroundColor Yellow # Inform the user that no files have the keyword
            }
        } else {
            Write-Host "No log files found in $Directory or its subdirectories." -ForegroundColor Red # Inform the user that no log files were found
        }
    }
}

