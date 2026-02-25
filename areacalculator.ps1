function Show-MainMenu {

    Clear-Host
    Write-Host "Area Calculator" -ForegroundColor Green
    Write-Host "Main Menu" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "1: Area of Square" -ForegroundColor Yellow
    Write-Host "2: Area of Rectangle" -ForegroundColor Yellow
    Write-Host "3: Area of Circle" -ForegroundColor Yellow
    Write-Host "4: Area of Triangle" -ForegroundColor Yellow
    Write-Host "5: Exit" -ForegroundColor Yellow
    Write-Host ""

    $choice = Read-Host "Enter your choice"

    switch ($choice) {
        "1" { Area-Square }
        "2" { Area-Rectangle }
        "3" { Area-Circle }
        "4" { Area-Triangle }
        "5" { exit }
        default {
            Write-Host "Invalid choice! Try again." -ForegroundColor Red
            Start-Sleep 2
            Show-MainMenu
        }
    }
}

function Area-Square {
    Clear-Host
    Write-Host "Area of Square" -ForegroundColor Green
    $side = [double](Read-Host "Enter the side of the square")
    $area = $side * $side

    Write-Host "Area of the square: $area" -ForegroundColor Cyan
    Show-PostMenu
}

function Area-Rectangle {
    Clear-Host
    Write-Host "Area of Rectangle" -ForegroundColor Green
    $length = [double](Read-Host "Enter the length")
    $width  = [double](Read-Host "Enter the width")
    $area = $length * $width

    Write-Host "Area of the rectangle: $area" -ForegroundColor Cyan
    Show-PostMenu
}

function Area-Circle {
    Clear-Host
    Write-Host "Area of Circle" -ForegroundColor Green
    $radius = [double](Read-Host "Enter the radius")
    $area = [math]::PI * $radius * $radius

    Write-Host "Area of the circle: $([math]::Round($area,2))" -ForegroundColor Cyan
    Show-PostMenu
}

function Area-Triangle {
    Clear-Host
    Write-Host "Area of Triangle" -ForegroundColor Green
    $base   = [double](Read-Host "Enter the base")
    $height = [double](Read-Host "Enter the height")
    $area = 0.5 * $base * $height

    Write-Host "Area of the triangle: $area" -ForegroundColor Cyan
    Show-PostMenu
}

function Show-PostMenu {

    Write-Host ""
    Write-Host "Please select the next option" -ForegroundColor Yellow
    Write-Host "1: Return to Main Menu"
    Write-Host "2: Exit"

    $next = Read-Host "Enter your choice"

    switch ($next) {
        "1" { Show-MainMenu }
        "2" { exit }
        default {
            Write-Host "Invalid entry! Try again." -ForegroundColor Red
            Start-Sleep 2
            Show-PostMenu
        }
    }
}

Show-MainMenu
