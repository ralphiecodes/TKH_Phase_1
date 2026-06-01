# Week 3 — Security Automation with Python

## Objective
Build custom Python tools to detect, analyze, and respond to security
threats — automating the work that would otherwise be done manually.

---

## Artifacts
| File | What It Is |
|---|---|
| `brute_detector.py` | Brute-force detection and log filtering script |
| `brute_report.txt` | Detection results output |
| `incident_response.py` | Automated threat detection and JSON reporting |
| `port_check.py` | Network port scanning tool |



---

## What I Built
Wrote a port scanner from scratch using Python sockets to identify open
and closed services across multiple hosts. Built a log analysis script
that detects brute-force authentication attempts and pulls the relevant
entries automatically. Used subprocess to audit running system processes
and flag anomalies. Tied it all together with an end-to-end incident
response script that extracts attacker IPs from logs and outputs
structured JSON alerts ready for downstream analysis.

---

## What It Proves
- I can build custom security tooling in Python from the ground up
- I know how to automate log analysis and threat detection workflows
- I understand process monitoring and what anomalous behavior looks like
- I can produce structured, machine-readable outputs that fit real pipelines

---

## Outcome
Built a full security automation pipeline — from raw log input to
structured threat intelligence output — capable of detecting attack
patterns and extracting IOCs without manual intervention.