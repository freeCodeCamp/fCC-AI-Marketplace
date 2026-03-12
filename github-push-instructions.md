# GitHub Setup — Push Instructions

Two repos to create and push. Do these in order.

---

## Prerequisites

Install the GitHub CLI if you don't have it — it's the fastest path:

```bash
# Mac
brew install gh

# Windows (winget)
winget install GitHub.cli

# Verify
gh --version
```

Then authenticate once:
```bash
gh auth login
# Follow the prompts — choose GitHub.com → HTTPS → Login with a web browser
```

---

## Repo 1 — The Plugin

**What it is:** Carmen, Marcos, Curriculum agents + hooks + setup guide. Your team installs this to get the `/carmen`, `/marcos`, `/curriculum` commands.

### Step 1 — Extract and enter the plugin folder

Extract `fcc-spanish-curriculum.zip` from your workspace folder, then open Terminal:

```bash
cd /path/to/extracted/fcc-spanish-curriculum
```

### Step 2 — Initialize git and make the first commit

```bash
git init
git add .
git commit -m "Initial release: fcc-spanish-curriculum plugin v1.0.0"
```

### Step 3 — Create the GitHub repo and push

```bash
# Creates a private repo under your account (or change --private to --public)
gh repo create fcc-spanish-curriculum-plugin \
  --private \
  --description "Claude Cowork plugin for freeCodeCamp Professional Spanish curriculum pipeline" \
  --source=. \
  --remote=origin \
  --push
```

That's it. Your plugin is live at:
`https://github.com/YOUR_USERNAME/fcc-spanish-curriculum-plugin`

---

## Repo 2 — The Curriculum Content

**What it is:** Where Marcos writes task files. Team members clone this and work on feature branches.

### Step 1 — Extract and enter the content folder

Extract `fcc-spanish-curriculum-content.zip`, then:

```bash
cd /path/to/extracted/fcc-spanish-curriculum-content
```

### Step 2 — Initialize git and make the first commit

```bash
git init
git add .
git commit -m "Initial scaffold: curriculum content repo"
```

### Step 3 — Create the GitHub repo and push

```bash
gh repo create fcc-spanish-curriculum-content \
  --private \
  --description "Task files for freeCodeCamp Professional Spanish course (A1–C2)" \
  --source=. \
  --remote=origin \
  --push
```

Live at:
`https://github.com/YOUR_USERNAME/fcc-spanish-curriculum-content`

---

## After pushing — update the plugin's .mcp.json

Once both repos exist, open the plugin folder and edit `.mcp.json`. Add your GitHub token so Marcos can open PRs:

```json
{
  "mcpServers": {
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "ghp_yourTokenHere"
      }
    }
  }
}
```

Commit and push the updated `.mcp.json`:
```bash
git add .mcp.json
git commit -m "Add GitHub MCP token placeholder"
git push
```

---

## Share with the team

Once both repos are up, send your team:

1. The plugin repo URL → they clone it and install via Claude Settings → Plugins
2. The content repo URL → they clone it to use as their Marcos workspace
3. The `fcc-curriculum-credentials.json` → sent securely (Slack DM / 1Password), NOT via the repo
4. The Google Sheet URL → the planning spreadsheet

---

## No GitHub CLI? Manual alternative

If you prefer not to use `gh`:

1. Go to [github.com/new](https://github.com/new)
2. Create `fcc-spanish-curriculum-plugin` (private)
3. **Don't** initialize with README or .gitignore (you already have them)
4. Copy the repo URL it gives you, then in your terminal:

```bash
cd /path/to/fcc-spanish-curriculum
git init
git add .
git commit -m "Initial release: fcc-spanish-curriculum plugin v1.0.0"
git remote add origin https://github.com/YOUR_USERNAME/fcc-spanish-curriculum-plugin.git
git branch -M main
git push -u origin main
```

Repeat for the content repo.
