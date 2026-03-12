#!/bin/bash
# Run this script from your Documents-Pro/ folder:
#   cd /path/to/Documents-Pro
#   bash CL_ES_AT_WORK/install-skills.sh

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PARENT_DIR="$(dirname "$SCRIPT_DIR")"
SKILLS_DIR="$PARENT_DIR/.skills/skills"

echo "Installing skills to: $SKILLS_DIR"
mkdir -p "$SKILLS_DIR"

for skill in carmen marcos curriculum; do
    SKILL_FILE="$SCRIPT_DIR/$skill.skill"

    if [ ! -f "$SKILL_FILE" ]; then
        echo "⚠️  $skill.skill not found in $SCRIPT_DIR — skipping"
        continue
    fi

    TARGET="$SKILLS_DIR/$skill"
    mkdir -p "$TARGET"

    # Unzip into a temp folder, then move contents up (strips the nested subfolder)
    TMPDIR=$(mktemp -d)
    unzip -q "$SKILL_FILE" -d "$TMPDIR"

    # The zip contains a single top-level folder (e.g. carmen-skill/)
    INNER=$(ls "$TMPDIR")
    if [ -d "$TMPDIR/$INNER" ]; then
        cp -R "$TMPDIR/$INNER/." "$TARGET/"
        rm -rf "$TMPDIR"
    else
        cp -R "$TMPDIR/." "$TARGET/"
        rm -rf "$TMPDIR"
    fi

    echo "✅ $skill installed → $TARGET"
    ls "$TARGET"
    echo ""
done

echo "Done. Restart Cowork for the skills to appear."
