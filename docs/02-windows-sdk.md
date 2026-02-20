# 02 — Windows SDK (MakeAppx, SignTool, native build tools)

Purpose: use Microsoft Windows SDK tools (MSIX packaging, signing, native build helpers) from the command line.

Install
- Download the Windows SDK installer (standalone) from Microsoft: https://developer.microsoft.com/windows/downloads/
- Optionally install Windows 10/11 SDK components only (no Visual Studio required).

Verify tools (PowerShell)
- Locate MakeAppx/SignTool:
  - Get-ChildItem "C:\\Program Files (x86)\\Windows Kits\\10\\bin" -Recurse -Filter MakeAppx.exe
  - Get-ChildItem "C:\\Program Files (x86)\\Windows Kits\\10\\bin" -Recurse -Filter signtool.exe
- Typical locations:
  - C:\\Program Files (x86)\\Windows Kits\\10\\bin\\<version>\\x64\\MakeAppx.exe
  - C:\\Program Files (x86)\\Windows Kits\\10\\bin\\<version>\\x64\\signtool.exe

Common uses
- Create package: MakeAppx pack /d <input-folder> /p MyApp.msix
- Sign package: signtool sign /fd SHA256 /a /f cert.pfx MyApp.msix
- Debugging / validation: AppxManifest.xml and AppxBlockMap.xml are produced by packaging; **do not** commit them to source control.

Notes
- Windows SDK provides native headers/libs and packaging tools; do not add SDK install folders to your repo.
- Use MakeAppx + SignTool in CI to produce signed installer artifacts, then upload artifacts to release storage.
