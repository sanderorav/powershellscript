Get-Process |
    where { $_.ProcessName -eq 'notepad' } |
    Select-Object ProcessName, Id
