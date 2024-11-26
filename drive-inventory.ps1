# This script provides a list of all files and folder on a drive, showing the item name, creation time, and whether its a file or folder.

#Begin
[int] $i=1
cd c:\
Foreach ($file in Get-Childitem C:\)
 {
write-host File/Folder#: $i  -ForegroundColor  DarkGreen
write-host File/Folder Name: $file.name 
write-host Creation time: $file.CreationTime
if ((Get-Item -Path $file).PSIsContainer) {$file.name +" is a folder."}
else {$file.name +" is a file."}
" "
$i++
}
write-host Total item number: $($i-1)
#End
