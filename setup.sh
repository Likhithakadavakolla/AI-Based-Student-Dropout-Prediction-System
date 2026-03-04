#!/bin/bash

echo "==============================================="
echo "Student Dropout Prediction System - Setup"
echo "==============================================="
echo ""

echo "[1/4] Checking Python installation..."
if ! command -v python3 &> /dev/null; then
    echo "ERROR: Python 3 is not installed"
    echo "Please install Python 3.8+ from https://www.python.org/"
    exit 1
fi
python3 --version
echo ""

echo "[2/4] Creating Python virtual environment..."
if [ ! -d ".venv" ]; then
    python3 -m venv .venv
    echo "Virtual environment created successfully"
else
    echo "Virtual environment already exists"
fi
echo ""

echo "[3/4] Installing Python dependencies..."
.venv/bin/python -m pip install --upgrade pip
.venv/bin/python -m pip install -r backend/requirements.txt
echo ""

echo "[4/4] Installing Node.js dependencies..."
npm install
echo ""

echo "==============================================="
echo "Setup completed successfully!"
echo "==============================================="
echo ""
echo "To start the application, run:"
echo "  npm start"
echo ""
echo "Or use the provided start scripts:"
echo "  ./start.sh (Linux/Mac) or start.bat (Windows)"
echo ""
