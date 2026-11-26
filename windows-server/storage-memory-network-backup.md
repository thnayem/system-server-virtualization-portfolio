# Windows Server: Storage, Memory, Network & Backup

This guide follows the way I approach a server build: understand the workload first, prepare the hardware, then configure the operating system and prove that recovery works.

## 1. Storage planning and administration

Before creating volumes, identify the controller, RAID/HBA mode, physical disk health, usable capacity and expected I/O pattern. Keep the OS volume separate from application/data volumes where the design justifies it. RAID improves availability but is not a backup.

Useful checks:

```powershell
Get-Disk | Format-Table Number, FriendlyName, BusType, OperationalStatus, Size
Get-PhysicalDisk | Format-Table FriendlyName, MediaType, HealthStatus, OperationalStatus, Size
Get-Volume | Format-Table DriveLetter, FileSystem, FileSystemLabel, Size, SizeRemaining
Get-Partition
```

Example: initialize a newly added, confirmed-empty lab disk and create a data volume. **Disk number 2 is only an example. Verify the target carefully; these commands erase data on the selected disk.**

```powershell
Get-Disk
# Only after confirming the correct, empty disk:
Initialize-Disk -Number 2 -PartitionStyle GPT
New-Partition -DiskNumber 2 -UseMaximumSize -DriveLetter D |
  Format-Volume -FileSystem NTFS -NewFileSystemLabel "DATA" -AllocationUnitSize 65536
```

Use ReFS only where supported and appropriate for the workload. Choose NTFS/ReFS, allocation unit size, deduplication and quotas based on application and backup requirements, not habit.

## 2. Memory and performance checks

```powershell
Get-CimInstance Win32_OperatingSystem |
  Select-Object TotalVisibleMemorySize, FreePhysicalMemory
Get-Counter '\\Memory\\Available MBytes',
            '\\Memory\\Pages/sec',
            '\\Processor(_Total)\\% Processor Time'
```

Check sustained memory pressure, paging, application working sets and hypervisor ballooning before adding RAM or changing page-file settings. Keep a system-managed page file unless a documented workload/vendor requirement says otherwise. For VMs, avoid overcommitting memory without monitoring.

## 3. Network configuration and validation

Example PowerShell configuration for an isolated lab. Replace interface alias, address, gateway and DNS with values assigned to your own lab. The documentation range below is non-routable on the public internet.

```powershell
Get-NetAdapter
# Example only:
New-NetIPAddress -InterfaceAlias "Ethernet" -IPAddress "192.0.2.10" -PrefixLength 24 -DefaultGateway "192.0.2.1"
Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses "192.0.2.53"
Set-DnsClient -InterfaceAlias "Ethernet" -RegisterThisConnectionsAddress $true

ipconfig /all
Resolve-DnsName lab.example
Test-NetConnection 192.0.2.53 -Port 53
Get-NetRoute -AddressFamily IPv4
```

For production, coordinate VLAN, switchport mode, gateway, DNS, DHCP reservation and firewall policy with the network owner. Do not configure two default gateways casually on a multihomed server.

## 4. Backup and recovery

- Define RPO/RTO with the service owner before selecting a backup schedule.
- Include system state for domain controllers and application-aware backups for databases.
- Keep a separate backup identity and restrict who can delete backup copies.
- Maintain an offline or immutable copy where feasible.
- Monitor job failures and repository capacity.
- Test file restore and full-system/application recovery on a schedule.

Windows Server Backup feature availability depends on the installed release:

```powershell
Get-WindowsFeature Windows-Server-Backup
# Install only if required and approved:
Install-WindowsFeature Windows-Server-Backup
```

Do not treat a VM snapshot, RAID mirror or successful backup status as proof of recoverability. Record a restore test with start/end time and validation evidence.

## 5. Operational notes

Document disk layout, volume labels, NIC mapping, IP plan, memory baseline, backup policy, restore result and any performance changes. Mask serial numbers, asset tags, MAC addresses and internal addressing before publishing screenshots.
