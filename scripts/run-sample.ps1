<#
.SYNOPSIS
  Start the sample (MyApi in background + WinUIApp in foreground).
.DESCRIPTION
  Builds (optional), starts the ASP.NET Core API in the background, waits for readiness,
  then launches the WinUI app in the foreground. When the WinUI app closes the API is stopped.
.PARAMETER NoBuild
  Skip the build step (useful when you've already built the projects).
.EXAMPLE
  PS> .\scripts\run-sample.ps1
#>

param(
  [switch]$NoBuild
)

function FailIfNoDotnet {
  if (-not (Get-Command dotnet -ErrorAction SilentlyContinue)) {
    Write-Error "dotnet CLI not found. Install .NET SDK (see docs/install-first.md) and re-run this script."
    exit 1
  }
}

FailIfNoDotnet

# Ensure running from repository root (script can live in scripts/)
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $scriptDir
if (-not (Test-Path -Path "src" -PathType Container)) {
  Set-Location -Path ..
}

Write-Host "Repository root: $(Get-Location)" -ForegroundColor Cyan

if (-not $NoBuild) {
  Write-Host "Building projects (Release)..." -ForegroundColor Green
  dotnet build src\MyApi -c Release || { Write-Error "Build failed for MyApi"; exit 1 }
  dotnet build src\WinUIApp -c Release || { Write-Error "Build failed for WinUIApp"; exit 1 }
} else {
  Write-Host "Skipping build step (--NoBuild supplied)." -ForegroundColor Yellow
}

# Start API in background
$apiProj = "src\MyApi"
Write-Host "Starting MyApi in background (http://localhost:5000)..." -ForegroundColor Green
$apiProcess = Start-Process -FilePath "dotnet" -ArgumentList "run --project $apiProj" -WindowStyle Minimized -PassThru
Start-Sleep -Seconds 1

# Wait for API readiness (max 30s)
$timeout = 30
$elapsed = 0
$ready = $false
Write-Host "Waiting for MyApi to respond... (timeout ${timeout}s)" -ForegroundColor Cyan
while ($elapsed -lt $timeout -and -not $ready) {
  Start-Sleep -Seconds 1
  try {
    $r = Invoke-WebRequest -Uri "http://localhost:5000/" -UseBasicParsing -TimeoutSec 1
    if ($r.StatusCode -ge 200 -and $r.StatusCode -lt 400) { $ready = $true; break }
  } catch { }
  $elapsed++
}

if ($ready) {
  Write-Host "MyApi is responding." -ForegroundColor Green
} else {
  Write-Warning "MyApi did not respond within ${timeout}s. You can still run the WinUI app, but API calls will fail until the API is running.";
}

try {
  Write-Host "Launching WinUIApp (foreground). Close the app window to stop the sample." -ForegroundColor Green
  & dotnet run --project src\WinUIApp
} finally {
  Write-Host "Cleaning up..." -ForegroundColor Cyan
  if ($apiProcess -and -not $apiProcess.HasExited) {
    Stop-Process -Id $apiProcess.Id -Force -ErrorAction SilentlyContinue
    Write-Host "Stopped MyApi (PID $($apiProcess.Id))." -ForegroundColor Green
  } else {
    Write-Host "MyApi process is not running or already exited." -ForegroundColor Yellow
  }
}
