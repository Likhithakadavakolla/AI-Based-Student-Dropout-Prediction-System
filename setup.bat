@echo off
echo ===============================================
echo Student Dropout Prediction System - Setup
echo ===============================================
echo.

echo [1/4] Checking Python installation...
python --version
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Python is not installed or not in PATH
    echo Please install Python 3.8+ from https://www.python.org/
    pause
    exit /b 1
)
echo.

echo [2/4] Creating Python virtual environment...
if not exist ".venv" (
    python -m venv .venv
    echo Virtual environment created successfully
) else (
    echo Virtual environment already exists
)
echo.

echo [3/4] Installing Python dependencies...
.venv\Scripts\python.exe -m pip install --upgrade pip
.venv\Scripts\python.exe -m pip install -r backend\requirements.txt
echo.

echo [4/4] Installing Node.js dependencies...
call npm install
echo.

echo ===============================================
echo Setup completed successfully!
echo ===============================================
echo.
echo To start the application, run:
echo   npm start
echo.
echo Or use the provided start scripts:
echo   start.bat (Windows) or start.sh (Linux/Mac)
echo.
pause
