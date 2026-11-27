# CentOS Linux 8 Administration Reference

This page is specifically about **CentOS Linux 8**, not CentOS Stream 8.

> **Lifecycle warning:** CentOS Linux 8 reached end of life on 31 December 2021. It no longer receives normal security updates from the CentOS project. Do not select it for a new production deployment. Plan migration to a currently supported operating system, such as an appropriate RHEL release, Rocky Linux, or AlmaLinux, after checking application and vendor compatibility.

This reference is retained for legacy-system administration, migration assessment, and controlled lab work. It is not an endorsement to keep an internet-facing CentOS Linux 8 server in service.

## Identify the exact platform

```bash
cat /etc/centos-release
cat /etc/os-release
uname -r
rpm -q centos-linux-release
```

Do not assume CentOS Linux 8 and CentOS Stream 8 have the same lifecycle, repositories, or update path.

## Package inventory and legacy package management

```bash
rpm -qa | sort
dnf repolist --all
dnf history
dnf info <package>
```

Because CentOS Linux 8 is end of life, normal mirror availability and package update behavior may differ from a supported release. Avoid blindly replacing repository files or importing third-party mirror configurations. Preserve a system inventory and assess migration rather than treating archived packages as current security updates.

## Users, permissions and SSH

```bash
getent passwd
getent group
id <username>
sudo -l -U <username>
sshd -T
systemctl status sshd
```

Review local and directory-backed accounts, sudo privileges, SSH exposure, key management, and firewall access. Do not disable authentication controls to work around access issues.

## NetworkManager and network diagnostics

```bash
nmcli device status
nmcli connection show
ip -br address
ip route
ss -tulpn
ping -c 4 <gateway>
getent hosts <hostname>
```

For remote network changes, preserve console or out-of-band access and record a rollback before applying a new connection profile.

## Services, logs and firewall

```bash
systemctl --failed
systemctl status <service>
journalctl -p warning -b
journalctl -u <service> --since "1 hour ago"
firewall-cmd --state
firewall-cmd --get-active-zones
firewall-cmd --list-all
```

Confirm actual service dependencies and firewall zones before making changes.

## SELinux and storage checks

```bash
getenforce
sestatus
ls -Z /path/to/file
ausearch -m AVC -ts recent
lsblk -f
df -hT
pvs
vgs
lvs
```

Investigate SELinux denials and correct labels or policy where appropriate. Check filesystem and LVM capacity before storage changes.

## Legacy-server operational and migration checklist

- Identify application owners, business dependencies, service ports and external integrations.
- Inventory installed packages, repositories, kernel, services, scheduled jobs and local modifications.
- Record users, groups, sudo rules, SSH keys, certificates and firewall requirements securely.
- Confirm backup integrity and complete a test restore in an isolated environment.
- Build a supported target OS and test application compatibility, authentication, monitoring and backup.
- Plan data migration, DNS/IP cutover, rollback, stakeholder communication and post-migration validation.
- Restrict network exposure while the legacy host remains operational and obtain an approved retirement date.

## Validation boundary

This is a legacy administration and migration reference. It does not claim that the commands or procedures were executed on a particular production server. Validate against the exact host state and maintain a supported security baseline.
