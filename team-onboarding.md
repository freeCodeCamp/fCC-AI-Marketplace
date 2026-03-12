# fCC Spanish Curriculum Plugin — Team Onboarding Requirements

Before your onboarding session, please make sure you have everything on this list ready. Setup takes about 20–30 minutes. Come to the session with everything installed and the checklist completed so we can start working immediately.

---

## ⚠️ Important: Platform Restrictions

This plugin runs in **Claude's Cowork mode (desktop app only)**. It does not work in:
- Claude.ai (the web browser version)
- The Claude mobile app
- Claude Code CLI (terminal)

| OS | Supported? | Requirements |
|---|---|---|
| **macOS** | ✅ Yes | Apple Silicon chip (M1, M2, M3, or M4) + macOS 11 Big Sur or higher |
| **Windows** | ✅ Yes | Windows 10 or higher, 64-bit Intel/AMD only (ARM64/Snapdragon not supported) |
| **Linux** | ❌ No | Claude desktop is not available for Linux |
| **Intel Mac** | ❌ No | Cowork requires Apple Silicon — Intel Macs can run Claude Chat/Code but not Cowork |

---

## Checklist

### 1 — Claude subscription

- [ ] You have an active **Claude Pro, Max, Team, or Enterprise** plan
  - Cowork is not available on the free tier
  - Check at [claude.ai/settings](https://claude.ai/settings) — look for the Cowork tab in the app after installing

### 2 — Claude desktop app

- [ ] Download and install from [claude.ai/download](https://claude.ai/download)
- [ ] Open the app and sign in with your paid account
- [ ] Confirm you can see the **Cowork** tab in the left sidebar
  - If the tab is missing, your account plan or machine architecture may not meet requirements

### 3 — System tools

- [ ] **Python 3.8 or higher**
  - Check: open Terminal (Mac) or Command Prompt (Windows) and run `python3 --version`
  - Install from [python.org](https://python.org) if missing
- [ ] **Git**
  - Check: `git --version`
  - Install from [git-scm.com](https://git-scm.com) if missing
- [ ] **Node.js 18 or higher** *(optional — only needed for GitHub PR creation)*
  - Check: `node --version`
  - Install from [nodejs.org](https://nodejs.org) if needed

### 4 — Install the gspread Python library

This is what the agents use to read the planning spreadsheet. Run in your terminal:

```bash
pip install gspread --break-system-packages
```

Verify it worked:
```bash
python3 -c "import gspread; print('gspread OK')"
```

### 5 — Google Sheets credentials (provided by admin)

The team lead will send you a file called `fcc-curriculum-credentials.json`. You need this to connect to the shared planning spreadsheet.

- [ ] Received the credentials JSON file from the team lead
- [ ] Set it as an environment variable by adding this line to your shell profile:

**Mac/Linux (zsh — most common on newer Macs):**
```bash
# Open your shell config file
nano ~/.zshrc

# Paste this line at the bottom, replacing {...} with the full contents of the JSON:
export GOOGLE_SERVICE_ACCOUNT_JSON='{"type":"service_account", ... }'

# Save (Ctrl+O, Enter, Ctrl+X), then reload:
source ~/.zshrc
```

**Mac/Linux (bash):**
```bash
nano ~/.bashrc
# Same line as above, then: source ~/.bashrc
```

**Windows (PowerShell):**
```powershell
notepad $PROFILE
# Add: $env:GOOGLE_SERVICE_ACCOUNT_JSON = '{"type":"service_account", ... }'
# Save and restart PowerShell
```

- [ ] Verify the credential works:
```bash
python3 -c "
import gspread, json, os
creds = json.loads(os.environ['GOOGLE_SERVICE_ACCOUNT_JSON'])
gc = gspread.service_account_from_dict(creds)
print('✅ Google Sheets connection works')
"
```
If you see `✅ Google Sheets connection works`, you're done.

### 6 — Clone the curriculum repo

- [ ] Clone the curriculum content repository:
```bash
git clone https://github.com/YOUR_ORG/fcc-spanish-curriculum-content.git
```
*(The team lead will share the exact repo URL)*

- [ ] Note the full path to where you cloned it — you'll need to give this to Marcos each session:
```bash
# Example on Mac:
/Users/yourname/projects/fcc-spanish-curriculum-content

# Example on Windows:
C:\Users\yourname\projects\fcc-spanish-curriculum-content
```

### 7 — Install the plugin

- [ ] Download `fcc-spanish-curriculum.zip` from the shared team folder
- [ ] Extract the zip — you'll get a folder called `fcc-spanish-curriculum/`
- [ ] In the Claude desktop app: **Settings → Plugins → Install from folder**
  - Select the extracted `fcc-spanish-curriculum/` directory
- [ ] Confirm you can see `/carmen`, `/marcos`, and `/curriculum` as available commands in Cowork

### 8 — GitHub token (optional)

Only needed if you'll be opening Pull Requests from Claude sessions directly.

- [ ] Go to [github.com/settings/tokens](https://github.com/settings/tokens)
- [ ] Generate a classic token with `repo` scope
- [ ] Open the plugin folder → edit `.mcp.json` → replace `REPLACE_WITH_YOUR_GITHUB_TOKEN`
- [ ] Restart the Claude desktop app

---

## What you'll need each session

Once everything above is done, each time you start a Cowork session you'll provide:

- **The Google Sheet URL** — the planning spreadsheet for the level you're working on
- **Your repo path** — the local path to your cloned curriculum repo (for Marcos)
- **A feature branch** — before asking Marcos to create any files, make sure you're on a `feat/...` branch (not `main`)

---

## Quick start workflow

```
# 1. Pull latest changes before starting
git -C /path/to/repo pull

# 2. Create a feature branch for your module
git -C /path/to/repo checkout -b feat/describing-a-company-module-2

# 3. In Claude Cowork, run the pipeline
/curriculum — plan and create module 2 of "Describing a Company" chapter
Sheet: https://docs.google.com/spreadsheets/d/SHEET_ID/edit
Repo: /path/to/fcc-spanish-curriculum-content
```

---

## Getting help

If you hit any issues during setup, bring a screenshot or error message to the onboarding session. Most common issues:

| Problem | Likely cause |
|---|---|
| No Cowork tab in the app | Free plan, Intel Mac, or Windows ARM |
| `KeyError: GOOGLE_SERVICE_ACCOUNT_JSON` | Shell profile wasn't saved or terminal not restarted |
| `ModuleNotFoundError: gspread` | gspread not installed — run `pip install gspread --break-system-packages` |
| Marcos stops and says "you're on main" | Create a feature branch before running Marcos |
| `/carmen` command not appearing | Plugin not installed — check Settings → Plugins |
