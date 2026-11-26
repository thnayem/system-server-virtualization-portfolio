# Virtual Machine Provisioning for Infrastructure Services

This catalogue describes service-VM design patterns. Deploy only services needed by the lab; avoid placing every role on one oversized VM.

## Example service catalogue

| VM role | Typical lab starting point* | Key design considerations |
|---|---:|---|
| Windows Server / AD DS, DNS | 2 vCPU, 4–8 GB RAM | Domain/DNS dependency, static IP, time hierarchy, system-state backup |
| DHCP (Windows or Linux) | 1–2 vCPU, 2–4 GB RAM | Scope ownership, failover, DHCP relay and network segmentation |
| Ubuntu web server (Nginx/Apache) | 2 vCPU, 2–4 GB RAM | TLS, reverse proxy, firewall, log rotation |
| Monitoring (Prometheus/Zabbix) | 2–4 vCPU, 4–8 GB RAM | Retention, storage IOPS, alert routing |
| Backup server / repository | Workload-dependent | Separate credentials, immutable/offline copy, restore testing |
| Utility / automation server | 2 vCPU, 2–4 GB RAM | SSH/RDP controls, secrets management, scheduled jobs |

*These are illustrative lab starting points, not production sizing recommendations. Size from measured workload, concurrency, retention and vendor requirements.

## VM creation workflow
1. Confirm service purpose, owner, OS support lifecycle and resource estimate.
2. Select datastore based on capacity, performance, redundancy and backup policy.
3. Create VM with compatible virtual hardware version and supported firmware type.
4. Attach the correct isolated or tagged port group; avoid accidental flat-LAN exposure.
5. Install OS from trusted ISO; install supported VMware Tools / open-vm-tools.
6. Apply hostname, addressing, DNS, NTP, updates and security baseline.
7. Install service role and configure dependencies, access controls and monitoring.
8. Test functionality from a client on the intended network.
9. Document backup, restore, patching, monitoring and decommission process.

## Service examples to document
- Windows: AD DS, DNS, DHCP, Group Policy, file/print services, Windows Admin Center.
- Ubuntu: Nginx/Apache, SFTP, monitoring agent, automation runner, internal package/cache services.
- Shared infrastructure: syslog, NTP, backup repository, monitoring and documentation services.

## VM lifecycle
Use templates only after patching and sanitizing them. Avoid cloning machine identities or domain membership incorrectly. Use snapshots only as short-lived change safety nets, not as backups. Monitor CPU ready, memory ballooning/swapping, datastore latency and capacity. Test application-consistent backup and restore.

## Build documentation

Use the [service VM build sheet](service-vm-build-sheet.md) for each new guest. Record vCPU, RAM, virtual disks, datastore, port group/VLAN, IP/DNS/NTP, backup policy, monitoring and recovery priority.
