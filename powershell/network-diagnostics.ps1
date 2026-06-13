# network-diagnostics.ps1
# Performs basic network troubleshooting checks

Write-Host "=== Network Diagnostics ===" -ForegroundColor Cyan

# IP configuration
Write-Host "`n[1] IP Configuration" -ForegroundColor Yellow
Get-NetIPAddress | Where-Object { $_.AddressFamily -eq "IPv4" } |
Select-Object InterfaceAlias, IPAddress, PrefixLength

# DNS servers
Write-Host "`n[2] DNS Servers" -ForegroundColor Yellow
Get-DnsClientServerAddress -AddressFamily IPv4 |
Select-Object InterfaceAlias, ServerAddresses

# Default gateway
Write-Host "`n[3] Default Gateway" -ForegroundColor Yellow
Get-NetRoute -DestinationPrefix "0.0.0.0/0" |
Select-Object InterfaceAlias, NextHop

# Ping test (internet)
Write-Host "`n[4] Internet Connectivity Test (ping 8.8.8.8)" -ForegroundColor Yellow
ping 8.8.8.8 -n 2

# DNS resolution test
Write-Host "`n[5] DNS Resolution Test (ping google.com)" -ForegroundColor Yellow
ping google.com -n 2

Write-Host "`nDiagnostics complete." -ForegroundColor Green
