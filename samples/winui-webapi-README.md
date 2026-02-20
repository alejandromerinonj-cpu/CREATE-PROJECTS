WinUI + WebAPI sample — quick start

This sample contains two projects:
- `src/MyApi` — ASP.NET Core Web API (listens on http://localhost:5000)
- `src/WinUIApp` — WinUI 3 app that calls the API endpoint `/hello`

Run the sample (order matters):

1. Start the API:
   - dotnet run --project src/MyApi

2. Build & run the WinUI app (in another terminal):
   - dotnet run --project src/WinUIApp

Or run both with the helper script (recommended):
   - PowerShell: `.\	emplates\..\..\scripts\run-sample.ps1`  (from repository root)

Expected behavior:
- The API responds at http://localhost:5000/hello
- The WinUI app shows a window with a button; clicking it calls the API and displays the result.

Troubleshooting:
- If the WinUI app can't call the API, ensure the API is running and listening on port 5000.
- If the WinUI app build fails, check Windows App SDK installation and Developer Mode (see `docs/install-first.md`).