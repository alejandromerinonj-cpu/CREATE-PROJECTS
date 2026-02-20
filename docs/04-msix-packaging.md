# 04 — MSIX packaging and signing (CLI recipe)

Purpose: produce an MSIX installer from published app files and sign/install it using Windows SDK tools.

1) Publish from dotnet
- dotnet publish -c Release -r win-x64 -o .\publish

2) Create MSIX package (MakeAppx)
- MakeAppx pack /d .\publish /p MyApp.msix

3) Create a test code‑signing certificate (PowerShell)
- $cert = New-SelfSignedCertificate -Type CodeSigningCert -Subject "CN=MyDevCert" -CertStoreLocation "Cert:\CurrentUser\My"
- $pwd = ConvertTo-SecureString -String "P@ssw0rd" -Force -AsPlainText
- Export-PfxCertificate -Cert "Cert:\CurrentUser\My\$($cert.Thumbprint)" -FilePath .\testcert.pfx -Password $pwd

4) Sign the package (SignTool)
- signtool sign /fd SHA256 /a /f .\testcert.pfx /p P@ssw0rd MyApp.msix

5) Install locally (Add-AppxPackage)
- Add-AppxPackage .\MyApp.msix

6) CI pattern (recommended)
- Build & publish on Windows runner
- Create MSIX via MakeAppx
- Sign using a CI secret (PFX stored in secure store or use certificate installed on runner)
- Upload MSIX with actions/upload-artifact for release pipeline

Security note
- Do NOT commit `.pfx` files or private keys to source control. Keep signing certificates in secure storage.
