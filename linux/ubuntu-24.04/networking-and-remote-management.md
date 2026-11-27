# Ubuntu Server 24.04: Network & Remote Management

## Inspect before editing

```bash
ip -br link
ip -br address
ip route
resolvectl status
networkctl status
ss -tulpn
```

Use the example [Netplan file](netplan-static-ip.example.yaml) as a starting point only. Replace interface name, address, gateway, DNS and search domain with the actual lab values.

## Apply a network change safely

```bash
sudo netplan generate
sudo netplan try
```

When managing a remote server, keep a second SSH session open and have console/iDRAC/iLO/IPMI access available. Confirm the new route and DNS before accepting the change.

## SSH administration

- Use key-based access and named accounts.
- Disable direct root login.
- Restrict SSH to approved management sources using firewall policy.
- Review `/etc/ssh/sshd_config` and drop-in files; validate with `sudo sshd -t`.
- Reload the service only after syntax validation and keep a recovery session open.

```bash
sudo sshd -t
sudo systemctl reload ssh
sudo systemctl status ssh --no-pager
```

## Remote console distinction

SSH is guest OS access. BMC/iDRAC/iLO/IPMI is independent physical hardware access and can remain available even if Ubuntu is not booting, provided the server and BMC have power/network connectivity. Keep the BMC interface on a restricted management segment and never publish its address or credentials.

---

**A note on this documentation:** The technical work and experience behind these notes are mine. Some wording and the way I have organized the material have had AI assistance, mainly to make the writing clearer and save time. The examples, decisions and work described are not AI-generated. I check what I publish and stand behind it.
