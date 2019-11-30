Import-Module ActiveDirectory
$TargetOU = "DistinguishedName"
$Computer = Get-Content -Path "Path to .txt file"

foreach ($Computer in $Computers)
{
	$TargetComputer = Get-ADComputer $Computer 
    Disable-ADAccount $TargetComputer
	Move-ADObject $TargetComputer -TargetPath $TargetOU
}
