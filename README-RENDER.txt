RENDER DEPLOY NOTES

1. Extract this ZIP so Dockerfile, index.php, login.php, signup.php, etc. are at the repository ROOT (not inside another folder).
2. Push the files to GitHub.
3. In Render, create a new Web Service from that GitHub repository and choose Docker runtime. If Render detects render.yaml, review the settings.
4. The Dockerfile listens on port 10000.

IMPORTANT LIMITATIONS / SECURITY
- This is a legacy PHP app. The Dockerfile fixes the missing-Dockerfile build error; it does not make the app secure.
- The existing app stores passwords in plaintext and has a hard-coded admin login (admin/admin). Do not use it publicly until those are fixed; change/remove the default admin login immediately.
- The original source store contained a hard-coded Telegram bot token. Its copy in this ZIP is replaced with a placeholder, but revoke/rotate that token in BotFather because it was exposed in the original archive.
- Render free service filesystems are ephemeral. Uploaded bots and JSON changes may disappear on redeploy/restart unless you configure persistent storage or move data to a database/object store.
- Running arbitrary user-uploaded PHP files is unsafe and is not isolated by this setup. Do not use this as a public multi-user bot-hosting service without a proper sandbox and security review.
