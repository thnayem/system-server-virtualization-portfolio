# Server Operations & Maintenance

## Daily
- Check monitoring alerts, critical services, host availability and backup job status.
- Review capacity thresholds, failed jobs and high-severity events.
- Confirm no unexpected privileged access or configuration changes.

## Weekly
- Review OS/security updates and plan maintenance windows.
- Check disk growth, datastore capacity, log retention and certificate expiry.
- Review hardware health and monitoring trends.

## Monthly
- Apply approved patches to hosts and guests using staged rollout.
- Review accounts, groups, sudoers, RDP/SSH exposure and firewall rules.
- Validate backup retention and perform a restore test.
- Review asset inventory, warranty/support status and configuration documentation.

## Change record template
| Field | Record |
|---|---|
| Change ID / date | |
| System / service | |
| Business reason | |
| Risk and impact | |
| Pre-check and backup | |
| Implementation steps | |
| Validation | |
| Rollback plan | |
| Approval / owner | |

## Incident troubleshooting flow
1. Define impact, start time and affected service/users.
2. Check monitoring, recent changes, dependencies and physical/virtual host health.
3. Isolate the layer: power/hardware, hypervisor, network, OS, identity, storage or application.
4. Collect logs and timestamps before changing state.
5. Apply the smallest reversible fix; communicate status.
6. Verify from a client perspective and monitor for recurrence.
7. Record root cause, corrective action and preventive follow-up.

## Backup and restore

Use the [Backup and Restore Matrix](backup-and-restore-matrix.md) to document workload-specific protection, RPO/RTO, retention, recovery validation and restore-test evidence. Also see [Patching and Backup Runbook](patching-and-backup.md).

---

**A note on this documentation:** The technical work and experience behind these notes are mine. Some wording and the way I have organized the material have had AI assistance, mainly to make the writing clearer and save time. The examples, decisions and work described are not AI-generated. I check what I publish and stand behind it.
