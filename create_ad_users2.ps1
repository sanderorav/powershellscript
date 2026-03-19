# Laeme failist kasutajanimed
$file = "C:\Users\Administrator\Scripts\adusers.csv"
$users = Import-Csv $file -Encoding UTF8 -Delimiter ";"

# Asendame täpitähed tavatähtedega
function Translit {
    param(
        [string]$inputString
    )

    $Translit = @{
        [char]'ä' = "a"
        [char]'õ' = "o"
        [char]'ö' = "o"
        [char]'ü' = "u"
    }

    $outputString = ""
    foreach ($character in $inputString.ToCharArray()) {
        if ($Translit[$character] -cne $null) {
            $outputString += $Translit[$character]
        }
        else {
            $outputString += $character
        }
    }

    return $outputString
}

# Käime läbi nimed ja loome kasutajad
foreach ($user in $users) {
    $username = ($user.FirstName + "." + $user.LastName).ToLower()
    $username = Translit $username

    $upname = $username + "@orav.script"
    $displayname = $user.FirstName + " " + $user.LastName

    # Vaatame, kas kasutaja juba eksisteerib
    $existingUser = Get-ADUser -Filter "SamAccountName -eq '$username' -or UserPrincipalName -eq '$upname'" -ErrorAction SilentlyContinue

    if ($existingUser) {
        Write-Host "Kasutaja $username on juba olemas." -ForegroundColor Yellow
    }
    else {
        New-ADUser `
            -Name $username `
            -SamAccountName $username `
            -DisplayName $displayname `
            -GivenName $user.FirstName `
            -Surname $user.LastName `
            -Department $user.Department `
            -Title $user.Role `
            -UserPrincipalName $upname `
            -AccountPassword (ConvertTo-SecureString $user.Password -AsPlainText -Force) `
            -Enabled $true

        Write-Host "Edukalt loodud kasutaja $username ($displayname)." -ForegroundColor Green
    }
}