# System & Server Administration Portfolio

**System & Network Administrator | Multi-Vendor IT Infrastructure & Operations**

A documentation-first portfolio covering Windows Server, Ubuntu Server 24.04 LTS, RHEL 9, CentOS 8, VMware ESXi, virtualization, storage, backup, maintenance, security and service hosting.

## Five-minute overview

- **Systems:** Windows Server, Linux administration, VMware ESXi and virtual machine operations.
- **Infrastructure tasks:** Installation, configuration, patching, storage, networking, backup/restore, monitoring and troubleshooting.
- **Operational approach:** Understand service impact, check evidence and dependencies, plan changes, prepare recovery and validate the service after work.
- **Learning approach:** Use labs to test procedures, consult platform documentation, troubleshoot unexpected results and record what worked. Lab examples are not represented as production deployments.

## Platforms

| Platform | Coverage |
|---|---|
| Windows Server | Installation, AD DS, DNS, DHCP, Group Policy, file services, patching, backup and troubleshooting |
| Ubuntu Server 24.04 LTS | Users, permissions, SSH, networking, storage, services, hosting, hardening and performance |
| RHEL 9 / CentOS 8 | Package management, users, SSH, networking, services, storage, firewalld, SELinux and troubleshooting |
| VMware ESXi | Hardware readiness, hypervisor installation, management networking, datastores, vSwitches, VM deployment and lifecycle |

## Repository map

- [Windows Server](windows-server/README.md)
- [Ubuntu Server 24.04 LTS](linux/ubuntu-24.04/README.md)
- [Red Hat Enterprise Linux 9](linux/rhel-9/README.md)
- [CentOS Linux 8 (legacy / EOL)](linux/centos-8/README.md)
- [VMware ESXi and hardware setup](vmware/esxi/README.md)
- [Virtual machines for infrastructure services](vmware/virtual-machines/README.md)
- [PowerShell examples](scripts/powershell/README.md)
- [Bash examples](scripts/bash/README.md)
- [Operations and maintenance](operations/README.md)
- [Infrastructure design references](design/README.md)
- [Server operations case studies](case-studies/README.md)

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

## How to read the material

- **Production experience:** Describes areas of work I have been involved in, without disclosing employer or customer details.
- **Sanitized reference:** A reduced configuration or procedure with sensitive information removed.
- **Lab/demo:** An independently tested learning example. It is not evidence of production deployment.
- **Design note:** Explains architecture, dependencies and trade-offs.
- **Verification note:** Lists checks, expected results and recovery considerations.

A lab result should identify the platform/release and what was actually tested. If a command or workflow has not been tested on the stated version, it should be labelled as a reference for review rather than a verified procedure.

## Working principles

1. Plan compute, memory, storage, network and recovery before installation.
2. Use documented management addressing, DNS and NTP settings.
3. Apply least privilege and separate administrative accounts.
4. Patch hosts and guests using a controlled maintenance window.
5. Monitor capacity, service health, logs, backups and hardware alerts.
6. Test restore procedures; a successful backup job alone is not proof of recoverability.
7. Sanitize hostnames, IP addresses, credentials, serial numbers and organization details before publishing.

## Troubleshooting approach

I start with the user-visible symptom and service impact. Then I check recent changes, monitoring, logs, capacity and dependencies. I narrow the fault to hardware, hypervisor, guest OS, storage, network, identity or application before making a change. After recovery, I verify the service from the user's perspective and record the cause, actions and follow-up.

See [server operations case studies](case-studies/README.md) for example workflows covering VM service availability, Linux capacity, SMB access and restore readiness.

## Documentation standard

New and updated technical pages follow [DOCUMENTATION-GUIDE.md](./DOCUMENTATION-GUIDE.md): purpose, evidence type, architecture, commands/configuration, explanation, troubleshooting, verification, rollback and lessons learned.

## Version and lifecycle notes

- Windows Server documentation covers the 2022 and 2025 release families. Select edition/build according to licensing and application compatibility.
- Ubuntu documentation targets Ubuntu Server 24.04 LTS.
- RHEL and CentOS references identify platform administration topics. Check lifecycle and support status before selecting a release for a new deployment.
- CentOS 8 is legacy/EOL; do not treat it as a recommended new production platform.
- VMware hardware and release compatibility must be checked against the relevant compatibility guide.

## Disclaimer

Examples are reference material for controlled labs or sanitized documentation. Review commands for your environment before execution. Do not publish production credentials, private keys, public IPs, internal domain names, customer data or confidential topology details.

Maintained by [Md. Tanvir Hossain](https://github.com/thnayem) · [LinkedIn](https://www.linkedin.com/in/thnayem/)
