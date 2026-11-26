# Windows Server Installation, Maintenance & Administration

## Release selection
There is no official product named **Windows Server 2024**. Use Windows Server 2025 or 2022, subject to application, driver, licensing and hardware compatibility. The procedures below are release-family guidance; verify exact UI names and commands for the selected build.

## Installation workflow
1. Confirm edition, licensing, hardware support, firmware mode (UEFI), TPM/Secure Boot requirements and storage layout.
2. Update server firmware where approved; configure RAID/HBA and boot order.
3. Install from trusted Microsoft media. Select Desktop Experience only when GUI administration is required.
4. Set a strong unique local Administrator password; record recovery material securely.
5. Configure hostname, static management IP, DNS, NTP/time zone and Windows activation.
6. Install current vendor drivers and approved updates; reboot and verify.
7. Enable remote administration only on a trusted management network.
8. Add required roles and features; document dependencies and rollback.

## Core administration
- **AD DS:** forest/domain planning, domain controller promotion, Sites and Services, replication health and FSMO role awareness.
- **DNS:** forward/reverse zones, records, scavenging policy and client resolution testing.
- **DHCP:** scopes, exclusions, reservations, options, failover design and authorization.
- **Group Policy:** OU design, security filtering, loopback awareness, baseline policies and change testing.
- **File services:** NTFS/share permissions, access-based enumeration, quotas and shadow copies where appropriate.
- **Remote administration:** Windows Admin Center / Server Manager / PowerShell Remoting with least privilege.

## Useful verification commands
```powershell
Get-ComputerInfo | Select-Object WindowsProductName, WindowsVersion, OsBuildNumber
Get-NetIPConfiguration
Get-Service | Where-Object Status -eq 'Stopped'
Get-WindowsFeature | Where-Object InstallState -eq 'Installed'
Get-WinEvent -LogName System -MaxEvents 30
Test-NetConnection -ComputerName <server-or-service> -Port 443
```

## Maintenance checklist
- Review Windows Update status and schedule maintenance reboots.
- Check System, Application, DNS Server, Directory Service and DHCP logs as applicable.
- Verify time synchronization, DNS resolution, replication and service dependencies.
- Review local administrators, privileged groups, stale accounts and firewall rules.
- Check disk free space, RAID/controller health, SMART/vendor alerts and backup jobs.
- Perform documented restore tests and retain evidence.
- Review certificates, expiration dates and service account permissions.

## Security baseline
Use Microsoft Security Baselines appropriate to the server release. Disable unused roles/services, enforce host firewall, restrict RDP to management sources, use MFA through the access platform where supported, enable Defender/EDR, audit privileged activity and maintain tested backups.

## Lab evidence to add
Screenshots with sensitive details masked, installation choices, role configuration, test outputs, change record, validation and rollback notes. Never publish domain credentials, real public IPs or production names.

## Additional administration runbooks

- [Storage, memory, network and backup](storage-memory-network-backup.md)
- [Network configuration and remote management](networking-and-remote-management.md)
- [Installation and initial baseline](installation-and-baseline.md)
- [Active Directory, DNS and DHCP](active-directory-dns-dhcp.md)
