# System & Server Administration Portfolio

**Md. Tanvir Hossain**  
System & Network Administrator | IT Infrastructure & Operations

This repository contains notes and examples from the system administration side of my work: Windows Server, Linux, VMware, virtual machines, storage, backup, maintenance and troubleshooting.

I have supported and maintained live production servers and infrastructure, but this repository is not a copy of those environments. Company configurations, server backups, credentials, private hostnames and internal network details do not belong in a public repository. What I share here is a mix of study notes, sanitized references, independent lab examples and lessons from practical work. A lab procedure should not be read as proof that the same procedure was deployed unchanged in production.

I am still learning different platforms and releases. If a command does not work as expected, I check the version, read the relevant documentation, test a safer approach and record what I find. I would rather be clear about what I have tested than label every example as verified.

## What this repository covers

| Platform | Topics |
|---|---|
| Windows Server | Installation, AD DS, DNS, DHCP, Group Policy, file services, patching, backup and troubleshooting |
| Ubuntu Server 24.04 LTS | Users, permissions, SSH, networking, storage, services, hosting, hardening and performance |
| RHEL 9 / CentOS 8 | Packages, users, SSH, networking, services, storage, firewalld, SELinux and troubleshooting |
| VMware ESXi | Hardware readiness, hypervisor installation, management networking, datastores, vSwitches and VM lifecycle |

## Repository guide

- [Windows Server](windows-server/README.md)
- [Ubuntu Server 24.04 LTS](linux/ubuntu-24.04/README.md)
- [Red Hat Enterprise Linux 9](linux/rhel-9/README.md)
- [CentOS Linux 8 - legacy/EOL](linux/centos-8/README.md)
- [VMware ESXi and hardware setup](vmware/esxi/README.md)
- [Virtual machines for infrastructure services](vmware/virtual-machines/README.md)
- [PowerShell examples](scripts/powershell/README.md)
- [Bash examples](scripts/bash/README.md)
- [Operations and maintenance](operations/README.md)
- [Infrastructure design references](design/README.md)
- [Server operations case studies](case-studies/README.md)

## Example lab layout

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

## How I separate the material

- **Production experience:** A high-level description of work I have been involved in, without company or customer details.
- **Sanitized reference:** A reduced procedure or configuration with sensitive information removed.
- **Lab/demo:** An independent example used to learn or demonstrate a task.
- **Design note:** An explanation of architecture, dependencies and trade-offs.
- **Verification note:** Checks and expected results. The platform and release should be stated when a test has actually been performed.

## How I approach server work

Before installing or changing a server, I look at what it will run and what it depends on. That includes compute, memory, storage, network, DNS, time synchronization, access and backup. I try to use separate administrative access, keep systems patched and monitor capacity and service health.

For troubleshooting, I start with the symptom and its impact. Then I check recent changes, logs, monitoring, resource usage and dependencies. The fault may be in the hardware, hypervisor, guest OS, storage, network, identity service or application, so I try to isolate it before changing anything.

After a fix, I check the service from the user's point of view. For backup work, I also want to know whether a restore has been tested. A successful backup job by itself does not prove that recovery will work.

See the [server operations case studies](case-studies/README.md) for example workflows covering VM availability, Linux capacity, SMB access and restore readiness.

## Things I try to keep in mind

1. Plan CPU, memory, storage, network and recovery before installation.
2. Document management addressing, DNS and NTP settings.
3. Use least privilege and separate administrative accounts.
4. Patch hosts and guests in a planned maintenance window.
5. Keep an eye on capacity, service health, logs, backups and hardware alerts.
6. Test restore procedures, not just backup jobs.
7. Remove hostnames, IP addresses, credentials, serial numbers and organization details before publishing.

## Version notes

- Windows Server pages cover the 2022 and 2025 release families. Check edition, build, licensing and application compatibility.
- Ubuntu pages target Ubuntu Server 24.04 LTS.
- RHEL and CentOS instructions depend on the release and support lifecycle.
- CentOS 8 is end-of-life and should not be selected for a new production deployment.
- Check VMware hardware and release compatibility before installation.

## Before using an example

These pages are references for controlled labs or sanitized documentation. Review commands for your own environment before running them. Do not publish production credentials, private keys, public IPs, internal domain names, customer data or confidential topology.

## Related portfolios

- [Network Engineering](https://github.com/thnayem/network-engineering-portfolio)
- [Enterprise IT Operations](https://github.com/thnayem/enterprise-it-operations-portfolio)
- [GitHub profile](https://github.com/thnayem)
- [LinkedIn](https://www.linkedin.com/in/thnayem/)

Maintained by [Md. Tanvir Hossain](https://github.com/thnayem) · [LinkedIn](https://www.linkedin.com/in/thnayem/)
