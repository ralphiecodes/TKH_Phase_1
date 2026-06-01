# Week 1 — Linux Security Foundations

## Objective
Get hands-on with Linux security fundamentals — system enumeration,
permission hardening, and pulling threat intelligence straight from logs.

---

## Artifacts
| File | What It Is |
|---|---|
| `discovery.txt` | Filesystem recon and extracted secrets |
| `final_threat_report.txt` | Forensic report built from compromised log data |
| `harden.sh` | Hardening script that fixes the access control gaps I found |
| `threat_ips.txt` | Attacker IPs pulled from log analysis |

---

## What I Did
Navigated the Linux filesystem to find sensitive data and hidden artifacts
the way an attacker would after gaining access. Found critical permission
misconfigurations — including exposed `/etc/shadow` access — and wrote a
script to lock it all down. Used `grep`, `awk`, and `sort` to parse log
files, track attacker activity, and compile a clean forensic report from
the evidence.

---

## What It Proves
- I can navigate and audit a Linux system under pressure
- I understand how file permission vulnerabilities get exploited
- I can extract IOCs from raw logs using command-line tooling
- I know how to handle forensic evidence and document findings cleanly

---

## Outcome
Took a compromised Linux environment, identified exactly what was broken,
fixed it, and produced forensic artifacts that tell the full story of what
happened.