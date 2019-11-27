Import-Module ActiveDirectory
$TargetOU = "OU=OLD,DC=contso,DC=com"
$Computers = Get-Content -Path C:\Scripts\oldcomputers.txt

foreach ($Computer in $Computers)
{
	$TargetComputer = Get-ADComputer $Computer 
    Disable-ADAccount $TargetComputer
	Move-ADObject $TargetComputer -TargetPath $TargetOU
}