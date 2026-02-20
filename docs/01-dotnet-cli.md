# 01 — dotnet CLI (install, verify, create, build, publish)

Purpose: install and use the official .NET SDK (10.x) from the command line.

Prerequisites
- Windows 10/11 with admin privileges to install SDKs.

Install / verify
- Download: https://dotnet.microsoft.com/download/dotnet/10.0
- Verify installation:
  - dotnet --version
  - dotnet --list-sdks
  - dotnet --info

Create / run / build
- New console app:
  - dotnet new console -n HelloApp
  - cd HelloApp
  - dotnet run
- Restore / build / test:
  - dotnet restore
  - dotnet build -c Release
  - dotnet test

Publish (self-contained / RID)
- Publish for Windows x64:
  - dotnet publish -c Release -r win-x64 -o .\publish --self-contained false
- Publish a file‑based app (new in .NET 10):
  - dotnet build MyFileApp.cs

global.json (pin SDK for CI)
- Create pinned SDK:
  - dotnet new globaljson --sdk-version 10.0.100 --roll-forward latestFeature

dotnet tools (install once)
- dotnet tool install --global dotnet-ef
- dotnet tool install --global dotnet-watch

Useful env vars
- NUGET_PACKAGES — change NuGet package cache location
- DOTNET_CLI_TELEMETRY_OPTOUT=true — opt out of telemetry

Notes
- Use `dotnet --list-sdks` and `global.json` in CI for deterministic builds.
- All examples are CLI‑first and do not require any editor.
