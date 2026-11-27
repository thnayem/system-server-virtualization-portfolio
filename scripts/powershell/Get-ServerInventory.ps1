# Read-only Windows Server inventory
# Run from a standard PowerShell session. No system settings are changed.

$ErrorActionPreference = "Continue"

Write-Host "`n=== Computer ===" -ForegroundColor Cyan
Get-ComputerInfo |
    Select-Object CsName, WindowsProductName, WindowsVersion, OsBuildNumber,
                  OsArchitecture

Write-Host "`n=== Network adapters ===" -ForegroundColor Cyan
Get-NetAdapter |
    Select-Object Name, InterfaceDescription, Status, LinkSpeed

Write-Host "`n=== IP configuration ===" -ForegroundColor Cyan
Get-NetIPConfiguration |
    Select-Object InterfaceAlias, IPv4Address, IPv4DefaultGateway,
                  DNSServer

Write-Host "`n=== Volumes ===" -ForegroundColor Cyan
Get-Volume |
    Select-Object DriveLetter, FileSystemLabel, FileSystem,
                  @{Name="SizeGB";Expression={[math]::Round($_.Size / 1GB, 2)}},
                  @{Name="FreeGB";Expression={[math]::Round($_.SizeRemaining / 1GB, 2)}}

Write-Host "`n=== Failed services ===" -ForegroundColor Cyan
Get-Service |
    Where-Object Status -eq "Stopped" |
    Select-Object -First 30 Name, DisplayName, Status

Write-Host "`nInventory complete. Review output before sharing; it may contain host details."
