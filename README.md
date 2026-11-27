# System & Server Virtualization Portfolio

**Md. Tanvir Hossain**  
System Administration | Windows & Linux | Virtualization

This is where I keep notes about the server side of my work and the things I am learning: Windows Server, Linux, VMware, virtual machines, storage, backup, maintenance and troubleshooting.

I have worked with live production servers and infrastructure, but I do not publish copies of those environments. Company hostnames, IP plans, backups, credentials and internal details need to stay private. The pages here are a mixture of practical notes, sanitized references and independent lab examples. Where something is a lab exercise, I say so.

Some of these notes started with a problem I needed to understand. Others came from building a lab or reading about a feature I had not used before. I keep the useful commands and checks so I can return to them later. If a step has not been tested on the stated platform, I do not describe it as verified.

## What I cover

| Platform | Topics |
|---|---|
| Windows Server | Installation, AD DS, DNS, DHCP, Group Policy, file services, patching, backup and troubleshooting |
| Ubuntu Server 24.04 LTS | Users, permissions, SSH, networking, storage, services, hosting, hardening and performance |
| RHEL 9 / CentOS 8 | Packages, users, SSH, networking, services, storage, firewalld, SELinux and troubleshooting |
| VMware ESXi | Hardware readiness, hypervisor installation, management networking, datastores, vSwitches and VM lifecycle |

## Browse the repository

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

## A simple lab layout

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

## How I approach server work

Before installing or changing a server, I check what it needs to run: compute, memory, storage, network, DNS, time synchronization, access and backup. I also look at how it will be monitored and how it can be recovered if something goes wrong.

When troubleshooting, I start with the reported symptom and recent changes. Then I check logs, service status, resource usage and dependencies. The cause may be in the hardware, hypervisor, guest OS, storage, network, identity service or application, so I try to isolate it before changing several things at once.

After a fix, I check the service from the user's point of view. For backup work, I want to know whether a restore has actually been tested. A completed backup job is useful, but it does not prove that recovery will work.

## Version notes

- Windows Server pages cover the 2022 and 2025 release families. Check edition, build, licensing and application compatibility.
- Ubuntu pages target Ubuntu Server 24.04 LTS.
- RHEL and CentOS instructions depend on the release and support lifecycle.
- CentOS 8 is end-of-life. It should not be selected for a new production deployment.
- Check VMware hardware and release compatibility before installation.

## Before using an example

The scripts and configuration examples are starting points for learning and controlled testing. Review them before running anything, especially in a production environment. The inventory scripts are read-only, but their output may still contain host or network details, so check it before sharing.

## Related portfolios

- [Network Engineering](https://github.com/thnayem/network-engineering-portfolio)
- [Enterprise IT Operations](https://github.com/thnayem/enterprise-it-operations-portfolio)
- [GitHub profile](https://github.com/thnayem)
- [LinkedIn](https://www.linkedin.com/in/thnayem/)

Maintained by [Md. Tanvir Hossain](https://github.com/thnayem) · [LinkedIn](https://www.linkedin.com/in/thnayem/)


## Authorship, AI assistance and real-world work

The technical work documented here is my own. The decisions, hands-on work, troubleshooting, lab activities, implementation experience and production-related context come from my real work and learning. I do not use AI to invent configurations, incidents, technical results, deployment history or experience claims.

I have used AI assistance in a limited editorial role for some template-style wording, sentence structure and phrasing, and to help organize formal or licensing-related disclaimers and documentation layouts. That assistance does not make the underlying technical work, decisions, lab activity or production experience AI-generated. I remain responsible for the accuracy of what I publish, and I try to distinguish clearly between work I handled in production, sanitized references, and examples I built or tested in a lab.

Some pages use familiar ITSM, ITIL or other framework terminology where it helps explain a process or meet a documentation need. Those references are organizational language, not a claim that every framework was formally adopted or followed in a particular workplace. I prefer practical evidence and honest context over textbook wording or claims that sound impressive but cannot be backed up.
