# PowerShell script to start the Dropout Prediction System on Windows

Write-Host "Starting Dropout Prediction System..." -ForegroundColor Blue

# Kill any existing processes on ports 8000 and 3000
Write-Host "Cleaning up ports 8000 and 3000..." -ForegroundColor Green
Get-NetTCPConnection -LocalPort 8000 -ErrorAction SilentlyContinue | ForEach-Object { Stop-Process -Id $_.OwningProcess -Force -ErrorAction SilentlyContinue }
Get-NetTCPConnection -LocalPort 3000 -ErrorAction SilentlyContinue | ForEach-Object { Stop-Process -Id $_.OwningProcess -Force -ErrorAction SilentlyContinue }

# Start backend
Write-Host "Starting Backend on port 8000..." -ForegroundColor Green
Push-Location backend
if (Test-Path ".venv\Scripts\Activate.ps1") {
    & .\.venv\Scripts\Activate.ps1
} elseif (Test-Path ".venv-1\Scripts\Activate.ps1") {
    & .\.venv-1\Scripts\Activate.ps1
}
Start-Process powershell -ArgumentList "-NoExit -Command `"cd '$PWD'; uvicorn app:app --reload --host 0.0.0.0 --port 8000`""
Pop-Location

# Wait a bit for backend to start
Start-Sleep -Seconds 2

# Start frontend
Write-Host "Starting Frontend on port 3000..." -ForegroundColor Green
Push-Location frontend-react
Start-Process powershell -ArgumentList "-NoExit -Command `"cd '$PWD'; npm start`""
Pop-Location

Write-Host "Both servers are starting..." -ForegroundColor Blue
Write-Host "Backend: http://localhost:8000" -ForegroundColor Green
Write-Host "Frontend: http://localhost:3000" -ForegroundColor Green
Write-Host "Press Ctrl+C to stop both servers"
