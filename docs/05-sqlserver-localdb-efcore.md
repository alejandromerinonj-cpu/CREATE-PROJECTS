# 05 — SQL Server (LocalDB) + EF Core — CLI steps

Purpose: local database for development using LocalDB + EF Core CLI commands (no GUI required).

Install
- Install SQL Server Express / LocalDB from Microsoft downloads.
- Verify LocalDB: `sqllocaldb info`

Common commands
- Create or start default instance:
  - sqllocaldb create "MSSQLLocalDB"
  - sqllocaldb start "MSSQLLocalDB"
- Connection string example (trusted):
  - "Server=(localdb)\\MSSQLLocalDB;Database=MyDb;Trusted_Connection=True;"

EF Core (dotnet-ef)
- Install tool: `dotnet tool install --global dotnet-ef`
- Add EF packages to project:
  - dotnet add package Microsoft.EntityFrameworkCore.SqlServer
  - dotnet add package Microsoft.EntityFrameworkCore.Design
- Add migration:
  - dotnet ef migrations add Init
- Apply migration:
  - dotnet ef database update

Verify DB (CLI)
- Use `sqlcmd` or any CLI SQL client to query the LocalDB database.

Notes
- For simple development, LocalDB is sufficient and works entirely via CLI.
- In CI, use a hosted SQL Server or a Docker SQL Server image.
