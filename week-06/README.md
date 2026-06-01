# Week 6 — Systems Troubleshooting, Diagnostics & Infrastructure Hardening

## Objective
Diagnose and remediate critical system failures across multiple OSI layers,
then design and deploy a hardened Linux infrastructure environment from
the ground up.

---

## Artifacts
| File | What It Is |
|---|---|
| `readiness_check.log` | OSI troubleshooting diagnostics and remediation log |
| `practical_exam_report.txt` | Commands and methodology for secure file handling |
| `HardenedOutpost_SAD.pdf` | Security Architecture Document for hardened infrastructure |

---

## What I Did
Diagnosed multi-layer system failures across OSI Layers 3, 4, and 7 —
restoring execution permissions, removing conflicting Docker containers
causing port allocation failures, and remediating firewall misconfigurations
blocking outbound traffic. Used `ss`, `nc`, and `ufw` for network-level
diagnostics and documented everything in a readiness assessment log. Under
timed exam conditions, used `find` to locate root-owned sensitive log files
across the filesystem, moved them, and locked them down with `chmod 444`.
Then built out a fully hardened Linux server — disabled root SSH login and
password auth, configured UFW with default-deny rules, deployed a
containerized Nginx stack with Docker Compose, segmented the backend from
external access, and wrote a Python auditing tool to monitor system health.
Documented the entire infrastructure design in a formal Security
Architecture Document.

---

## What It Proves
- I can deploy segmented containerized environments and document them properly
- I understand Linux permissions, container conflicts, and firewall behavior
- I know how to harden Linux systems following real security best practices
- I can perform secure file handling and sensitive data lockdown under pressure
- I can troubleshoot system failures across OSI layers systematically

---

## Outcome
Went from a broken, misconfigured environment to a fully hardened
infrastructure — diagnosed the failures, fixed them, then built something
secure from scratch and documented every decision made along the way.