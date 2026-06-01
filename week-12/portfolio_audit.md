# Phase 1 Portfolio Audit & Professional Reflection

**Candidate:** Ralphie Perez
**Date:** June 1st, 2026  
**Program:** TKH Innovation Fellowship 2026 | Cybersecurity  

---

## Part 1: Structural Repository Audit Checklist

This audit matrix verifies the structural integrity, asset compilation, and corresponding documentation status for all core operational directories within the public portfolio repository.

| Folder Reference | Documentation Status | Primary Artifacts Verified | Compliance Verified |
| :--- | :--- | :--- | :--- |
| **Week1-Artifact** | `README.md` Present | `discovery.txt`, `final_threat_report.txt`, `harden.sh` | Yes |
| **Week2-Artifact** | `README.md` Present | `briefing.txt`, `protocol_audit.txt`, `subnet_blueprint.txt` | Yes |
| **Week3-Artifact** | `README.md` Present | `brute_detector.py`, `incident_response.py`, `port_check.py` | Yes |
| **Week4-Artifact** | `README.md` Present | `deploy_web.sh`, `docker_compose.yml`, `sandbox_report.txt` | Yes |
| **Week5-Artifact** | `README.md` Incomplete | `gpo_audit.txt`, `onboard_engineers.ps1`, `tlab5_report.txt` | No |
| **Week6-Artifact** | `README.md` Present | `HardenedOutpost_SAD.pdf`, `practical_exam_report.txt` | Yes |
| **Week7-Artifact** | `README.md` Present | `Perimeter_Assessment.md`, `ThreatProfile_CloudNano.md` | Yes |
| **Week8-Artifact** | `README.md` Incomplete | `Deep_Pivot_Report.md`, `escalation_path.txt`, `pivot_success.png` |No |
| **Week9-Artifact** | `README.md` Present | `OmniPortal_Assessment.md`, `api_audit.log`, `sqli_report.txt` | Yes |
| **Week10-Artifact**| `README.md` Present | `Incident_Response_Report.md`, `attack_timeline.csv` | Yes |
| **Week11-Artifact**| `README.md` Present | `Operation_Fortress_Report.md`, `custom_ids.rules` | Yes |
| **Week12-Artifact**| `README.md` Present | `tepp_postmortem.md`, `portfolio_audit.md` | Yes |

---

## Part 2: Substantive Professional Reflection

### Abstract

This portfolio documents twelve weeks of applied cybersecurity training built on
top of a CS degree and three and a half years as an automation engineer at Cigna.
What this program added was security-specific context — the ability to look at a
network or application and think adversarially. This reflection covers that
progression and where I'm headed next.

---

### Evolutionary Growth and Technical Progression

Coming in with an engineering background meant I understood systems and scripting,
but I had never applied those skills in a security context. The early weeks
changed that — writing hardening scripts, designing network architecture, and
building incident response tooling forced me to think about threat reduction
rather than process efficiency. The offensive phases pushed that further. Actually
executing SQL injection, XSS, and API enumeration attacks made me stop thinking
like someone building systems and start thinking like someone breaking them. That
shift changes how you read code, evaluate architecture, and interpret alerts.

---

### Red-Team Execution and Blue-Team Synthesis

The defensive work hit differently because the offensive work came first. When I
wrote Suricata signatures and built a Defense in Depth architecture in Weeks 10
and 11, I was writing detections for attack patterns I had already run myself.
Reconstructing an attacker's full timeline in Kibana — correlating an external IP
through lateral movement to a firewall exfiltration anomaly — made log correlation
concrete and repeatable. That is the exact workflow a SOC analyst runs during
incident investigation, and having built it from scratch is the most transferable
thing this program produced.

---

### Conclusion and Future Trajectory

I came in able to build and automate enterprise systems. I leave understanding how
those systems fail and how defenders detect and respond when they do. The next
step is Security+ certification and continuing to sharpen detection engineering
skills in the lab. The goal is a SOC Analyst role where I can apply everything
here — reading alerts with the context of someone who has run the attacks, and
communicating findings with the clarity this program demanded every single week.
---

## References
Docker Project. (2026). *Docker engine command line interface documentation*. https://docs.docker.com/engine/reference/commandline/cli/

Linux Marketers. (2025). *Netfilter and iptables stateful firewall architecture manual*. https://www.netfilter.org/documentation/

Python Software Foundation. (2026). *The Python standard library: Subprocess and OS management systems*. https://docs.python.org/3/library/subprocess.html