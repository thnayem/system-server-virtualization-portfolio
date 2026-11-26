# Bash Administration Examples

Examples are read-only diagnostics unless stated. Review commands before use.

## Host, network and storage inventory
```bash
hostnamectl
ip -br address
ip route
ss -tulpn
lsblk -f
df -hT
free -h
uptime
```

## Recent warnings and failed units
```bash
systemctl --failed
journalctl -p warning -b --no-pager | tail -n 100
```

## Package maintenance
```bash
sudo apt update
apt list --upgradable
```
Apply upgrades only under your change and maintenance policy. Keep secrets out of scripts and repository history.
