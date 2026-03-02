# Fail, kus on kasutajate andmed
$fail = "C:\Users\Sander\powershellscript\kasutajad.csv"

# Loeme faili sisu
$kasutajad = Import-Csv $fail -Encoding Default -Delimiter ";"

# Salvestame iga rea $kasutaja muutujasse
foreach ($kasutaja in $kasutajad) {
$kasutajanimi = $kasutaja.kasutajanimi
$taisnimi = $kasutaja.taisnimi
$kontokirjeldus = $kasutaja.kontokirjeldus
$parool = $kasutaja.parool | ConvertTo-SecureString -AsPlainText -Force
# Teeme antud teabe põhjal kasutaja
New-LocalUser -Name $kasutajanimi -Password $parool -FullName "$taisnimi" -Description "$kasutajakirjeldus"
}