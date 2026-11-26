# Ubuntu Server 24.04 LTS: Installation, Maintenance & Tuning

## Installation
1. Download the Ubuntu Server 24.04 LTS ISO from the official Ubuntu site and verify its checksum.
2. Confirm CPU virtualization support, RAM, storage, NIC drivers and firmware settings.
3. Choose minimal or required package set; plan partitions/LVM and filesystem capacity.
4. Configure hostname, static address or DHCP reservation, DNS, gateway and time zone.
5. Create a named admin account; use SSH keys and avoid routine root login.
6. Apply updates, enable only required services and document the baseline.

## First boot baseline
```bash
sudo apt update
sudo apt full-upgrade
sudo reboot
hostnamectl
ip -br address
ip route
resolvectl status
timedatectl
lsblk -f
df -hT
```

## Administration topics
- Users, groups, sudo policy, file ownership, ACLs and permissions.
- SSH hardening, key authentication, restricted management access and UFW/nftables.
- Netplan networking, static routes, DNS resolver configuration and troubleshooting.
- Storage: partitions, filesystems, mount units, LVM and capacity monitoring.
- systemd services, timers, journal logs and boot diagnostics.
- Package management, unattended security updates and controlled kernel upgrades.
- Web services (Nginx/Apache), TLS certificate lifecycle and reverse proxy concepts.
- Backup/restore, rsync, database-aware backup and recovery testing.

## Service health and diagnostics
```bash
systemctl --failed
systemctl status <service>
journalctl -p warning -b
journalctl -u <service> --since "1 hour ago"
ss -tulpn
free -h
uptime
top
df -h
du -xhd1 /var
sudo ufw status verbose
```

## SSH baseline example
Review the effective configuration and validate in a second session before closing your existing access:
```text
PermitRootLogin no
PubkeyAuthentication yes
PasswordAuthentication no
AllowUsers <admin-user>
```
Place overrides in an appropriate sshd_config drop-in where supported. Test with `sudo sshd -t`, then reload SSH. Ensure console or out-of-band access is available to avoid lockout.

## Performance tuning method
1. Establish a workload baseline before changing settings.
2. Identify bottleneck using CPU, memory, disk latency/IOPS, network throughput and application metrics.
3. Check top processes, load, swap activity, filesystem capacity and kernel/system logs.
4. Tune only the constrained layer: application worker limits, database settings, filesystem/storage, network queueing or VM resources.
5. Change one variable at a time; record before/after measurements and rollback.
6. Avoid copying generic sysctl or swappiness values without workload evidence.

## Maintenance checklist
- Security updates and planned reboot cadence.
- Disk, inode, RAID and filesystem health.
- Failed systemd units, log growth and certificate expiry.
- Backup completion and periodic restore test.
- User/sudo review, SSH access review and firewall audit.
- Capacity and performance trend review.

## Lab evidence
Publish sanitized Netplan examples, service unit examples, shell output, benchmark methodology and troubleshooting case studies. Do not publish private keys, password hashes, tokens or real internal addresses.
