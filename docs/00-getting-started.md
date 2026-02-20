# 00 — Getting started (absolute beginner, Windows only)

This page is for someone who is starting *right now* and has **nothing installed**. Follow these steps in order — each step includes exact commands you can paste into PowerShell (run as normal user; admin only when noted).

Prerequisites
- Windows 10 or Windows 11 (latest updates recommended)
- Working Internet connection
- PowerShell (built into Windows) or Windows Terminal

Quick checklist (what you will install)
1. .NET 10 SDK (dotnet CLI)
2. Windows SDK (MakeAppx / SignTool)
3. MSIX Packaging Tool (optional GUI)
4. SQL Server Express / LocalDB (optional for backend)
5. dotnet global tools (ef, watch, trace)

Step 1 — Install .NET 10 SDK (CLI)
- Recommended: use the official installer from Microsoft: https://dotnet.microsoft.com/download/dotnet/10.0
- Alternative (if you use winget):
  - winget install --id Microsoft.DotNet.SDK.10 -e --source winget
- Verify:
  - dotnet --version
  - dotnet --list-sdks
  - dotnet --info

Step 2 — Install Windows SDK (for packaging & SignTool)
- Why: provides MakeAppx.exe and signtool.exe used for MSIX packaging/signing.
- Download (official): https://developer.microsoft.com/windows/downloads/
- Typical tools location after install:
  - C:\\Program Files (x86)\\Windows Kits\\10\\bin\\<version>\\x64\\MakeAppx.exe
  - C:\\Program Files (x86)\\Windows Kits\\10\\bin\\<version>\\x64\\signtool.exe
- Verify (PowerShell):
  - Get-ChildItem 'C:\\Program Files (x86)\\Windows Kits\\10\\bin' -Recurse -Filter MakeAppx.exe

Step 3 — (Optional) MSIX Packaging Tool (GUI)
- From Microsoft Store (search “MSIX Packaging Tool”) or use winget to install the appx packaging GUI.
- This is optional — CLI MakeAppx + SignTool are sufficient.

Step 4 — (Optional) SQL Server Express / LocalDB
- Install LocalDB if you need a local SQL Server for development: https://learn.microsoft.com/sql/database-engine/configure-windows/sql-server-express-localdb
- Verify LocalDB: `sqllocaldb info`

Step 5 — Install useful dotnet global tools (one command)
- dotnet tool install --global dotnet-ef
- dotnet tool install --global dotnet-watch
- dotnet tool install --global dotnet-trace
- dotnet tool install --global dotnet-counters
- dotnet tool install --global dotnet-dump
- Verify: `dotnet tool list -g`

Step 6 — First CLI projects (try these right after installing dotnet)
- Console "Hello World":
  - dotnet new console -n HelloApp
  - cd HelloApp
  - dotnet run
- ASP.NET Core Web API (backend):
  - cd ..
  - dotnet new webapi -n MyApi
  - cd MyApi
  - dotnet run
  - Open http://localhost:5000 in a browser to verify (or check console output)

Step 7 — Build, publish, and run a Windows app (basic)
- Build: `dotnet build -c Release`
- Publish (app files only):
  - dotnet publish -c Release -r win-x64 -o .\publish
- The `publish` folder contains the binaries you can run or package as MSIX.

Step 8 — Try a WinUI sample (no Visual Studio required)
1. Download a Microsoft sample ZIP (no Git required):
   - In PowerShell: `Invoke-WebRequest -Uri "https://github.com/microsoft/WindowsAppSDK-Samples/archive/refs/heads/main.zip" -OutFile windowsapp-samples.zip`
   - Expand-Archive windowsapp-samples.zip -DestinationPath .\wasdk-samples
2. Find a sample folder (e.g., WinUI3) and run:
   - cd .\wasdk-samples\\WindowsAppSDK-Samples-main\\Samples\\WinUI3\\YourSample
   - dotnet restore
   - dotnet build -c Release
   - (If the sample is a packaged app, follow MSIX packaging steps to install)

Step 9 — Create a local code‑signing test cert (dev only)
- PowerShell (run as normal user):
  - $cert = New-SelfSignedCertificate -Type CodeSigningCert -Subject "CN=DevCert" -CertStoreLocation "Cert:\CurrentUser\My"
  - $pwd = ConvertTo-SecureString -String "P@ssw0rd" -Force -AsPlainText
  - Export-PfxCertificate -Cert "Cert:\CurrentUser\My\\$($cert.Thumbprint)" -FilePath .\\devcert.pfx -Password $pwd
- Use `signtool sign /fd SHA256 /a /f .\devcert.pfx MyApp.msix` when signing MSIX (see MSIX guide).

Step 10 — Verify packaging tools exist (PowerShell)
- Get-Command MakeAppx.exe -ErrorAction SilentlyContinue
- Get-Command signtool.exe -ErrorAction SilentlyContinue

Troubleshooting (common beginner issues)
- PATH not updated after install: close and re-open PowerShell or reboot. 
- Missing MakeAppx: install Windows SDK or locate the correct Windows Kits bin folder. 
- Permission denied when installing SDK/tools: run installer as Administrator.
- If `dotnet` command not found: retry installer and check PATH; run `dotnet --info`.

Beginner checklist (do this in order)
1. Install .NET SDK → verify `dotnet --version`.
2. Install Windows SDK → verify `MakeAppx.exe` and `signtool.exe`.
3. Install SQL LocalDB if you need DB dev → verify `sqllocaldb info`.
4. Install dotnet global tools (`dotnet-ef`, `dotnet-watch`) → verify `dotnet tool list -g`.
5. Create `HelloApp` and run it.
6. Publish `HelloApp` and inspect `publish` folder.

What next (pick one)
- Follow `docs/01-dotnet-cli.md` to learn CLI commands in depth. 
- Follow `docs/04-msix-packaging.md` to package and sign an MSIX. 
- Ask me to scaffold a runnable WinUI + WebAPI sample you can build with CLI only.

---
© Microsoft‑centric CLI flow — no editors or Git required. If you want, I can now scaffold a sample app you can run immediately.