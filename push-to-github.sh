#!/bin/bash
# fcc-spanish-curriculum-plugin — GitHub push script
# Run this once on your machine, then delete it and revoke the token.
# ─────────────────────────────────────────────────────────────────────────────

GITHUB_USERNAME="RafaeldavisH"
GITHUB_TOKEN="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"
REPO_NAME="fcc-spanish-curriculum-plugin"

# The script expects to be run from inside the extracted plugin folder.
# Make sure you've extracted fcc-spanish-curriculum.zip first and cd'd into it.

echo ""
echo "Step 1 — Creating repo on GitHub..."
RESPONSE=$(curl -s \
  -H "Authorization: token $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json" \
  -X POST https://api.github.com/user/repos \
  -d "{
    \"name\": \"$REPO_NAME\",
    \"description\": \"Claude Cowork plugin for the freeCodeCamp Professional Spanish curriculum pipeline (Carmen, Marcos, Curriculum agents)\",
    \"private\": true,
    \"auto_init\": false
  }")

REPO_URL=$(echo "$RESPONSE" | python3 -c "import sys,json; print(json.load(sys.stdin).get('html_url','ERROR'))" 2>/dev/null)

if [[ "$REPO_URL" == "ERROR" || -z "$REPO_URL" ]]; then
  echo ""
  echo "⚠️  Repo may already exist or there was an API error."
  echo "Response: $RESPONSE"
  echo ""
  echo "If the repo already exists on GitHub, skip to Step 2."
  REPO_URL="https://github.com/$GITHUB_USERNAME/$REPO_NAME"
fi

echo "✅ Repo: $REPO_URL"

echo ""
echo "Step 2 — Initializing git and pushing..."

git init
git add .
git commit -m "Initial release: fcc-spanish-curriculum plugin v1.0.0"
git branch -M main
git remote add origin "https://$GITHUB_TOKEN@github.com/$GITHUB_USERNAME/$REPO_NAME.git"
git push -u origin main

echo ""
echo "✅ Done! Plugin is live at: $REPO_URL"
echo ""
echo "─────────────────────────────────────────────────────────────────────────"
echo "IMPORTANT: Now that the push is complete:"
echo "  1. Delete this script file"
echo "  2. Revoke your token at: https://github.com/settings/tokens"
echo "     (Generate a new one when you need it again)"
echo "─────────────────────────────────────────────────────────────────────────"
