# The function Get-LogFile is designed to search for a given keyword within .log files in the C:\Windows\logs directory and its subdirectories.


function Get-LogFile { 
    [CmdletBinding()]
    Param (
        [Parameter(ValueFromPipeline)]
        [string]$Keyword # Keyword to search in log files
    )

    Process {
        $Directory = "C:\Windows\logs" # Define the base directory to search
        $Files = Get-ChildItem -Path $Directory -Recurse -Include *.log -ErrorAction SilentlyContinue # Search for log files (*.log) recursively

        if ($Files) {
            # Search for the keyword in the discovered log files
            $Results = $Files | Select-String -Pattern $Keyword -ErrorAction SilentlyContinue | Group-Object Filename 

            if ($Results) {
                Write-Host "`nFiles containing '$Keyword':" -ForegroundColor Green # Notify about found files
                $Results | ForEach-Object {
                    Write-Host "$($_.Name): $($_.Count) occurrences" # Display file name and the number of occurrences of the keyword
                }
            } else {
                Write-Host "No files contain the keyword '$Keyword'." -ForegroundColor Yellow # Inform if no matches are found
            }
        } else {
            Write-Host "No log files found in $Directory or its subdirectories." -ForegroundColor Red # Inform if no log files are found
        }
    }
}

