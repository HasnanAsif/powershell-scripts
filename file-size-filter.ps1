# This script searches for files smaller than a given size in a specified directory.


function Get-SmallFiles {
  Param (
    [parameter(position=0, mandatory=$true)] # Directory to search 
    [string]$dir,
    [parameter(position=1, mandatory=$false)] # File size threshold in bytes (default is 100 bytes)
    [int]$Size=100
  )

  # Get files smaller than the given size, excluding folders
  Get-ChildItem $dir | Where-Object { 
    $_.Length -lt $Size -and !$_.PSIsContainer
  }
}

$more="yes"

# Loop to allow repeated searches
do {
  $folder=read-host "Enter the directory name" 
  $lenght=read-host "Enter file size in bytes to list smaller files"
  Get-SmallFiles -dir $folder -size $lenght 
  $more=read-host "Press Y for more, N to stop" 
} until ($more -eq "n")

