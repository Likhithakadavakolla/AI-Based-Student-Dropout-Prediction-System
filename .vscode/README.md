# VS Code Configuration

This folder contains VS Code workspace settings that are **tracked in Git** for consistent development experience.

## Files

### `settings.json`
- Sets Python interpreter to `.venv\Scripts\python.exe`
- Configures Python analysis paths
- Excludes build artifacts from search and file explorer
- Enables npm auto-detection

### `extensions.json`
Recommends essential extensions:
- Python & Pylance (Python development)
- ESLint (JavaScript linting)
- Prettier (Code formatting)

### `launch.json`
Debug configurations:
- **Python: FastAPI Backend** - Debug the FastAPI application

### `tasks.json`
Quick tasks accessible via `Terminal > Run Task...` or `Ctrl+Shift+P > Tasks: Run Task`:
- **Start Full Stack** - Start both backend and frontend (`npm start`)
- **Start Backend Only** - Start FastAPI server
- **Start Frontend Only** - Start React dev server
- **Install All Dependencies** - Run npm install
- **Complete Setup** - Full project setup with venv creation

## Running Tasks

1. Press `Ctrl+Shift+P` (or `Cmd+Shift+P` on Mac)
2. Type "Tasks: Run Task"
3. Select the task you want to run

Or use the Terminal menu: `Terminal > Run Task...`

## Why Track These in Git?

These configurations ensure:
- ✅ Consistent Python environment detection
- ✅ Same development tools across team members
- ✅ Quick onboarding for new developers
- ✅ No manual VS Code configuration needed

When you clone the repo and open it in VS Code, everything just works!
