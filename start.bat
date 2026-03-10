@echo off
cd /d "%~dp0"
cls
echo ========================================
echo   AI Fake Job Detector - Starting...
echo ========================================
echo.

echo [1/4] Checking Python...
python --version
if errorlevel 1 (
    echo ERROR: Python not found!
    echo Please install Python from python.org
    pause
    exit
)

echo.
echo [2/4] Cleaning old database...
if exist instance\job_detector.db (
    del /f /q instance\job_detector.db
    echo Database cleaned!
) else (
    echo No old database found.
)

echo.
echo [3/4] Installing dependencies...
pip install Flask Flask-SQLAlchemy scikit-learn python-whois reportlab --quiet

echo.
echo [4/4] Starting application...
echo.
echo ========================================
echo   Server starting at http://localhost:5000
echo   Press Ctrl+C to stop
echo ========================================
echo.

python app.py

pause
