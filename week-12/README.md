# Week 12 — Portfolio Capstone, Threat Hardening & Final Review Submission

## Objective
Close out Phase 1 by auditing all twelve weeks of engineering artifacts,
executing final network hardening operations, and delivering a clean,
professional-grade public portfolio repository.

---

## Artifacts
| File | What It Is |
|---|---|
| `tepp_postmortem.md` | End-of-phase report covering vulnerabilities, remediation logs, and post-incident analysis |
| `portfolio_audit.md` | Final repository audit with compliance verification and professional reflection |

---

## What I Did
Hardened exposed Redis instances by binding them to localhost and injecting
cryptographic access tokens. Tracked down and killed unauthorized FTP daemons
running in the background using `pkill`. Fixed world-writable permissions on
`/var/log` to protect audit trail integrity. Analyzed `auth.log` during live
brute-force simulations to identify attacker source IPs and wrote iptables
drop rules to block them in real time. Identified command injection
vulnerabilities in a Python HTTP server, crafted URL-encoded payloads to
exploit them, and caught the reverse shell with a Netcat listener on port
4444. Parsed `access.log` post-exploitation to extract PID and User-Agent
metadata. Then audited every folder from `week-01` through `week-11` to
verify artifacts and documentation were complete before final submission.

---

## What It Proves
- I can pivot between offensive exploitation and defensive remediation in the same environment
- I know how to harden infrastructure at the service, permission, and network level
- I can analyze logs and extract IOCs during active attack simulations
- I can translate twelve weeks of technical work into clean, reviewable documentation
- I maintain professional version control standards across an entire program

---

## Outcome
Audited and locked down all Phase 1 lab environments, verified every artifact
in the repository, and delivered a public portfolio that documents the full