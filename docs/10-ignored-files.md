# 10 — Files you should NOT commit (Windows + .NET + Windows App SDK)

Use this as a quick checklist for items that belong outside source control.

Build outputs / caches
- `bin/`, `obj/`, `artifacts/`, `TestResults/`, `*.binlog`, `project.assets.json`

NuGet / SDK
- `.nuget/`, `**/packages/`, `%USERPROFILE%\\.nuget\\packages`

Windows App SDK / packaging
- `AppPackages/`, `BundleArtifacts/`, `*.msix`, `*.appx`, `*.appxupload`, `AppxManifest*.xml`, `AppxBlockMap.xml`, `AppxSignature.p7x`

Tooling / LSP
- `.omnisharp/`, `*.roslyncache`, `*.cache`

Secrets & certificates
- `*.pfx`, `*.p12`, `secrets.json`, files that contain passwords or keys

OS files
- `Thumbs.db`, `Desktop.ini`, recycle bin metadata

Short rationale
- Packaging outputs and binaries are build artifacts and should be produced by CI or local builds — do not version them. Secrets and signing keys must be kept out of source control for security.
