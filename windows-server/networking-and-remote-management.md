# Windows Server Network & Remote Management

## Configure and verify a server NIC

```powershell
Get-NetAdapter
Get-NetIPConfiguration
Get-NetRoute -AddressFamily IPv4
Get-DnsClientServerAddress
```

Example static IPv4 setup for a lab only. Confirm the interface alias and make sure the address is reserved for this host:

```powershell
New-NetIPAddress -InterfaceAlias "Ethernet" -IPAddress "192.0.2.10" -PrefixLength 24 -DefaultGateway "192.0.2.1"
Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses "192.0.2.53"
```

Validate:

```powershell
Test-NetConnection 192.0.2.1
Resolve-DnsName lab.example
Test-NetConnection 192.0.2.53 -Port 53
Get-NetAdapterStatistics
```

## Remote administration

Use Windows Admin Center, Server Manager or PowerShell Remoting from a secured management network. Enable only the required firewall rules and restrict source addresses. Do not expose WinRM or RDP directly to the public internet.

```powershell
# Inspect WinRM state and listeners:
winrm enumerate winrm/config/listener
Get-NetFirewallRule -DisplayGroup "Remote Desktop" -ErrorAction SilentlyContinue
```

Enable remoting only after applying the organization's authentication, certificate, firewall and access-control requirements. In a workgroup, avoid broad TrustedHosts entries; prefer domain authentication or properly configured HTTPS.

## BMC vs Windows management

RDP/WinRM manage the operating system. iDRAC/iLO/IPMI manages the physical server independently of Windows. Keep these credentials and network paths separate. Use BMC console access for OS boot/recovery when the network stack or Windows itself is down.

---

**A note on this documentation:** The technical work and experience behind these notes are mine. Some wording and the way I have organized the material have had AI assistance, mainly to make the writing clearer and save time. The examples, decisions and work described are not AI-generated. I check what I publish and stand behind it.
