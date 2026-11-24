#!/usr/bin/env bash
# One-time install of mcp-boss on your own computer (macOS / Linux). Needs Python 3.12+ and git.
set -euo pipefail
DIR="${MCP_BOSS_DIR:-$HOME/mcp-boss}"
if [ ! -d "$DIR" ]; then
  git clone https://github.com/derekdong-star/mcp-boss.git "$DIR"
fi
cd "$DIR"
echo "Installed commit: $(git rev-parse --short HEAD)  (read mcp_boss.py before first run)"
python3 -m venv .venv
.venv/bin/pip install -r requirements.txt
.venv/bin/python -m playwright install chromium
echo "Done. Start the server with: ./start.sh"
