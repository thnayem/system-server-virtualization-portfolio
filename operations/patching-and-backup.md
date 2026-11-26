# Patching, Backup and Recovery Runbook

## Before patching
- Confirm change approval, scope, release notes and known issues.
- Check backup completion and restore point integrity.
- Confirm console/out-of-band access and rollback method.
- Check cluster/host capacity and application dependencies.
- Notify users and schedule the maintenance window.

## Execution
1. Patch one non-critical system first where possible.
2. Monitor installation, reboot and service startup.
3. Validate OS health, DNS, authentication, storage, network and application.
4. Continue staged rollout only after acceptance checks pass.
5. Record versions, timestamps, issues and deviations.

## Backup principles
- Follow the 3-2-1 principle where feasible, with an offline or immutable copy.
- Protect backup administration credentials separately from production identity.
- Include system state/application-consistent backup where required.
- Define RPO/RTO with service owners.
- Test file-level and full-system recovery periodically.

## Restore test record
Record system, restore point, recovery method, start/end time, data integrity checks, application validation, actual recovery time, issues and corrective actions.
