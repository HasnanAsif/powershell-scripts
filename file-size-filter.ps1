# This script is designed to search for file sizes in a specified directory, where users can enter the directory name and file size threshold.

#Begin
function Get-SmallFiles {
  Param (
  [parameter(position=0, mandatory=$true)]
  [string]$dir,
  [parameter(position=1, mandatory=$false)]
  [int]$Size=100)
  Get-ChildItem $dir | Where-Object {
    $_.Length -lt $Size -and !$_.PSIsContainer
  }
}
$more="yes"
do
{
$folder=read-host "Key in the directory name"
$lenght=read-host "Key in the file size in Byte, then all smaller file(s) will be listed"
Get-SmallFiles -dir $folder -size $lenght  
$more=read-host "Press Y(es) to check more, or N(n) to stop the checking" 
}
until ($more -eq "n")
#End
