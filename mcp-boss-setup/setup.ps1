# One-time install of mcp-boss on Windows (PowerShell). Needs Python 3.12+ and git.
$Dir = if ($env:MCP_BOSS_DIR) { $env:MCP_BOSS_DIR } else { "$HOME\mcp-boss" }
if (-not (Test-Path $Dir)) { git clone https://github.com/derekdong-star/mcp-boss.git $Dir }
Set-Location $Dir
py -3.12 -m venv .venv
.\.venv\Scripts\pip install -r requirements.txt
.\.venv\Scripts\python -m playwright install chromium
Write-Host "Done. Start with: cd $Dir; .\.venv\Scripts\python mcp_boss.py"
