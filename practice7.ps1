$groups = @('Red', 'Green', 'Yellow', 'Blue')

$result = @()

for ($i = 1; $i -le 20; $i++) {
	$random = Get-Random -InputObject $groups
	$result += [PSCustomObject]@{
		RollNumber = $i
		Group = $random
	}
}

$result | Format-Table -AutoSize

$answer = Read-Host "Do you want to export the table to CSV? (Y/N)"

if ($answer -eq "Y" -or $answer -eq "y") {

    $result | Export-Csv ".\groups.csv" -NoTypeInformation
    Write-Host "File exported successfully!" -ForegroundColor Green

}
else {
    Write-Host "Export cancelled." -ForegroundColor Yellow
}
