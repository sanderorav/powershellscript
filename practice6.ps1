$students = Import-Csv ".\students.csv"

$result = @()

for ($i = 0; $i -lt $students.Count; $i++) {

    $name = $students[$i].Name
    $age  = [int]$students[$i].Age

    if ($age -ge 4 -and $age -le 10) {
        $school = "Junior"
    }
    elseif ($age -ge 11 -and $age -le 17) {
        $school = "Senior"
    }

    $obj = [PSCustomObject]@{
        Name   = $name
        School = $school
    }

    $result += $obj
}

$result | Format-Table -AutoSize

$answer = Read-Host "Do you want to export the table to CSV? (Y/N)"

if ($answer -eq "Y" -or $answer -eq "y") {

    $result | Export-Csv ".\students_school.csv" -NoTypeInformation
    Write-Host "File exported successfully!" -ForegroundColor Green

}
else {
    Write-Host "Export cancelled." -ForegroundColor Yellow
}
