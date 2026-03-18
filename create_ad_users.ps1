#New-ADUser adkasutaja1

#New-ADUser -Name "adkasutaja2" -GivenName "AD" -Surname "Kasutaja 2" -SamAccountName "adkasutaja2" -UserPrincipalName "adkasutaja2@sv-kool.local" -AccountPassword(Read-Host -AsSecureString "Input Password") -Enabled $true

$file = "C:\Users\Administrator\Scripts\adusers.csv"
$users = Import-Csv $file -Encoding UTF8 -Delimiter ";"

foreach ($user in $users){
$username = $user.FirstName + "." + $user.LastName
$username = $username.ToLower()
$username = Translit($username)
$upname = $username + "@orav.script"
$displayname = $user.FirstName + " " + $user.LastName
echo $upname
echo $displayname
New-ADUser -Name $username `-DisplayName $displayname `-GivenName $user.FirstName `-Surname $user.LastName `-Department $user.Department `
-Title $user.Role `
-UserPrincipalName $upname `-AccountPassword (ConvertTo-SecureString $user.Password -AsPlainText -Force) -Enabled $true
}

function Translit {
param(
[string] $inputString
)
$Translit = @{
[char]'ä' = "a"
[char]'õ' = "o"
[char]'ö' = "o"
[char]'ü' = "u"
}
$outputString=""
foreach ($character in $inputCharacter = $inputString.ToCharArray()){
if ($Translit[$character] -cne $Null){
$outputString += $Translit[$character]
} else {
$outputString += $character
}
}
Write-Output $outputString
}