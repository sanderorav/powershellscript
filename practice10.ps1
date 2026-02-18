$counter = 0

do {
    Write-Host "Notepad is running..."
    Start-Sleep -Seconds 1
    $counter++
}
until (-not (Get-Process -Name notepad -ErrorAction SilentlyContinue))

Write-Host "Loop ran $counter times."
