$counter = 0
while (Get-Process -Name notepad -ErrorAction SilentlyContinue) {
	Write-Host 'Notepad is running...'
	Start-Sleep -Seconds 1
	$counter++
}

Write-Host "$counter"
