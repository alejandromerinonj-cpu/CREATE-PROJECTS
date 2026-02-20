# 06 — dotnet global tools (useful CLI tools)

Install (one‑time)
- dotnet tool install --global dotnet-ef
- dotnet tool install --global dotnet-watch
- dotnet tool install --global dotnet-trace
- dotnet tool install --global dotnet-counters
- dotnet tool install --global dotnet-dump

Usage examples
- Hot reload while running: `dotnet watch run`
- Run EF Core migrations: `dotnet ef migrations add Name` / `dotnet ef database update`
- Capture a trace: `dotnet-trace collect --process-id <pid> -o trace.nettrace`
- View performance counters: `dotnet-counters monitor -p <pid>`
- Create a dump: `dotnet-dump collect -p <pid>`

Notes
- These tools are official Microsoft tooling and work headless on Windows.
- Install once per developer machine (global tools) or add as local tools in tool manifest for repo-local usage.
