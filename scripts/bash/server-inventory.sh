#!/usr/bin/env bash
# Read-only Linux host inventory for learning and first-pass troubleshooting.
# No configuration changes are made. Some commands may be unavailable
# on minimal installations; missing optional tools are skipped.

set -u

section() {
    printf '\n=== %s ===\n' "$1"
}

section "Host"
hostnamectl 2>/dev/null || hostname

section "Operating system"
if [[ -r /etc/os-release ]]; then
    . /etc/os-release
    printf '%s %s\n' "${PRETTY_NAME:-Unknown}" "${VERSION_ID:-}"
fi

section "Network addresses"
if command -v ip >/dev/null 2>&1; then
    ip -brief address
    ip route
else
    echo "ip command not installed"
fi

section "Listening sockets"
if command -v ss >/dev/null 2>&1; then
    ss -tuln
else
    echo "ss command not installed"
fi

section "Storage"
if command -v lsblk >/dev/null 2>&1; then
    lsblk -f
fi
df -hT

section "Memory and load"
free -h 2>/dev/null || true
uptime

section "Failed systemd units"
if command -v systemctl >/dev/null 2>&1; then
    systemctl --failed --no-pager
else
    echo "systemd is not available"
fi

printf '\nInventory complete. Review output before sharing; it may contain host details.\n'
