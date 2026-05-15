# Secrets

This directory holds OAuth credentials and tokens for MCP servers. **Nothing in here is committed to git.**

Expected contents (none of these exist until you create them — see `SETUP.md`):

- `gmail-credentials.json` — Google OAuth client credentials for Gmail
- `gmail-token.json` — cached Gmail access token (created on first auth)
- `gcal-credentials.json` — Google OAuth client credentials for Calendar
- `gcal-token.json` — cached Calendar access token
- `gdrive-credentials.json` — Google OAuth client credentials for Drive
- `gdrive-token.json` — cached Drive access token

If you ever see these files in `git status`, something is wrong with the gitignore. Stop and fix before committing.
