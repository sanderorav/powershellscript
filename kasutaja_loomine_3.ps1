# See skript loob uue kasutaja ees- ja perenime põhjal

# Küsime eesnime, kuni sisend on sobiv
do {
    $eesnimialgne = Read-Host "Sisesta eesnimi"
    if ($eesnimialgne -notmatch '^[A-Za-zÕÄÖÜõäöü]+$') {
        Write-Host "Viga: eesnimi võib sisaldada ainult ladina tähti." -ForegroundColor Red
    }
} while ($eesnimialgne -notmatch '^[A-Za-zÕÄÖÜõäöü]+$')

# Küsime perenime, kuni sisend on sobiv
do {
    $perenimialgne = Read-Host "Sisesta perenimi"
    if ($perenimialgne -notmatch '^[A-Za-zÕÄÖÜõäöü]+$') {
        Write-Host "Viga: perenimi võib sisaldada ainult ladina tähti." -ForegroundColor Red
    }
} while ($perenimialgne -notmatch '^[A-Za-zÕÄÖÜõäöü]+$')

$parool = 'Parool1!'

# Teeme ees- ja perenime esitähed suureks
$eesnimi = $eesnimialgne.Substring(0,1).ToUpper() + $eesnimialgne.Substring(1).ToLower()
$perenimi = $perenimialgne.Substring(0,1).ToUpper() + $perenimialgne.Substring(1).ToLower()

# Teeme kasutajanime kujul eesnimi.perenimi ning eemaldame täpitähed
$kasutajanimi = "$eesnimi.$perenimi".ToLower()
$kasutajanimi = $kasutajanimi `
    -replace 'õ','o' `
    -replace 'ä','a' `
    -replace 'ö','o' `
    -replace 'ü','u'

# Loome kirjelduse
$kirjeldus = "$eesnimi $perenimi kasutaja"

# Küsime kinnitust
$otsus = Read-Host "Kas loon kasutaja? Nimi: $eesnimi $perenimi, kasutajanimi: $kasutajanimi, Parool: Parool1! (ENTER - jah, n - ei)"

if ($otsus -eq 'n' -or $otsus -eq 'N') {
    Write-Host "Kasutajat ei loodud."
}
else {

    # Kontrollime, kas kasutaja juba eksisteerib
    if (Get-LocalUser -Name $kasutajanimi -ErrorAction SilentlyContinue) {
        Write-Host "Viga: kasutaja '$kasutajanimi' on juba olemas." -ForegroundColor Red
    }
    else {
        try {
            New-LocalUser $kasutajanimi `
                -Password (ConvertTo-SecureString $parool -AsPlainText -Force) `
                -FullName "$eesnimi $perenimi" `
                -Description "$kirjeldus" `
                -ErrorAction Stop

            Write-Host "Kasutaja '$kasutajanimi' edukalt loodud." -ForegroundColor Green
        }
        catch {
            # Näitame päris veateadet (näiteks õiguste puudumine vms)
            Write-Host "Viga kasutaja loomisel: $($_.Exception.Message)" -ForegroundColor Red
        }
    }
}