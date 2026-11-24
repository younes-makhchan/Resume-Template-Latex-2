# mcp-boss setup (BOSS直聘 job search for Claude)

Runs on **your own computer**: login is a QR code scanned with the BOSS app.
The server speaks streamable HTTP at `http://127.0.0.1:8000/mcp` (not stdio),
so the README's `"command": "python"` config from upstream does not connect.

## 1. Install (once)
- macOS/Linux: `bash setup.sh`
- Windows: `powershell -ExecutionPolicy Bypass -File setup.ps1`

Installs to `~/mcp-boss` (override with `MCP_BOSS_DIR`). Read `mcp_boss.py` before the first run.

## 2. Start the server (every time)
`./start.sh` and leave that terminal open.

## 3. Connect a client
**Claude Code**
```
claude mcp add --transport http --scope user mcp-boss http://127.0.0.1:8000/mcp
```
(or copy `claude-code.mcp.json` to a project as `.mcp.json`).
Then merge `claude-code.settings.json` into `~/.claude/settings.json`:
it blocks `send_greeting` (stops Claude messaging recruiters from your account)
and asks before each login.

**Claude Desktop**: merge `claude_desktop_config.json` into
- macOS: `~/Library/Application Support/Claude/claude_desktop_config.json`
- Windows: `%APPDATA%\Claude\claude_desktop_config.json`

then restart Desktop. Needs Node.js (for `npx mcp-remote`). Start the server first.

## 4. Use
1. "Log in to BOSS" → open the QR link it returns → scan with the BOSS直聘 app.
2. "Search BOSS for Golang jobs in 上海, 三到五年, 20-50k".

Filter values: experience 不限/应届生/一年以内/一到三年/三到五年/五到十年/十年以上;
salary 3k以下/3-5k/5-10k/10-20k/20-50k/50以上; job_type 全职/兼职;
city 北京/上海/深圳/广州/杭州/成都/武汉/西安/南京/苏州.

## Risks
- Unofficial scraper that bypasses BOSS anti-bot checks: may break, may violate
  BOSS terms, may get your account restricted.
- Your session cookie is readable by any client connected to the server
  (`boss://login/info`). Don't expose port 8000; don't run the Docker image with `-p 8000:8000` on a shared network.
- Single-author repo, 2 commits, unpinned dependencies: unaudited.
