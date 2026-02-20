# INSTALL FIRST — absolute beginner (Windows, no editors, no Git)

This single, copy‑and‑paste checklist prepares a *brand new Windows PC* for Microsoft native full‑stack development (dotnet 10, WinUI, MSIX, LocalDB). Follow the steps in order — **do not** skip step 1.

---

## Step 1 — Enable Developer Mode (required for sideloading & local dev)
- Recommended (GUI): Settings → Privacy & security → For developers → **Developer Mode** → Turn **On**. (Windows 11)
- Or (PowerShell — **run as Administrator**):
  - reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /v AllowDevelopmentWithoutDevLicense /t REG_DWORD /d 1 /f
- Why: allows installing unsigned/debug packages and simplifies local app debugging and packaging.

---

## Step 2 — Install .NET 10 SDK (official)
- Download: https://dotnet.microsoft.com/download/dotnet/10.0
- Or (winget):
  - winget install --id Microsoft.DotNet.SDK.10 -e
- Verify:
  - dotnet --version
  - dotnet --list-sdks
  - dotnet --info

---

## Step 3 — Install Windows SDK (MakeAppx, SignTool)
- Download official Windows SDK (needed for MSIX packaging & native tools):
  - https://developer.microsoft.com/windows/downloads/
- Verify the packaging tools exist:
  - Get-Command MakeAppx.exe -ErrorAction SilentlyContinue
  - Get-Command signtool.exe -ErrorAction SilentlyContinue

---

## Step 4 — (Optional GUI) Install MSIX Packaging Tool
- From Microsoft Store: **MSIX Packaging Tool** (useful for manual packaging). CLI MakeAppx + SignTool are sufficient for automated builds.

---

## Step 5 — (Optional) Install SQL Server Express / LocalDB (backend dev)
- Download LocalDB/Express: https://learn.microsoft.com/sql/database-engine/configure-windows/sql-server-express-localdb
- Verify LocalDB: `sqllocaldb info`

---

## Step 6 — Install useful dotnet CLI tools (global)
Run in PowerShell:

```powershell
dotnet tool install --global dotnet-ef
dotnet tool install --global dotnet-watch
dotnet tool install --global dotnet-trace
dotnet tool install --global dotnet-counters
dotnet tool install --global dotnet-dump
```

Verify: `dotnet tool list -g`

---

## Step 7 — (Optional) Install Windows Package Manager (winget) & Windows Terminal
- Verify winget: `winget --version` — install from Microsoft Store if missing. Winget makes installs easier.
- Install Windows Terminal from Microsoft Store for a better shell.

---

## Step 8 — Configure environment & verify everything works
- Verify .NET CLI: `dotnet --version`
- Verify MakeAppx/SignTool: `Get-Command MakeAppx.exe`, `Get-Command signtool.exe`
- Verify LocalDB (if installed): `sqllocaldb info`
- Quick smoke test (create + run a console app):

```powershell
dotnet new console -n HelloApp
cd HelloApp
dotnet run
```

You should see `Hello, World!` in the console.

---

## Step 9 — Create a test code‑signing cert (dev only)
Run as normal user (PowerShell):

```powershell
$cert = New-SelfSignedCertificate -Type CodeSigningCert -Subject "CN=DevCert" -CertStoreLocation "Cert:\CurrentUser\My"
$password = ConvertTo-SecureString -String "P@ssw0rd" -Force -AsPlainText
Export-PfxCertificate -Cert "Cert:\CurrentUser\My\$($cert.Thumbprint)" -FilePath .\devcert.pfx -Password $password
```

> Do NOT commit `.pfx` files to source control. Keep them private.

---

## Step 10 — Next actions (what to do after install)
- Follow `docs/00-getting-started.md` to run your first CLI projects and samples.  
- Use `docs/04-msix-packaging.md` when you want to package & sign apps.  
- If you later want version control, use Git — but it is optional for this flow.

---

## Troubleshooting (quick)
- `dotnet` not found → reboot or re-open PowerShell; ensure SDK installer finished.  
- `MakeAppx` missing → reinstall Windows SDK and check `C:\Program Files (x86)\Windows Kits\10\bin`.  
- Permission errors → run installer / PowerShell as **Administrator** when required.

---

## Summary checklist (copy/paste)
```powershell
# enable Developer Mode (admin)
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /v AllowDevelopmentWithoutDevLicense /t REG_DWORD /d 1 /f

# install dotnet SDK (winget optional)
winget install --id Microsoft.DotNet.SDK.10 -e

# install dotnet tools
dotnet tool install --global dotnet-ef dotnet-watch dotnet-trace dotnet-counters dotnet-dump

# verify
dotnet --version
Get-Command MakeAppx.exe
sqllocaldb info
```

---

If you want, I can now add this checklist into a single interactive PowerShell script or scaffold a CLI‑only sample app you can build and package immediately.