# Week 2 — Networking & OSI Operations

## Objective
Diagnose and restore a fully sabotaged network by troubleshooting failures
across multiple OSI layers — from downed interfaces all the way up to DNS.

---

## Artifacts
| File | What It Is |
|---|---|
| `briefing.txt` | Summary report of the full outage and remediation |
| `subnet_blueprint.txt` | CIDR corrections and subnet calculations |
| `protocol_audit.txt` | DNS and service-level audit results |
| `tlab_report.txt` | Full outage remediation and TCP handshake proof |

---

## What I Did
Brought a dead network back online by identifying and re-enabling downed
interfaces at the data link layer, then manually rebuilding routing tables
to restore external communication. Ran CIDR analysis to find and fix subnet
misconfigurations that were cutting off gateway access. Audited `/etc/hosts`
to investigate a DNS poisoning scenario and validated that domain resolution
was clean. Captured packet-level evidence of restored connectivity including
TCP handshake validation.

---

## What It Proves
- I can troubleshoot network failures across OSI layers systematically
- I understand subnetting and routing well enough to rebuild them from scratch
- I can identify and remediate DNS-based attacks
- I know how to validate connectivity at the packet level, not just the surface

---

## Outcome
Took a network that was broken at multiple layers simultaneously, worked
through it top to bottom, and restored full connectivity — with packet
capture evidence to prove it.