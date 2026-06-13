# export-eventlogs.ps1
# Exports Application, System, and Security logs to a timestamped folder

# Create output folder with timestamp
$timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$outputFolder = "$HOME\Documents\EventLogs_$timestamp"
New-Item -ItemType Directory -Path $outputFolder | Out-Null

Write-Host "Exporting logs to: $outputFolder" -ForegroundColor Cyan

# Export Application log
Write-Host "Exporting Application log..." -ForegroundColor Yellow
wevtutil epl Application "$outputFolder\Application.evtx"

# Export System log
Write-Host "Exporting System log..." -ForegroundColor Yellow
wevtutil epl System "$outputFolder/System.evtx"

# Export Security log
Write-Host "Exporting Security log..." -ForegroundColor Yellow
wevtutil epl Security "$outputFolder/Security.evtx"

Write-Host "Export complete!" -ForegroundColor Green

