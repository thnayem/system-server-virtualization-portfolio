# Ubuntu Server 24.04: Storage, LVM, Memory & Backup

## 1. Inspect disks before changing anything

```bash
lsblk -o NAME,SIZE,TYPE,FSTYPE,MOUNTPOINTS,MODEL
sudo fdisk -l
sudo pvs
sudo vgs
sudo lvs -a -o +devices
df -hT
findmnt
```

Confirm the target disk by model, size and serial through the local console or asset record. Never copy a device name from another server and assume it is correct.

## 2. LVM lab example

The following example assumes a **new, empty disk at /dev/sdb**. It is destructive to existing data on that disk. Verify with `lsblk` first and use a disposable lab VM.

```bash
# Example only - destroys existing signatures/data on /dev/sdb:
sudo pvcreate /dev/sdb
sudo vgcreate vg_data /dev/sdb
sudo lvcreate -n lv_apps -L 20G vg_data
sudo mkfs.ext4 /dev/vg_data/lv_apps
sudo mkdir -p /srv/apps
sudo blkid /dev/vg_data/lv_apps
```

Use the UUID returned by `blkid` in /etc/fstab, rather than relying on a device path:

```text
UUID=<filesystem-uuid>  /srv/apps  ext4  defaults,nofail  0  2
```

Validate before reboot:

```bash
sudo findmnt --verify
sudo mount -a
df -hT /srv/apps
```

### Extend a logical volume

Check free extents first with `vgs`. If the volume group has free space, extend the LV and filesystem:

```bash
sudo lvextend -r -L +5G /dev/vg_data/lv_apps
sudo lvs
df -hT /srv/apps
```

The `-r` option asks LVM to resize the filesystem as well. Confirm filesystem support and backup before resizing. Shrinking filesystems requires a different, filesystem-specific process and should not be improvised.

## 3. Memory and swap observation

```bash
free -h
vmstat 1 10
cat /proc/meminfo | head -n 20
ps aux --sort=-%mem | head
swapon --show
```

Look for sustained swap-in/swap-out, memory pressure and the process responsible. Do not apply random sysctl or swappiness values as a substitute for understanding the workload. Size RAM and swap based on service requirements and observed usage.

## 4. Network configuration with Netplan

A sample static configuration is included in [netplan-static-ip.example.yaml](netplan-static-ip.example.yaml). First identify the actual interface:

```bash
ip -br link
ip -br address
ip route
resolvectl status
```

After adapting the YAML, validate and apply carefully:

```bash
sudo netplan generate
sudo netplan try
# Confirm the connection remains reachable, then accept the change.
```

Use console/iDRAC/iLO/IPMI access when changing a remote server's management address. Keep a rollback path. Avoid multiple default routes unless policy routing is intentionally designed.

## 5. Backup options

- Use a file-level tool such as rsync for controlled file copies.
- Use a backup platform that supports application-consistent database backups for databases.
- Keep backup credentials separate from normal server admin accounts.
- Keep a second/offline/immutable copy and monitor repository capacity.
- Test restores to a separate location before relying on the backup.

Example dry-run for a lab directory (destination must be reviewed):

```bash
sudo rsync -aHAX --numeric-ids --dry-run /srv/data/ /mnt/backup-lab/data/
```

Remove `--dry-run` only after confirming source, destination, permissions, exclusions and backup policy. Rsync alone does not provide immutability or a complete disaster-recovery system.

## 6. Disk and filesystem maintenance

```bash
df -hT
df -ih
sudo smartctl -a /dev/sda   # Requires smartmontools and a supported device/controller
journalctl -k -p warning
sudo du -xhd1 /var | sort -h
```

Check controller/vendor health tools for RAID status; guest OS SMART visibility may be incomplete behind hardware RAID or a virtual disk.

---

**A note on this documentation:** The technical work and experience behind these notes are mine. Some wording and the way I have organized the material have had AI assistance, mainly to make the writing clearer and save time. The examples, decisions and work described are not AI-generated. I check what I publish and stand behind it.
