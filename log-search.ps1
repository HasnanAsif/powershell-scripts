# The function Get-LogFile is designed to search for a given keyword within .log files in the C:\Windows\logs directory and its subdirectories.

#Begin
function Get-LogFile {
    [CmdletBinding()]
    Param (
        [Parameter(ValueFromPipeline)]
        [string]$Keyword
    )

    Process {
        # Define the base directory to search
        $Directory = "C:\Windows\logs"

        # Search for log files (*.log) recursively
        $Files = Get-ChildItem -Path $Directory -Recurse -Include *.log -ErrorAction SilentlyContinue

        if ($Files) {
            # Search for the keyword in the discovered log files
            $Results = $Files | Select-String -Pattern $Keyword -ErrorAction SilentlyContinue | Group-Object Filename

            if ($Results) {
                Write-Host "`nFiles containing '$Keyword':" -ForegroundColor Green
                $Results | ForEach-Object {
                    Write-Host "$($_.Name): $($_.Count) occurrences"
                }
            } else {
                Write-Host "No files contain the keyword '$Keyword'." -ForegroundColor Yellow
            }
        } else {
            Write-Host "No log files found in $Directory or its subdirectories." -ForegroundColor Red
        }
    }
}
#End
