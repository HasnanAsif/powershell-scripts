# This script searches for files smaller than a given size in a specified directory.


function Get-SmallFiles {
  Param (
    [parameter(position=0, mandatory=$true)] # Directory to search in (mandatory)
    [string]$dir,

    [parameter(position=1, mandatory=$false)] # File size threshold in bytes (default is 100 bytes)
    [int]$Size=100
  )

  Get-ChildItem $dir | Where-Object { # Get files smaller than the specified size and not folders
    $_.Length -lt $Size -and !$_.PSIsContainer
  }
}

$more="yes"

do {
  $folder=read-host "Enter the directory name" # Prompt user for directory and size
  $lenght=read-host "Enter file size in bytes to list smaller files"

  Get-SmallFiles -dir $folder -size $lenght # List files smaller than the given size 

  $more=read-host "Press Y for more, N to stop" # Ask if the user wants to check another directory
} until ($more -eq "n")

