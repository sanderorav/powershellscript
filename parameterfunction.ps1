function countservice {

    param (
        [ValidateSet("Running","Stopped")]
        [string]$Status
    )

    $count = (Get-Service | Where-Object {
        $_.Status -eq $Status
    }).Count

    Write-Host "Total services in $Status state: $count" -ForegroundColor Cyan
}

countservice -Status Running
countservice -Status Stopped
