# Quick Start — Printable GUI Checklist (no terminal required)

A single‑page checklist for an absolute beginner to prepare a Windows PC for Microsoft native development (no PowerShell or editors required).

1) Pre‑checks
- Make sure Windows 10 or 11 is up to date and you can install apps (Admin password available).
- Have a stable Internet connection.

2) Enable Developer Mode (required)
- Open Settings → Privacy & security → For developers → Turn **Developer Mode** ON.
- Confirm the switch shows **On**.

3) Install .NET 10 SDK (official installer)
- Open browser → go to: https://dotnet.microsoft.com/download/dotnet/10.0
- Download the **.NET 10 SDK** (Installer) and double‑click to run.
- Follow the installer wizard until completion.
- Confirm: Settings → Apps → look for **Microsoft .NET SDK**.

4) Install Windows SDK (packaging & signing tools)
- Visit: https://developer.microsoft.com/windows/downloads/
- Download **Windows SDK** and run the installer.
- In the installer, ensure **Windows SDK** (default selections) is checked; finish the wizard.
- Confirm: Use File Explorer to check **C:\Program Files (x86)\Windows Kits\10\bin** exists.

5) (Optional) Install MSIX Packaging Tool (GUI)
- Open Microsoft Store → search **MSIX Packaging Tool** → Install.
- Useful for manual packaging if you prefer a GUI over MakeAppx.

6) (Optional) Install SQL Server Express / LocalDB
- Download SQL Server Express installer from Microsoft and run the Setup Wizard.
- (Optional) Install SQL Server Management Studio (SSMS) for GUI DB management.
- Confirm: open SSMS and connect to `(localdb)\MSSQLLocalDB` or check Services for `SQL Server (SQLEXPRESS)`.

7) (Optional) Install Windows Package Manager (winget) & Windows Terminal
- Microsoft Store → Windows Terminal (recommended) — install for a modern terminal experience.
- winget is often preinstalled on recent Windows; if needed, install from Microsoft Store.

8) Quick verification (GUI + one tiny optional command)
- Verify .NET folder: open File Explorer → `C:\Program Files\dotnet` must exist.
- Verify Windows SDK folder: `C:\Program Files (x86)\Windows Kits\10\bin` must exist.
- Optional single command to run later (open Command Prompt):
  - `dotnet --version`  (shows installed SDK version)

9) Create a simple sample (if you’re ready to try one command)
- Open Start → type `cmd` → Enter to open Command Prompt.
- Run these two commands to try a Hello World app:
  - `dotnet new console -n HelloApp`  
  - `cd HelloApp` then `dotnet run` → you should see `Hello, World!` printed.

10) Troubleshooting (common fixes)
- Installer failed → reboot and run installer as Administrator (right‑click → Run as administrator). 
- MakeAppx or signtool missing → re-run Windows SDK installer and ensure Packaging tools were selected.
- If `dotnet` not found after install → restart your PC or sign out/in to refresh PATH.

11) Next steps (what to do after setup)
- Follow `docs/00-getting-started.md` for the first CLI steps and examples. 
- When ready, ask me to generate an installer script (winget/batch) or scaffold a CLI‑only sample app.

---
Print: this page fits a single sheet — use Print → Save as PDF or Print to Paper.