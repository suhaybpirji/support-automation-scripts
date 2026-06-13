# restart-service.ps1
# Restarts a Windows service and shows status before/after

param(
    [Parameter(Mandatory=$true)]
    [string]$ServiceName
)

Write-Host "Checking service status..." -ForegroundColor Cyan
$service = Get-Service -Name $ServiceName -ErrorAction Stop

Write-Host "Current status: $($service.Status)" -ForegroundColor Yellow

Write-Host "Restarting service..." -ForegroundColor Cyan
Restart-Service -Name $ServiceName -Force

Start-Sleep -Seconds 2

$service = Get-Service -Name $ServiceName
Write-Host "New status: $($service.Status)" -ForegroundColor Green
