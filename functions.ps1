function countstart {

    $runningServices = Get-Service | Where-Object {
        $_.Status -eq "Running"
    }

    $count = $runningServices.Count
    Write-Host "Total Running Services: $count" -ForegroundColor Green
}

function countstop {

    $stoppedServices = Get-Service | Where-Object {
        $_.Status -eq "Stopped"
    }

    $count = $stoppedServices.Count
    Write-Host "Total Stopped Services: $count" -ForegroundColor Yellow
}

countstart
countstop
