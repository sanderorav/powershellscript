# Küsime kasutajalt ees- ja perenime
$eesnimi = Read-Host "Sisesta eesnimi"
$perenimi = Read-Host "Sisesta perenimi"

# Teeme väiketähtedeks ja kasutajanimeks
$eesnimi = $eesnimi.ToLower()
$perenimi = $perenimi.ToLower()
$kasutajanimi = "$eesnimi.$perenimi"

# Küsime kasutajalt kinnitust
$jahei = Read-Host "Kas kustutan kasutaja '$kasutajanimi'? Kinnitamiseks sisesta 'jah', tühistamiseks vajuta ENTER"
$jahei = $jahei.ToLower()

if ($jahei -eq 'jah') {
try {
# Kontrollime, kas kasutaja on olemas
$kasutaja = Get-LocalUser -Name $kasutajanimi -ErrorAction Stop

# Kustutame kasutaja
Remove-LocalUser -Name $kasutajanimi
Write-Host "Kasutaja '$kasutajanimi' on edukalt kustutatud." -ForegroundColor Green
} catch {
Write-Host "Viga: Kasutajat '$kasutajanimi' ei leitud või pole võimalik seda kustutada." -ForegroundColor Red
}
} else {
Write-Host "Kustutamine tühistatud."
}