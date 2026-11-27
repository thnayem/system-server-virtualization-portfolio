# Out-of-Band Server Management: iDRAC, iLO and IPMI

Remote hardware management is the recovery path when the operating system or hypervisor is unavailable. I use it for remote console access, power control, hardware inventory, firmware maintenance and health checks.

## What each interface provides

- **Dell iDRAC:** remote console, power operations, hardware inventory, lifecycle/firmware tools and event logs. Exact functions depend on server generation and license.
- **HPE iLO:** remote console, virtual media, power control, health monitoring and firmware functions. Features depend on model and license.
- **IPMI / BMC:** common out-of-band management interface exposed by many server vendors. The web interface and feature set are vendor-specific.

## Initial setup workflow

1. Connect the dedicated BMC/iDRAC/iLO port to a restricted management switch/VLAN.
2. Identify the physical port and confirm whether it is dedicated or shared with a production NIC.
3. Configure a unique static management IP, subnet, gateway, DNS and NTP.
4. Change default credentials immediately; use named accounts and least privilege.
5. Restrict access with firewall/ACL rules to approved admin workstations or a jump host.
6. Enable MFA/central authentication where supported by the platform.
7. Update BMC firmware using the vendor's supported process and maintenance window.
8. Configure alert destinations and review hardware event logs.
9. Test remote console and virtual media before relying on them for recovery.

## Example addressing plan

| Component | Example address | Purpose |
|---|---|---|
| iDRAC / iLO / BMC | 192.0.2.11/24 | Hardware management |
| ESXi management | 192.0.2.12/24 | Hypervisor administration |
| Windows management | 192.0.2.13/24 | Guest OS administration |
| Ubuntu management | 192.0.2.14/24 | Guest OS administration |
| Gateway | 192.0.2.1 | Lab management gateway |

These are documentation-only addresses from a reserved example range. Use a separate management VLAN/subnet in a real deployment. Do not reuse this plan without checking the local IPAM.

## IPMI command examples

Where ipmitool is supported and authorized:

```bash
# Read-only inventory / health examples:
ipmitool mc info
ipmitool chassis status
ipmitool sensor list
ipmitool sel list
```

Power operations are intentionally not included as copy/paste commands. A remote power cycle can interrupt workloads and cause data loss. Use the vendor console only after confirming impact, approval and recovery plan.

## Security essentials

- Never expose BMC management directly to the internet.
- Do not share BMC credentials with OS administrator accounts.
- Disable unused services and legacy protocols where supported.
- Use HTTPS and current firmware; monitor certificate expiry.
- Log administrative actions and review event logs.
- Keep BMC, hypervisor, OS and VM networks separated by policy.

## Troubleshooting

If the BMC is unreachable, check physical link, switch VLAN, IP/subnet/gateway, duplicate IP, ACL/firewall, DNS and BMC health. If the web UI is unavailable but ping works, test HTTPS and review firmware/browser compatibility. Use the server's physical console or vendor-approved recovery procedure if the controller itself is unresponsive.

---

**A note on this documentation:** The technical work and experience behind these notes are mine. Some wording and the way I have organized the material have had AI assistance, mainly to make the writing clearer and save time. The examples, decisions and work described are not AI-generated. I check what I publish and stand behind it.
