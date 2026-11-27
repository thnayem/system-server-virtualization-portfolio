# Storage, Memory and Network Design Blueprint

## A practical way to plan a small server environment

Start with services and recovery requirements, not a shopping list of CPU and RAM. Write down the workload, expected users, data growth, acceptable downtime and restore target. Then size the host and guests with headroom.

## Physical server worksheet

| Area | Questions to answer |
|---|---|
| CPU | Supported generation, core count, virtualization extensions, workload peak |
| RAM | Installed capacity, DIMM layout, ECC support, expected VM memory and headroom |
| Boot | Supported boot device and recovery/reinstall process |
| Storage | RAID/HBA mode, drive type, usable capacity, IOPS/latency and growth |
| Network | NIC count/speed, VLANs, uplink redundancy and management separation |
| BMC | iDRAC/iLO/IPMI address, restricted access, firmware and alerting |
| Power | Dual PSU, UPS runtime, power feeds and graceful shutdown |
| Backup | RPO/RTO, separate target, retention, immutability/offline copy and restore test |

## Example logical network

```text
                    Admin jump host
                          |
                 Management VLAN
                    /          \
              BMC / iDRAC     ESXi vmk0
                  |               |
            Physical server --- ESXi host
                                  |
                         vSwitch / Port Groups
                          /        |        \
                    Server VLAN  Client   Backup VLAN
                       |         VLAN        |
                  Windows VM  Test VM   Backup target
                       |
                 Ubuntu service VM
```

Keep BMC, hypervisor management, guest workloads, storage and backup traffic separate where practical. The exact VLAN and NIC design depends on the physical switch, number of ports, ESXi licensing and security requirements.

## Storage design notes

- RAID 1 is often used for mirrored boot media; RAID 10/6 choices depend on workload, controller and capacity needs.
- RAID is not backup. Keep independent copies and test restore.
- Do not mix disks with different performance/endurance characteristics without understanding the controller's behavior.
- Monitor datastore free space, latency and thin-provisioned growth.
- Plan filesystem and volume growth before a volume reaches capacity.

## Memory design notes

- Populate DIMMs according to OEM channel/rank guidance.
- Reserve host memory and account for hypervisor overhead.
- Avoid aggressive overcommit for latency-sensitive workloads.
- Track guest memory pressure and host swapping/ballooning.
- Size each VM from measured service demand, not arbitrary maximum allocation.

## Network design notes

- Document each physical NIC, switchport, VLAN, port group and VMkernel role.
- Use redundant uplinks where hardware and topology support them.
- Keep management access limited to an admin network.
- Validate MTU end-to-end before enabling jumbo frames.
- Record DNS, NTP, gateway, DHCP relay and firewall dependencies.

## Recovery order

1. Restore power, physical connectivity and BMC access.
2. Validate storage/controller health and hypervisor boot.
3. Restore management networking, DNS and NTP.
4. Restore identity and core network services.
5. Restore application services and user workloads.
6. Validate from a client and document the recovery time.

---

**A note on this documentation:** The technical work and experience behind these notes are mine. Some wording and the way I have organized the material have had AI assistance, mainly to make the writing clearer and save time. The examples, decisions and work described are not AI-generated. I check what I publish and stand behind it.
