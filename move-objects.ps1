Import-Module ActiveDirectory
$TargetOU = "DistinguishedName"
$Computers = Get-Content -Path C:\Scripts\objects.txt

foreach ($Computer in $Computers)
{
	$TargetComputer = Get-ADComputer $Computer 
    Disable-ADAccount $TargetComputer
	Move-ADObject $TargetComputer -TargetPath $TargetOU
}
