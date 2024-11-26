# This script checks if a specific Windows service is installed on the computer and displays its status. 

#Begin
Function Get-Testresult
 {
            [CmdletBinding()]
            Param(
             [Parameter(ValueFromPipeline)]
             $item  )
            
            $Service = Get-Service -name $item -ErrorAction SilentlyContinue 
            If (-Not $Service) {$item + " is not installed on this computer."} 
            Else { $item + " is installed." 
            $item +"'s status is:" + $service.Status  }
}
$domore = "Yes"
Do {
$Name = read-host "Key in Service Name"
$name | get-testresult
$domore = Read-Host "Do you want to test one more service? If so, please key in `"Yes`".Or press any key to stop"
   }  
While ($domore -eq "Yes")
"Thanks, run it again if more services need to be analyzed." 
#End
