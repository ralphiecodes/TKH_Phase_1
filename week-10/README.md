# Week 10 — Digital Forensics, Incident Response (DFIR) & SIEM Log Correlation

## Objective
Conduct enterprise-level DFIR operations across the full breach lifecycle —
live host triage, cryptographic evidence handling, memory and disk forensics,
and SIEM log correlation to reconstruct multi-stage attack timelines.

---

## Artifacts
| File | What It Is |
|---|---|
| `attack_timeline.csv` | Chronological attack path from initial access through exfiltration |
| `Incident_Response_Report.md` | Full capstone investigation report for the TitanCorp breach |

---

## What I Did
Accessed quarantined containers and used `netstat -antp` to map suspicious
listening sockets on Port 4444 back to their parent PIDs and malicious
binaries. Generated MD5 and SHA256 hashes for memory dumps and archived
artifacts to establish chain of custody. Used `strings | grep` pipelines
against raw RAM images to expose hidden malicious processes invisible to
the desktop. Used The Sleuth Kit's `fls -r` to parse file system structures
on compromised drives, located deleted file inodes flagged for deletion,
and used `icat` to carve `beacon.exe` directly out of unallocated disk
sectors. On the SIEM side, configured an ELK stack with the
`enterprise_logs*` index pattern and correlated authentication, firewall,
and security logs across multiple servers to reconstruct the full attack
chain — from initial brute-force through Domain Admin lateral movement to
quantified data exfiltration.

---

## What It Proves
- I can track the full attacker kill chain across multiple hosts and log sources
- I know how to perform live triage on a compromised host without tainting evidence
- I can carve deleted files out of raw disk sectors that the OS can no longer see
- I understand chain of custody and cryptographic evidence integrity standards
- I can navigate enterprise SIEM interfaces to isolate IOCs from massive datasets

---

## Outcome
Investigated three simulated corporate breach environments and turned chaotic
log files into a fully verified forensic conclusion — tracked live C2
connections, recovered deleted malware payloads from raw disk sectors, and
mapped the entire breach lifecycle from first failed login to final
exfiltration event.