# Service VM Build Sheet

Use one copy per virtual machine.

| Field | Value |
|---|---|
| VM name | |
| Service / owner | |
| Guest OS and release | |
| vCPU / RAM | |
| Disk layout / datastore | |
| Port group / VLAN | |
| IP / DNS / NTP | |
| Backup policy / retention | |
| Monitoring / alert owner | |
| Patch window | |
| Recovery priority | |

## Build steps
1. Confirm sizing and supported guest OS.
2. Create VM with approved firmware and virtual hardware compatibility.
3. Attach correct port group and datastore.
4. Install guest OS from verified media.
5. Install VMware Tools or open-vm-tools as supported.
6. Apply OS baseline, updates, hostname, DNS and time settings.
7. Deploy service and apply least-privilege access.
8. Validate service from a client on the correct network.
9. Configure monitoring, backup and restore test.
10. Update asset inventory and operational runbook.

## Example lab service roles
- Windows domain controller and DNS (isolated lab domain).
- Ubuntu Nginx web server.
- Monitoring and log collection VM.
- Backup/utility VM with separate credentials and storage.
- Optional test client VM for validation.

Do not use snapshots as a backup substitute. Document service dependencies and recovery order.

---

**A note on this documentation:** The technical work and experience behind these notes are mine. Some wording and the way I have organized the material have had AI assistance, mainly to make the writing clearer and save time. The examples, decisions and work described are not AI-generated. I check what I publish and stand behind it.
