if($args.Count -ne 3){
# Teavitame kasutajat, kui sisestatakse vale arv argumente
echo 'Viga! Skripti käivitamiseks sisesta: .\skriptinimi kasutajanimi "Eesnimi Perenimi" "Konto kirjeldus"'
} else {
$kasutajanimi = $args[0]
$taisnimi = $args[1]
$kontokirjeldus = $args[2]
$parool = ConvertTo-SecureString "Parool1!" -AsPlainText -Force
# Loome kasutaja sisestatud parameetritest lähtuvalt
New-LocalUser "$kasutajanimi" -Password $parool -FullName "$taisnimi" -Description "$kontokirjeldus"
}