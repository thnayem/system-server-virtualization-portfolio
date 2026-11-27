# Red Hat Enterprise Linux 9 Administration

A practical administration reference for RHEL 9 systems. Examples are intended for controlled labs and must be checked against the installed minor release, enabled repositories, subscription state, and local security policy.

## Platform and subscription checks

```bash
cat /etc/redhat-release
cat /etc/os-release
uname -r
subscription-manager status
subscription-manager repos --list-enabled
```

RHEL package access and repository availability depend on the system's registration and entitlement model. Do not copy repository configuration from an unrelated host.

## Package and update management

```bash
sudo dnf repolist
sudo dnf check-update
sudo dnf info <package>
sudo dnf install <package>
sudo dnf updateinfo list
sudo dnf history
```

Review advisories and application compatibility before applying updates. Use approved maintenance windows and confirm reboot requirements.

## Users, groups and permissions

```bash
sudo useradd <username>
sudo passwd <username>
sudo usermod -aG <group> <username>
id <username>
getent passwd <username>
getent group <group>
namei -l /path/to/file
getfacl /path/to/file
```

Grant only the access required. Review sudo rules and group membership before granting administrative privileges.

## Networking with NetworkManager

```bash
nmcli device status
nmcli connection show
ip -br address
ip route
resolvectl status
sudo nmcli connection modify "<connection>" ipv4.method manual ipv4.addresses <address/prefix> ipv4.gateway <gateway> ipv4.dns "<dns1> <dns2>"
sudo nmcli connection up "<connection>"
```

Before changing a remote management interface, confirm console or out-of-band access, record the current profile, and prepare a rollback. Validate address, gateway, DNS, routing, and application reachability after the change.

## Services, logs and firewall

```bash
systemctl --failed
systemctl status <service>
sudo systemctl enable --now <service>
journalctl -u <service> --since "1 hour ago"
sudo firewall-cmd --state
sudo firewall-cmd --get-active-zones
sudo firewall-cmd --list-all
sudo firewall-cmd --add-service=https --permanent
sudo firewall-cmd --reload
```

Only open required services in the correct firewalld zone. Confirm the active zone and source scope before changing firewall policy.

## SELinux

```bash
getenforce
sestatus
ls -Z /path/to/file
sudo restorecon -Rv /path/to/path
sudo ausearch -m AVC -ts recent
```

Keep SELinux enforcing where supported. Diagnose denials and correct labels or policy; do not disable SELinux as a routine troubleshooting shortcut.

## Storage and LVM

```bash
lsblk -f
df -hT
pvs
vgs
lvs
sudo vgs
sudo lvs -a -o +devices
```

Plan capacity and filesystem growth carefully. Confirm backups, free extents, filesystem type, mount points, and recovery options before modifying partitions or logical volumes.

## Operational verification checklist

- Confirm OS release, kernel, registration and enabled repositories.
- Review failed services, system logs and security advisories.
- Verify hostname, IP addressing, routes, DNS and time synchronization.
- Review privileged users, sudo access, SSH settings and firewall zones.
- Confirm SELinux mode and investigate AVC denials.
- Check filesystems, LVM capacity, inode usage and storage alerts.
- Verify monitoring and backup jobs; perform a controlled restore test.
- Record change approval, pre-checks, implementation, post-checks and rollback.

## Validation boundary

These are generic administration references, not a record of a specific production change. Validate command options and service behavior against the exact RHEL 9 minor release and organizational standards. Never publish subscription credentials, activation keys, private keys, internal hostnames, or unredacted configuration.

---

**A note on this documentation:** The technical work and experience behind these notes are mine. Some wording and the way I have organized the material have had AI assistance, mainly to make the writing clearer and save time. The examples, decisions and work described are not AI-generated. I check what I publish and stand behind it.
