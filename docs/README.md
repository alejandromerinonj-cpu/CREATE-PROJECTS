# Windows‑native CLI guides — .NET 10 / WinUI / Windows App SDK (editor‑free)

Start here (absolute beginner)
- `00-getting-started.md` — step‑by‑step install & first commands for someone with *nothing installed* (no editors, no Git). **Read this first.**

About this folder
- CLI‑first guides for building, testing, packaging and running Microsoft Windows apps without Visual Studio or VS Code. Each file is self‑contained and shows exact commands you can paste into PowerShell.

Files (use in this order for a beginner):
- `00-getting-started.md` — install everything you need and verify it works
- `01-dotnet-cli.md` — dotnet SDK & core CLI commands (install, build, publish)
- `02-windows-sdk.md` — Windows SDK tools (MakeAppx, SignTool)
- `03-windows-app-sdk-winui.md` — Windows App SDK / WinUI (NuGet + build)
- `04-msix-packaging.md` — MSIX packaging & signing (MakeAppx + SignTool)
- `05-sqlserver-localdb-efcore.md` — LocalDB / SQL Server + EF Core steps
- `06-dotnet-tools.md` — dotnet global tools (ef, watch, trace, dump)
- `07-ci-windows-actions.md` — GitHub Actions (Windows) — build/test/package/upload
- `08-no-git-workflow.md` — editor‑free workflow and local snapshot backups
- `09-secrets-config.md` — secrets & config without Git
- `10-ignored-files.md` — recommended files to *not* version (for later use with Git)

How to use (absolute beginner)
1. Open `00-getting-started.md` and follow the **installation** steps exactly. 
2. Verify `dotnet --version` and `MakeAppx.exe` as described. 
3. Work through `01-` → `07-` in sequence to build, test, package and (optionally) CI‑automate.

If you want, I can now scaffold a runnable, CLI‑only WinUI + WebAPI sample you can build and package immediately.
