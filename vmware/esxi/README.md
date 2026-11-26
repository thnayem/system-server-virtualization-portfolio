# VMware ESXi Installation & Physical Hardware Setup

## Before deployment
Confirm the exact ESXi release is supported by the server model, CPU, NIC, storage controller, firmware and any GPU/HBA. Check the current Broadcom Compatibility Guide and server OEM compatibility matrix. Do not assume that a NIC or RAID controller works because it is physically present.

## Hardware preparation
- Record server model, CPU, RAM population, DIMM channel balance and supported capacity.
- Check BIOS/UEFI version and vendor advisories.
- Enable Intel VT-x/VT-d or AMD-V/IOMMU as required.
- Configure UEFI boot mode and Secure Boot according to the selected ESXi release and OEM guidance.
- Configure RAID/HBA mode only after confirming the controller driver and datastore design.
- Separate boot device from VM datastore where the design and supported hardware permit.
- Identify management, VM, vMotion and storage NICs; map physical ports to switch ports.
- Use redundant power supplies and supported power policy; connect out-of-band management (iDRAC/iLO/IPMI) to a restricted management network.

## ESXi installation
1. Obtain the installer from the authorized Broadcom portal and verify release notes.
2. Boot installation media in the intended UEFI mode.
3. Select the supported boot device; carefully verify the target disk before installation.
4. Complete installation and set a strong unique root credential.
5. Configure management VMkernel interface, VLAN, IPv4 settings, gateway and DNS.
6. Set NTP and host name; verify forward and reverse DNS where applicable.
7. Connect using the supported management interface and apply approved patches.
8. Configure licensing and host lockdown/access policy according to operational needs.

## Post-install validation
- Confirm hardware health, CPU/memory inventory and storage devices.
- Validate management reachability, DNS, NTP and gateway.
- Confirm physical NIC link state, speed/duplex and switch VLAN configuration.
- Create or verify datastores and monitor free capacity.
- Configure vSwitch/Distributed Switch according to licensing and design.
- Validate VM port groups, VLAN IDs, MTU end-to-end and uplink redundancy.
- Configure syslog, monitoring, backup integration and alerting.

## Operational safety
Do not change host networking remotely without a rollback path or out-of-band console. Avoid unsupported USB/SD boot assumptions; check the selected release's boot-device requirements. Never expose ESXi management directly to the public internet.

## Useful checks
Use the Host Client / vCenter UI and supported ESXCLI commands for the installed release. Examples include:
```shell
esxcli system version get
esxcli network nic list
esxcli network ip interface list
esxcli storage filesystem list
esxcli hardware platform get
```

## Maintenance
Use a maintenance window, evacuate workloads where possible, confirm backup and rollback, check release interoperability, patch using the supported lifecycle workflow, reboot if required, then validate host and guest services. Keep firmware/driver/ESXi combinations within vendor-supported baselines.

## Hardware and out-of-band management

- [Physical hardware preparation checklist](hardware-preparation-checklist.md)
- [iDRAC, iLO and IPMI setup and operations](idrac-ilo-ipmi-out-of-band.md)

Keep the BMC/iDRAC/iLO management plane separate from ESXi and guest networks. Restrict access to authorized administrators and document the recovery path.
