# MediaMarkHub - Django Server Startup Script
Write-Host "============================================" -ForegroundColor Cyan
Write-Host " MediaMarkHub Django Server Setup" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# Check if Python is installed
try {
    $pythonVersion = python --version 2>&1
    Write-Host "Python is installed: $pythonVersion" -ForegroundColor Green
} catch {
    Write-Host "Python is not installed or not in PATH!" -ForegroundColor Red
    Write-Host "Please install Python from: https://www.python.org/downloads/" -ForegroundColor Yellow
    Write-Host "Make sure to check 'Add Python to PATH' during installation." -ForegroundColor Yellow
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host ""

# Check if Django is installed
try {
    python -c "import django" 2>&1 | Out-Null
    if ($LASTEXITCODE -ne 0) {
        throw
    }
    Write-Host "Django is installed!" -ForegroundColor Green
} catch {
    Write-Host "Installing Django..." -ForegroundColor Yellow
    pip install django
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Failed to install Django!" -ForegroundColor Red
        Read-Host "Press Enter to exit"
        exit 1
    }
}

Write-Host ""

# Run migrations
Write-Host "Running database migrations..." -ForegroundColor Yellow
python manage.py migrate
Write-Host ""

# Start the server
Write-Host "============================================" -ForegroundColor Cyan
Write-Host " Starting Django Development Server" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Server will be available at: http://127.0.0.1:8000/" -ForegroundColor Green
Write-Host "Press Ctrl+C to stop the server" -ForegroundColor Yellow
Write-Host ""

python manage.py runserver

