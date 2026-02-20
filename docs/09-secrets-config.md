# 09 — Secrets & configuration (no Git)

Purpose: store development secrets safely without committing them.

dotnet user‑secrets (per‑project, dev only)
- Initialize: `dotnet user-secrets init` (adds UserSecretsId to csproj)
- Set a secret: `dotnet user-secrets set "Jwt:Key" "value"`
- Read in code via `Configuration` (same as appsettings)

Environment variables (Windows)
- Temporary (current PowerShell session): `$env:MY_APP__APIKEY = "value"`
- Persist (system/user): `setx MY_APP__APIKEY "value"`

Certificate / signing secrets
- Keep `.pfx` files out of source. Use secure OS certificate store or CI secret store.

CI secrets (when you later use GitHub Actions)
- Store secrets in repository/org Secrets and reference them in workflows as `secrets.MY_SECRET`.

Do NOT commit
- .pfx, .p12, secret JSON files, `.env` with real credentials — never add them to source control.
