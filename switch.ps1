$firstnumber = Read-Host "Please enter the first number: "
$secondnumber = Read-Host "Please enter the second number: "
Write-Host "Calculator" -ForegroundColor Green
Write-Host "1: Addition" -ForegroundColor Yellow
Write-Host "2: Subtraction" -ForegroundColor Yellow
Write-Host "3: Division" -ForegroundColor Yellow
Write-Host "4: Multiplication" -ForegroundColor Yellow
$choice = Read-Host "Enter your choice 1-4"
$firstnumber  = [double]$firstnumber
$secondnumber = [double]$secondnumber
switch ($choice) {
    "1" {
        $result = $firstnumber + $secondnumber
        Write-Host "Result: $result" -ForegroundColor Cyan
    }
    "2" {
        $result = $firstnumber - $secondnumber
        Write-Host "Result: $result" -ForegroundColor Cyan
    }
    "3" {
        if ($secondnumber -eq 0) {
            Write-Host "Error: Cannot divide by zero!" -ForegroundColor Red
        }
        else {
            $result = $firstnumber / $secondnumber
            Write-Host "Result: $result" -ForegroundColor Cyan
        }
    }
    "4" {
        $result = $firstnumber * $secondnumber
        Write-Host "Result: $result" -ForegroundColor Cyan
    }
    Default {
        Write-Host "Invalid choice! Please select between 1 and 4." -ForegroundColor Red
    }
}
