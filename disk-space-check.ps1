# The script retrieves the total and free space of the C: drive, analyzes the free space, and provides feedback based on the available disk space, such as whether it's too low, normal, or shareable.

#Begin
Function Get-Testresult {
            [CmdletBinding()]
            Param(
             [Parameter(ValueFromPipeline)]
             $item  )
            Write-Host "You passed the free space size $item GB into the free space analysis function."
            if ($item -le 100) {write-host "Free Space is too limited! Please act upon instantly." –foreground Red} 
            elseif ($item -ge 5000) {write-host "The disk space can be shared with more others." –foreground green}
            else  {"Normal free space."}
         }
$disk = Get-WmiObject Win32_LogicalDisk -Filter "DeviceID='C:'" |Select-Object Size, FreeSpace
$tdisk=$disk.Size/1gb
"Total C: drive space is $tdisk GB" 
$fdisk=$disk.FreeSpace/1gb
Get-Testresult -item $fdisk 
#End
