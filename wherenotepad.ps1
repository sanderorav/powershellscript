Get-Process |
    where { $_.ProcessName -eq 'notepad' } |
    Select-Object ProcessName, Id

$dest = "C:\Temp\Test"

$totalFiles = Get-ChildItem $dest -File | Measure-Object | Select-Object -ExpandProperty Count
"Total files in $dest : $totalFiles"

Get-ChildItem $dest -File |
    where { $_.Extension -eq ".csv" } |
    Select-Object Name,
        @{Name="Size(KB)"; Expression = { [math]::Round($_.Length / 1KB, 2) }},
        @{Name="Size(MB)"; Expression = { [math]::Round($_.Length / 1MB, 2) }}
