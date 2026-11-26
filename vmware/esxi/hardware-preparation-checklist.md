# ESXi Hardware Preparation Checklist

## Server inventory
- [ ] OEM model and support lifecycle recorded
- [ ] CPU model and virtualization extensions confirmed
- [ ] RAM capacity, DIMM population and health checked
- [ ] BIOS/UEFI and BMC firmware reviewed
- [ ] NIC model, firmware and ESXi driver compatibility confirmed
- [ ] Storage controller mode and driver compatibility confirmed
- [ ] Boot device supported by target ESXi release
- [ ] Datastore media and redundancy design documented
- [ ] Redundant PSU and cooling health checked
- [ ] Out-of-band management isolated and access restricted

## Network port plan
| Purpose | Physical uplink | VLAN / subnet | Redundancy |
|---|---|---|---|
| ESXi management | vmnic0 / vmnic1 | Management VLAN | Teaming / failover |
| VM production | vmnic2 / vmnic3 | Workload VLANs | Teaming / failover |
| Storage | Dedicated uplink(s) if required | Storage VLAN | Design-specific |
| vMotion | Dedicated/shared uplink | Migration VLAN | Design-specific |

These are logical examples. Confirm switch configuration, NIC count, licensing, throughput and workload requirements before implementation.

## Change safety
Save current firmware settings, cabling map and switchport configuration. Ensure remote console access before modifying management networking. Never expose BMC or ESXi management to untrusted networks.
