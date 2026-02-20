WinUIApp — minimal WinUI 3 desktop app (CLI‑buildable)

Build & run (PowerShell / Command Prompt):

- dotnet restore
- dotnet build --project src/WinUIApp -c Debug
- dotnet run --project src/WinUIApp

Or run the built executable (after `dotnet build`):
- start src\\WinUIApp\\bin\\Debug\\net10.0-windows10.0.19041.0\\WinUIApp.exe

Notes:
- The sample contains a button that calls the Web API at http://localhost:5000/hello — start the API first.
- If the app fails to run, ensure Windows App SDK is available on your machine and Developer Mode is enabled.