# Windows Server Installation & Baseline Runbook

## Pre-install worksheet
| Item | Example / decision |
|---|---|
| Release | Windows Server 2025 or 2022 |
| Edition | Standard / Datacenter, per licensing |
| Install option | Server Core / Desktop Experience |
| Firmware | UEFI, supported Secure Boot configuration |
| Hostname | LAB-WS01 |
| Management IP | 192.0.2.10/24 (documentation example only) |
| DNS / gateway | Lab-specific values |
| Time source | Approved NTP source |
| Backup | Defined before workload onboarding |

## Post-install sequence
- Rename host and restart during initial setup.
- Configure management IP and DNS.
- Set time zone and validate time sync.
- Activate Windows and apply approved cumulative updates.
- Install supported OEM drivers and firmware.
- Enable Windows Firewall and restrict management access.
- Configure monitoring, backup and event forwarding.
- Record OS edition/build and installed roles.

## Example: rename a lab server
```powershell
Rename-Computer -NewName "LAB-WS01" -Restart
```
Run before joining a domain and replace the example hostname.

## Example: inspect network configuration
```powershell
Get-NetIPConfiguration
Get-DnsClientServerAddress
Get-NetFirewallProfile
```

## Acceptance checks
The server has a unique hostname, correct IP/DNS/time, current approved updates, valid activation, supported drivers, restricted admin access, monitoring and a verified backup policy.
