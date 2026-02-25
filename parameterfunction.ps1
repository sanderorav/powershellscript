function Get-ServiceCount {

    param (
        [ValidateSet("Running","Stopped")]
        [string]$Status
    )

    $count = (Get-Service | Where-Object {
        $_.Status -eq $Status
    }).Count

    Write-Host "Total services in $Status state: $count" -ForegroundColor Cyan
}

Get-ServiceCount -Status Running
Get-ServiceCount -Status Stopped
