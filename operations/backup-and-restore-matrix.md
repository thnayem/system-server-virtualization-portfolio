# Backup and Restore Matrix

A backup design is only complete when the restore process has been tested and the result recorded.

| Workload | What to protect | Recovery consideration |
|---|---|---|
| Windows Server | System state, OS, data volumes, application data | AD-aware/system-state recovery and application consistency |
| Ubuntu Server | Configuration, data, package/service inventory, databases | Rebuild OS cleanly, restore config/data, validate service dependencies |
| VMware ESXi | Host configuration, inventory, VM workloads | Rebuild/restore host config and recover VMs using supported backup method |
| BMC / iDRAC / iLO | Firmware/configuration settings where export is supported | Keep documented network and account recovery procedure |
| File services | Files, ACLs, shares, quotas | Validate ownership, ACLs and application access |
| Databases | Database-native/application-consistent backups | Test point-in-time or full restore as supported |

## Record for every backup job
- System and workload owner.
- Backup method, schedule and retention.
- RPO and RTO.
- Destination and access-control model.
- Encryption and key recovery.
- Last successful backup and last restore test.
- Exceptions, failures and corrective actions.

## Restore test procedure
1. Choose a non-production target or isolated recovery network.
2. Select a known restore point and record its timestamp.
3. Restore the required data/system using the documented procedure.
4. Validate file integrity, permissions, application startup and user-facing function.
5. Record actual recovery time and any data gap.
6. Update the runbook if the procedure was incomplete.

Keep at least one backup copy outside the normal administrator access path. A backup repository that can be deleted by a compromised domain administrator is not an adequate last line of defence.
