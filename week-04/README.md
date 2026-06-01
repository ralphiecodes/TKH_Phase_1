# Week 4 — Containerization & Secure Deployment

## Objective
Design and secure containerized environments using isolation, network
segmentation, and automated deployment — reducing attack surface at the
infrastructure level.

---

## Artifacts
| File | What It Is |
|---|---|
| `deploy_web.sh` | Automated Docker deployment script |
| `docker-compose.yml` | Multi-container segmented architecture |
| `sandbox_report.txt` | Air-gapped malware sandbox validation |

---

## What I Built
Engineered a malware analysis sandbox using a host-only network to ensure
complete isolation from external systems. Deployed a disposable web server
in Docker for rapid provisioning and clean teardown — no persistence risk.
Built a multi-container architecture with Docker Compose to simulate
real-world app and database separation, with frontend/backend segmentation
keeping sensitive services off the internet. Validated containment controls
by confirming restricted outbound connectivity inside isolated containers,
and automated the whole deployment workflow with Bash scripting.

---

## What It Proves
- I can design containerized environments with security built in from the start
- I understand network segmentation and how to enforce isolation at the infra level
- I know how to deploy multi-tier appl