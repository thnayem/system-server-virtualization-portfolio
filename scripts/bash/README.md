# Bash Administration Examples

[server-inventory.sh](server-inventory.sh) gathers a first-pass Linux host inventory. It reads system information and does not change configuration.

Run it with:

```bash
bash server-inventory.sh
```

The script uses common tools such as `hostnamectl`, `ip`, `ss`, `lsblk`, `df`, `free` and `systemctl`. If an optional tool is missing, the script skips that check or reports it.

## Useful commands

```bash
ip -br address
ip route
ss -tulpn
lsblk -f
df -hT
free -h
uptime
systemctl --failed
```

For recent warnings:

```bash
journalctl -p warning -b --no-pager | tail -n 100
```

Package updates should be handled through the system's normal change and maintenance process. Review command output before sharing it; it can contain host and network details.

---

**A note on this documentation:** The technical work and experience behind these notes are mine. Some wording and the way I have organized the material have had AI assistance, mainly to make the writing clearer and save time. The examples, decisions and work described are not AI-generated. I check what I publish and stand behind it.
