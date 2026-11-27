# PowerShell Administration Examples

The script in this folder collects a basic Windows Server inventory. It is read-only: it does not install roles, change services or modify network settings.

- [Get-ServerInventory.ps1](Get-ServerInventory.ps1)

Run it from a standard PowerShell session:

```powershell
.\Get-ServerInventory.ps1
```

The commands below are useful when checking one area at a time.

## Basic inventory

```powershell
Get-ComputerInfo | Select-Object CsName, WindowsProductName, WindowsVersion, OsBuildNumber
Get-NetAdapter | Format-Table Name, Status, LinkSpeed
Get-Volume | Format-Table DriveLetter, FileSystemLabel, Size, SizeRemaining
```

## Recent critical system events

```powershell
Get-WinEvent -FilterHashtable @{LogName='System'; Level=1,2; StartTime=(Get-Date).AddDays(-1)} -MaxEvents 100 |
  Select-Object TimeCreated, Id, ProviderName, Message
```

## Updates and roles

Use Windows Update or the organization's approved patch-management process. To list installed Server Manager roles:

```powershell
Get-WindowsFeature | Where-Object InstallState -eq 'Installed'
```

Review output before sharing it. Hostnames, IP details and event messages may reveal information about an environment.

---

**A note on this documentation:** The technical work and experience behind these notes are mine. Some wording and the way I have organized the material have had AI assistance, mainly to make the writing clearer and save time. The examples, decisions and work described are not AI-generated. I check what I publish and stand behind it.
