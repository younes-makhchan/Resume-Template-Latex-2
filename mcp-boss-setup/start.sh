#!/usr/bin/env bash
# Starts mcp-boss at http://127.0.0.1:8000/mcp. Keep this terminal open while you use it.
# Runs from the repo folder because the server writes QR images to ./static.
set -euo pipefail
cd "${MCP_BOSS_DIR:-$HOME/mcp-boss}"
exec .venv/bin/python mcp_boss.py
