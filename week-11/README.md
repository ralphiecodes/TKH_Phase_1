# Week 11 — Perimeter Hardening, Intrusion Detection (IDS) & Host-Based EDR

## Objective
Implement an enterprise-grade Defense-in-Depth architecture across isolated
server clusters — three independent layers designed to prevent, detect, and
isolate multi-stage threat actor activity.

---

## Artifacts
| File | What It Is |
|---|---|
| `firewall_config.sh` | Stateful network access rules, default-deny posture, and egress restrictions |
| `custom_ids.rules` | Suricata signatures for ICMP ping sweeps and malware scanner detection |
| `Operation_Fortress_Report.md` | Full Defense-in-Depth report across all three defensive layers |

---

## What I Did
Hardened DMZ web server containers with UFW default-deny rules, whitelisting
only SSH and HTTPS. Used iptables to block lateral movement paths into the
internal subnet and drop unauthorized outbound traffic targeting backend
database services. Wrote custom Suricata signatures to catch ICMP ping sweeps
and detect the `Ghost_Scanner_v1` malware User-Agent string in live HTTP
traffic. Deployed Sysmon on Linux hosts and configured XML rules to flag
ransomware precursor commands and malicious child processes spawned by macro
scripts. For Operation Fortress, tied all three layers together — iptables
egress filtering blocking C2 callbacks, a Suricata rule catching the
`cmd=whoami` web shell string, and a Sysmon condition intercepting the
attacker's `curl` payload download at the process level.

---

## What It Proves
- I can architect layered defenses where each layer covers the last one's blind spots
- I know how to write production-ready IDS signatures from real threat intelligence
- I understand kernel-level firewall configuration and network segmentation
- I can deploy host-based EDR and tune it to catch specific attacker behaviors
- I can translate threat indicators directly into detection engineering logic

---

## Outcome
Built and validated a complete Defense-in-Depth architecture across three
independent layers — firewall, IDS, and endpoint — each one engineered to
catch what the layer before it might miss, and documented every decision
in a structured security report.