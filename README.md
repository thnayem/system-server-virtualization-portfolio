# System & Server Administration Portfolio

**System & Network Administrator | Multi-Vendor IT Infrastructure & Operations**

A practical, documentation-first portfolio covering Windows Server, Ubuntu Server 24.04 LTS, VMware ESXi, virtualization, infrastructure operations, maintenance, security, performance tuning, and service hosting.

> **Portfolio integrity:** This repository contains sanitized lab procedures, reusable configuration examples, checklists, and reference designs. Lab documentation is not a claim that every procedure was deployed in a production environment.

## Platforms

| Platform | Coverage |
|---|---|
| Windows Server | Installation, initial configuration, AD DS, DNS, DHCP, Group Policy, file services, patching, backup, monitoring and troubleshooting |
| Ubuntu Server 24.04 LTS | Installation, users and permissions, SSH, networking, storage, services, web hosting, hardening, maintenance and performance tuning |
| VMware ESXi | Hardware readiness, firmware/BIOS setup, hypervisor installation, management networking, datastores, vSwitches, VM deployment and lifecycle operations |

## Repository map

- [Windows Server](windows-server/README.md)
- [Ubuntu Server 24.04 LTS](linux/ubuntu-24.04/README.md)
- [VMware ESXi and hardware setup](vmware/esxi/README.md)
- [Virtual machines for infrastructure services](vmware/virtual-machines/README.md)
- [PowerShell examples](scripts/powershell/README.md)
- [Bash examples](scripts/bash/README.md)
- [Operations and maintenance](operations/README.md)
- [Infrastructure design references](design/README.md)

## Lab architecture

```text
                 Admin workstation
                        |
                 Management network
                        |
                VMware ESXi host
                 /      |       \
          Datastore  vSwitch   Physical NICs
                 |      |
          Virtual machines
           /      |       \
     Windows   Ubuntu    Service VMs
      Server   Server   (DNS/Web/Monitoring/
                        Backup/Utility)
```

## Working principles

1. Plan compute, memory, storage, network and recovery before installation.
2. Use static management addressing and documented DNS/NTP settings.
3. Apply least privilege and separate administrative accounts.
4. Patch hosts and guests using a controlled maintenance window.
5. Monitor capacity, service health, logs, backups and hardware alerts.
6. Test restore procedures; a successful backup job alone is not proof of recoverability.
7. Sanitize hostnames, IP addresses, credentials, serial numbers and organization details before publishing.

## Version notes

- **Windows Server 2024 is not an official Microsoft product release name.** The Windows guide therefore covers the supported Windows Server 2022 and Windows Server 2025 release families. Choose the exact edition/build according to licensing and compatibility requirements.
- Ubuntu documentation targets **Ubuntu Server 24.04 LTS**.
- VMware ESXi release and hardware compatibility must be checked against the current VMware/Broadcom Compatibility Guide before deployment. This repository avoids claiming compatibility for unspecified hardware.

## Disclaimer

Examples are reference material for controlled labs. Review commands for your environment before execution. Do not paste production credentials, private keys, public IPs, internal domain names, customer data, or confidential topology details into this public repository.

---
Maintained by [Md. Tanvir Hossain](https://github.com/thnayem) · [LinkedIn](https://www.linkedin.com/in/thnayem/)
