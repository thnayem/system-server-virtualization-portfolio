# Infrastructure Design References

## Small virtualized lab - logical layout
```text
             Admin / Jump workstation
                       |
             Restricted management VLAN
                       |
             ESXi management VMkernel
                       |
                 ESXi physical host
             /          |           \
       VM network   Storage path   OOB management
           |
    -------------------------
    |           |           |
 Windows VM  Ubuntu VM  Monitoring VM
 AD/DNS      Web/SFTP    Metrics/Logs
    |
 Lab client / test subnet
```

## Design decisions to document
- Compute: CPU generation, core count, RAM capacity and memory headroom.
- Storage: boot media, datastore type, RAID/HBA, usable capacity, latency and backup target.
- Network: management separation, VM VLANs, uplink redundancy, MTU and firewall boundaries.
- Identity: domain/DNS design, local break-glass access and privileged account separation.
- Resilience: backup copies, restore objectives, host failure impact and recovery order.
- Operations: monitoring, syslog, patch windows, asset lifecycle and runbooks.

## Security boundaries
Keep hypervisor management, out-of-band management, guest workloads and user access appropriately segmented. Apply least privilege and restrict management planes to authorized admin sources. A single-host lab is not highly available; clearly document this limitation.

## Detailed infrastructure blueprint

See [Storage, Memory and Network Design Blueprint](storage-memory-network-blueprint.md) for physical host planning, DIMM/RAM considerations, RAID/HBA and datastore planning, VLAN separation, BMC management and recovery order.

---

**A note on this documentation:** The technical work and experience behind these notes are mine. Some wording and the way I have organized the material have had AI assistance, mainly to make the writing clearer and save time. The examples, decisions and work described are not AI-generated. I check what I publish and stand behind it.
