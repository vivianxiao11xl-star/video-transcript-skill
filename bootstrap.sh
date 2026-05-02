#!/usr/bin/env bash
# video-transcript skill bootstrap for club members
# Default: install to Codex skill path ~/.codex/skills/video-transcript
# Usage:
#   bash <(curl -fsSL https://raw.githubusercontent.com/vivianxiao11xl-star/video-transcript-skill/main/bootstrap.sh)
#   TARGET_APP=claude-code bash <(curl -fsSL https://raw.githubusercontent.com/vivianxiao11xl-star/video-transcript-skill/main/bootstrap.sh)

set -euo pipefail

REPO="https://github.com/vivianxiao11xl-star/video-transcript-skill.git"
APP="${TARGET_APP:-codex}"

case "$APP" in
  codex)
    TARGET="$HOME/.codex/skills/video-transcript"
    ;;
  claude-code|claude)
    TARGET="$HOME/.claude/skills/video-transcript"
    ;;
  *)
    echo "Unknown TARGET_APP=$APP. Use codex or claude-code." >&2
    exit 2
    ;;
esac

if [ -e "$TARGET" ]; then
  echo "Target already exists: $TARGET" >&2
  echo "Please remove or back it up first." >&2
  exit 1
fi

mkdir -p "$(dirname "$TARGET")"
git clone "$REPO" "$TARGET"
cd "$TARGET"

if [ ! -f .env ]; then
  cp .env.example .env
  chmod 600 .env
fi

cat <<MSG

✅ video-transcript installed to:
   $TARGET

Next steps:
1. Install dependencies if needed:
   brew install ffmpeg
   python3 -m pip install --user --upgrade yt-dlp playwright
   python3 -m playwright install chromium

2. Edit your API key:
   open -e $TARGET/.env

3. Run doctor:
   python3 $TARGET/scripts/transcript.py --doctor

MSG
