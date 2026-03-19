# Teeme täpitähed tavatähtedeks
function Translit {
    param(
        [string]$inputString
    )

    $Translit = @{
        [char]'ä' = "a"
        [char]'õ' = "o"
        [char]'ö' = "o"
        [char]'ü' = "u"
        [char]'Ä' = "A"
        [char]'Õ' = "O"
        [char]'Ö' = "O"
        [char]'Ü' = "U"
    }

    $outputString = ""
    foreach ($character in $inputString.ToCharArray()) {
        if ($Translit.ContainsKey($character)) {
            $outputString += $Translit[$character]
        }
        else {
            $outputString += $character
        }
    }

    return $outputString
}

# Küsime kasutaja ees- ja perekonnanime
$firstName = Read-Host "Sisesta eesnimi"
$lastName  = Read-Host "Sisesta perekonnanimi"

# Koostame kasutajanime kujul eesnimi.perenimi
$username = ($firstName + "." + $lastName).ToLower()
$username = Translit $username

# Otsi kasutaja Active Directoryst
$existingUser = Get-ADUser -Filter "SamAccountName -eq '$username'" -ErrorAction SilentlyContinue

# Vaatame, kas kasutaja on olemas
if ($existingUser) {
    Remove-ADUser -Identity $existingUser -Confirm:$false
    Write-Host "Kasutaja $username kustutati edukalt." -ForegroundColor Green
}
else {
    Write-Host "Viga: Kasutajat $username ei leitud." -ForegroundColor Red
}