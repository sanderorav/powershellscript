# Alustame väljundi salvestamist faili report.txt
Start-Transcript -Path ".\report.txt" -Force


# 1 punkt

Read-Host "`n1. punkt. Alustamiseks vajutage Enter"

$nimi1 = Read-Host 'Sisesta oma nimi'

try {
    $arv1 = [int](Read-Host 'Sisesta täisarv')
}

# Tahame, et kasutaja sisestaks positiivse täisarvu
catch {
    Write-Host "Viga: Palun sisesta täisarv!" -ForegroundColor Red
    Stop-Transcript
    return
}

if ($arv1 -lt 0) {
    Write-Host "Viga: Palun sisesta positiivne täisarv!" -ForegroundColor Red
    Stop-Transcript
    return
}

Write-Host ("Tere, $nimi1!`n" * $arv1)


# 2 punkt

Read-Host "2. punkt. Jätkamiseks vajutage Enter"

$nimi2 = Read-Host 'Sisesta oma nimi'

try {
    $arv2 = [int](Read-Host 'Sisesta täisarv')
}

# Tahame, et kasutaja sisestaks positiivse täisarvu
catch {
    Write-Host "Viga: Palun sisesta täisarv!" -ForegroundColor Red
    Stop-Transcript
    exit
}

if ($arv2 -lt 0) {
    Write-Host "Viga: Palun sisesta positiivne täisarv!" -ForegroundColor Red
    Stop-Transcript
    exit
}

for ($i = 1; $i -le $arv2; $i++) {
    Write-Host "Tere, $nimi2!"
}


# 3 punkt

Read-Host "`n3. punkt. Jätkamiseks vajutage Enter"

Write-Host "=== Süsteemiinfo ==="
Write-Host "Arvuti nimi: $env:COMPUTERNAME"
Write-Host "Kasutaja nimi: $env:USERNAME"
Write-Host "PowerShelli versioon: $($PSVersionTable.PSVersion)"


# 4 punkt

Read-Host "`n4. punkt. Jätkamiseks vajutage Enter"

Write-Host "`n=== 3 töötavat protsessi ==="
Get-Process |
    Where-Object { $_.Responding } | # Tahame, et protsess oleks töötav
    Select-Object -First 3 -Property Name, Id, CPU |
    Format-Table -AutoSize

Write-Host "`n=== 3 teenust koos olekuga ==="
Get-Service |
    Select-Object -First 3 -Property Name, Status |
    Format-Table -AutoSize


# 5 punkt

Read-Host "5. punkt. Jätkamiseks vajutage Enter"

$versioon = $PSVersionTable.PSVersion.Major

Write-Host "Sinu PowerShelli versioon: $($PSVersionTable.PSVersion)"

# Kontrollime, kas versioon on sobiv
if ($versioon -lt 5) {
    Write-Host "Hoiatus: PowerShelli versioon on alla 5!" -ForegroundColor Red
}
else {
    Write-Host "PowerShelli versioon on sobiv." -ForegroundColor Green
}


# 6 punkt

Read-Host "`n6. punkt. Skripti väljundi salvestamiseks faili report.txt vajutage Enter"

# Lõpetame väljundi salvestamise
Stop-Transcript


# 7 punkt

Write-Host "`n============================" -ForegroundColor Green
Write-Host "Script finished successfully" -ForegroundColor Green
Write-Host "============================" -ForegroundColor Green