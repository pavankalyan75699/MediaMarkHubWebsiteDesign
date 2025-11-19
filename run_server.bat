@echo off
echo ============================================
echo  MediaMarkHub Django Server Setup
echo ============================================
echo.

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo Python is not installed or not in PATH!
    echo Please install Python from: https://www.python.org/downloads/
    echo Make sure to check "Add Python to PATH" during installation.
    echo.
    pause
    exit /b 1
)

echo Python is installed!
echo.

REM Check if Django is installed
python -c "import django" >nul 2>&1
if errorlevel 1 (
    echo Installing Django...
    pip install django
    if errorlevel 1 (
        echo Failed to install Django!
        pause
        exit /b 1
    )
)

echo Django is installed!
echo.

REM Run migrations
echo Running database migrations...
python manage.py migrate

echo.
echo ============================================
echo  Starting Django Development Server
echo ============================================
echo.
echo Server will be available at: http://127.0.0.1:8000/
echo Press Ctrl+C to stop the server
echo.

python manage.py runserver

