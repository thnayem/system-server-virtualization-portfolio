# PowerShell Administration Examples

Run in an elevated PowerShell session only when required. Review each command and test in a lab before production use.

## Basic inventory
```powershell
Get-ComputerInfo | Select-Object CsName, WindowsProductName, WindowsVersion, OsBuildNumber
Get-NetAdapter | Format-Table Name, Status, LinkSpeed
Get-Volume | Format-Table DriveLetter, FileSystemLabel, Size, SizeRemaining
Get-Service | Where-Object Status -eq 'Running'
```

## Recent critical system events
```powershell
Get-WinEvent -FilterHashtable @{LogName='System'; Level=1,2; StartTime=(Get-Date).AddDays(-1)} -MaxEvents 100 |
  Select-Object TimeCreated, Id, ProviderName, Message
```

## Updates and roles
Use Windows Update / approved enterprise patch management. For Server Manager role inventory:
```powershell
Get-WindowsFeature | Where-Object InstallState -eq 'Installed'
```

Do not include passwords, tokens or environment-specific secrets in scripts or Git history.
