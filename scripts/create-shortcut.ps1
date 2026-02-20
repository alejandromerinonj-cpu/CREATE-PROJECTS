# Create a Desktop shortcut that launches the run-sample.ps1 script
$targetPowershell = Join-Path $env:WINDIR 'System32\WindowsPowerShell\v1.0\powershell.exe'
$repoRoot = (Resolve-Path "$(Join-Path (Split-Path -Parent $MyInvocation.MyCommand.Path) '..')").ProviderPath
$scriptPath = Join-Path $repoRoot 'scripts\run-sample.ps1'
$desktop = [Environment]::GetFolderPath('Desktop')
$linkPath = Join-Path $desktop 'Run CREATE PROJECTS Sample.lnk'

$wsh = New-Object -ComObject WScript.Shell
$sc = $wsh.CreateShortcut($linkPath)
$sc.TargetPath = $targetPowershell
$sc.Arguments = "-NoProfile -ExecutionPolicy Bypass -File `"$scriptPath`""
$sc.WorkingDirectory = $repoRoot
$sc.WindowStyle = 1
$sc.Description = 'Run the CREATE PROJECTS WinUI + API sample (starts API then WinUI app)'
$sc.Save()
Write-Host "Shortcut created on Desktop: $linkPath" -ForegroundColor Green