# Setup Guide - Student Dropout Prediction System

## 🚀 Quick Start

### First Time Setup (Windows)

1. **Run the automated setup script:**
   ```bash
   setup.bat
   ```
   
   This will:
   - Check Python installation
   - Create virtual environment (.venv)
   - Install Python dependencies
   - Install Node.js dependencies (root + frontend)

### First Time Setup (Linux/Mac)

1. **Make the setup script executable and run it:**
   ```bash
   chmod +x setup.sh
   ./setup.sh
   ```

## 📦 What Gets Installed

### Automatically Installed
When you run `npm install` in the root directory, the following happens automatically:

1. **Root dependencies**: `concurrently` package
2. **Frontend dependencies**: React and all frontend packages (via postinstall hook)
3. **Python virtual environment**: `.venv` folder (if using setup script)
4. **Backend dependencies**: FastAPI, uvicorn, and other Python packages (if using setup script)

### Manual Installation (If Needed)

If you prefer manual setup:

1. **Install root npm dependencies:**
   ```bash
   npm install
   ```

2. **Create Python virtual environment:**
   ```bash
   python -m venv .venv
   ```

3. **Activate virtual environment:**
   - Windows: `.venv\Scripts\activate`
   - Linux/Mac: `source .venv/bin/activate`

4. **Install Python dependencies:**
   ```bash
   pip install -r backend/requirements.txt
   ```

5. **Install frontend dependencies** (if not already done by postinstall):
   ```bash
   cd frontend-react
   npm install
   ```

## ▶️ Running the Application

### Start Both Backend and Frontend (Recommended)

```bash
npm start
```

This single command starts:
- **Backend** (FastAPI): http://localhost:8000
- **Frontend** (React): http://localhost:3000

### Start Individually

**Backend only:**
```bash
npm run backend
```

**Frontend only:**
```bash
npm run frontend
```

## 🔧 VS Code Configuration

The project includes VS Code settings in `.vscode/` folder that:
- ✅ Automatically detects Python virtual environment
- ✅ Configures Python path to `.venv`
- ✅ Sets up debugging for FastAPI backend
- ✅ Recommends useful extensions
- ✅ Excludes unnecessary folders from search

**These settings are tracked in Git**, so they work automatically when you clone the repository.

## 📁 What's In Version Control

### ✅ Tracked (Committed to Git)
- Source code (backend/, frontend-react/)
- Package configuration (package.json, requirements.txt)
- VS Code settings (.vscode/)
- Documentation (README.md, SETUP.md)
- Setup scripts (setup.bat, setup.sh)

### ❌ Not Tracked (In .gitignore)
- Dependencies (node_modules/, .venv/)
- Build outputs (frontend-react/build/)
- Cache files (__pycache__/, *.pyc)
- Environment variables (.env)
- Database files (*.db)

## 🛠️ Troubleshooting

### VS Code Keeps Asking to Install Dependencies

**Solution:** The dependencies are already installed. VS Code might be confused. Try:
1. Close VS Code completely
2. Verify installations exist:
   ```bash
   # Check if folders exist
   dir node_modules       # Should exist
   dir .venv              # Should exist
   dir frontend-react\node_modules  # Should exist
   ```
3. Reopen VS Code - it should detect everything correctly now

### Port Already in Use

**Solution:** Stop the process using the port:

```powershell
# Stop port 3000 (Frontend)
$process = Get-NetTCPConnection -LocalPort 3000 -ErrorAction SilentlyContinue | Select-Object -ExpandProperty OwningProcess -Unique
if ($process) { Stop-Process -Id $process -Force }

# Stop port 8000 (Backend)
$process = Get-NetTCPConnection -LocalPort 8000 -ErrorAction SilentlyContinue | Select-Object -ExpandProperty OwningProcess -Unique
if ($process) { Stop-Process -Id $process -Force }
```

### Backend Crashes with Unicode Errors

**Already Fixed:** The backend now uses ASCII-safe logging instead of Unicode emojis to prevent Windows console encoding errors.

### Python Module Not Found

**Solution:** Make sure virtual environment is activated and dependencies are installed:
```bash
.venv\Scripts\activate
pip install -r backend/requirements.txt
```

## 🔄 Updating Dependencies

### Update Python packages:
```bash
.venv\Scripts\activate
pip install --upgrade -r backend/requirements.txt
```

### Update Node packages:
```bash
npm update
cd frontend-react
npm update
```

## 📊 Project Commands Reference

| Command | Description |
|---------|-------------|
| `npm start` | Start both backend and frontend |
| `npm run backend` | Start FastAPI backend only |
| `npm run frontend` | Start React frontend only |
| `npm install` | Install all dependencies |
| `npm run setup` | Full setup (venv + dependencies) |
| `setup.bat` | Windows setup script |
| `./setup.sh` | Linux/Mac setup script |

## 💡 Tips

1. **First time?** Use `setup.bat` (Windows) or `./setup.sh` (Linux/Mac)
2. **Daily use?** Just run `npm start`
3. **After git pull?** Run `npm install` to update dependencies
4. **VS Code prompting?** Everything is already installed, just ignore and continue

## 📞 Need Help?

Check the documentation in `docs/` folder or refer to:
- Frontend README: `frontend-react/README.md`
- Backend API docs: http://localhost:8000/docs (when backend is running)
- Full stack README: `README_FULLSTACK.md`
