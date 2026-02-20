# 08 — Editor‑free / No‑Git workflow (practical steps)

Goal: how to develop, version and back up projects using only Microsoft CLI tools and Windows features (no Git, no editor dependencies).

Daily loop (CLI‑only)
1. Edit files with Notepad or any plain editor.
2. Build & test locally:
   - dotnet build
   - dotnet test
3. Run app:
   - dotnet run (or run published exe)
4. Create local backup snapshot:
   - Compress-Archive -Path '.' -DestinationPath "..\backups\project-$(Get-Date -Format yyyyMMdd-HHmmss).zip"

Versioning (manual)
- Update `VERSION` or `CHANGELOG.md` with the release tag.
- Produce a release zip: `Compress-Archive -Path . -DestinationPath ..\releases\v1.0.0.zip`

Sharing / deployment
- Upload the MSIX or release ZIP to OneDrive, Azure Storage, or a file server.

Advantages
- Simple, works offline, no Git required.
- Use `dotnet user-secrets` for development secrets (not stored in snapshots).

When to adopt Git later
- Git gives diffing, history, branching; consider migrating snapshots to a Git repo when ready.
