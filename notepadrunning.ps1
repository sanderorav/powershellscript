while (Get-Process -Name notepad -ErrorAction SilentlyContinue) {
	Write-Host 'Notepad is running...'
	Start-Sleep -Seconds 1
}

Write-Host 'All Notepad instances are closed. Loop ended.'
