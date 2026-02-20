MyApi — minimal ASP.NET Core Web API for the sample

Build & run (PowerShell / Command Prompt):

- dotnet restore
- dotnet run --project src/MyApi

API endpoints:
- GET http://localhost:5000/        -> "Hello from MyApi"
- GET http://localhost:5000/hello   -> "Hello from MyApi (endpoint)"

Notes:
- The API listens on port 5000 for the sample. Start this before launching the WinUI app if you want the app to call the API.