# Active Directory, DNS and DHCP Lab Reference

## AD DS deployment sequence
1. Plan forest/domain name, DNS namespace, sites/subnets, OU structure and recovery.
2. Configure a static IP and correct DNS/time before promotion.
3. Install AD DS role and required management tools.
4. Promote as a new forest only for a new isolated lab; otherwise add to the existing domain under approved change control.
5. Validate DNS registration, SYSVOL/NETLOGON shares, replication and event logs.
6. Create role-based OUs and delegate narrowly scoped administration.
7. Apply Group Policy in a test OU before broader rollout.

## Illustrative PowerShell (new isolated lab only)
```powershell
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools
# Promotion requires an intentionally selected lab domain and secure credential handling.
# Use the AD DS Configuration Wizard or reviewed Install-ADDSForest parameters.
```

## DNS validation
```powershell
Resolve-DnsName <lab-domain>
Get-DnsServerZone
Get-DnsServerResourceRecord -ZoneName <lab-domain>
```

## DHCP design checklist
- Define subnet, scope range, exclusions, lease duration and reservations.
- Set router, DNS servers, DNS suffix and any required vendor options.
- Plan DHCP relay on Layer 3 gateways where clients are on other subnets.
- Authorize Windows DHCP in AD and configure failover if required.
- Validate lease acquisition, renewal, DNS registration and relay path.

## Health checks
```powershell
dcdiag /v
repadmin /replsummary
repadmin /showrepl
Get-Service NTDS,DNS,Netlogon
```

Never publish real domain names, user lists, SID values, credentials or production DHCP scopes.

---

**A note on this documentation:** The technical work and experience behind these notes are mine. Some wording and the way I have organized the material have had AI assistance, mainly to make the writing clearer and save time. The examples, decisions and work described are not AI-generated. I check what I publish and stand behind it.
