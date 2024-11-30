# This script searches for files smaller than a given size in a specified directory.

#Begin
function Get-SmallFiles {
  Param (
    # Directory to search in (mandatory)
    [parameter(position=0, mandatory=$true)]
    [string]$dir,

    # File size threshold in bytes (default is 100 bytes)
    [parameter(position=1, mandatory=$false)]
    [int]$Size=100
  )

  # Get files smaller than the specified size and not folders
  Get-ChildItem $dir | Where-Object {
    $_.Length -lt $Size -and !$_.PSIsContainer
  }
}

$more="yes"

do {
  # Prompt user for directory and size
  $folder=read-host "Enter the directory name"
  $lenght=read-host "Enter file size in bytes to list smaller files"

  # List files smaller than the given size
  Get-SmallFiles -dir $folder -size $lenght  

  # Ask if the user wants to check another directory
  $more=read-host "Press Y for more, N to stop" 
} until ($more -eq "n")

#End
