# 07 — Windows CI (GitHub Actions) — build, test, package, upload

Purpose: CI recipe that runs on `windows-latest`, builds .NET 10 app, runs tests, publishes and uploads MSIX as an artifact.

Minimal workflow (add to `.github/workflows/ci-windows.yml`)
```yaml
name: CI (Windows .NET)

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: windows-latest
    steps:
      - uses: actions/checkout@v6
      - uses: actions/setup-dotnet@v5
        with:
          dotnet-version: 10.x
          cache: true
      - run: dotnet restore --locked-mode
      - run: dotnet build --no-restore -c Release
      - run: dotnet test --no-build -c Release
      - run: dotnet publish -c Release -r win-x64 -o publish\app
      - name: Create MSIX
        run: |
          "C:\\Program Files (x86)\\Windows Kits\\10\\bin\\x64\\MakeAppx.exe" pack /d publish\app /p MyApp.msix
      - name: Upload MSIX artifact
        uses: actions/upload-artifact@v4
        with:
          name: MyApp-msix
          path: MyApp.msix
```

Recommendations
- Keep `global.json` pinned for reproducible SDK selection.
- Store signing certificate securely (NG: do not put PFX in repo). Use secrets or an installed certificate on the runner.
- Use `actions/cache` for NuGet via `setup-dotnet@v5` (`cache: true`).
