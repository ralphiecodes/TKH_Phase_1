# Cybersecurity Portfolio for Ralphie Perez

Built from the ground up through real lab work — network recon, web app exploitation, digital forensics, and penetration testing across simulated enterprise environments.through real lab work — network recon, web app exploitation, digital forensics, and penetration testing across simulated enterprise environments.
Every lab in here is scenario-driven: real tools, real techniques, real infrastructure. Covers everything from initial reconnaissance through post-exploitation, with a focus on understanding why attacks work, not just running the commands.
**.

---

## 👨‍💻 About Me

I build things, break things, and figure out why — whether that's a misconfigured Samba share, a vulnerable web app, or a smart contract handling real money. My background spans offensive security, full-stack development, and blockchain engineering, all picked up through hands-on labs and projects I actually shipped.

Skilled in:
- **Offensive Security & Penetration Testing** —  Ran real attacks against live lab environments: Metasploit exploits, SMB/Samba compromise, reverse shells, XSS/CSRF injection, and privilege escalation across Linux and Windows targets.
- **Defensive Engineering & Hardening** — Configured kernel-level firewalls, deployed IDS solutions, and dug into VM-level driver issues that most people would just Google and give up on.
- **Digital Forensics & Incident Response (DFIR)** — Carved volatile memory, extracted low-level disk sector data, and reconstructed attack timelines from the ground up.
- **Security Scripting & Automation** — Python, Bash, and PowerShell. Equally comfortable in a Linux terminal or a Windows PowerShell session depending on what the job needs.
- **Web3 & Full-Stack Development** - Built GroupFund from scratch for a hackathon: non-custodial group savings on-chain using Flask, Solidity, Ethers.js, and SIWE authentication. Wrote the contracts, wired up the backend, shipped it.
- **Enterprise Infrastructure & Architecture** — Stood up Active Directory domains, multi-tier Docker networks, and DMZ routing topologies as part of scenario-based lab work simulating real enterprise environments.

---

## 🧰 Technologies & Tools

**Languages & Scripting**
- Python, Bash, PowerShell
- Solidity
- JavaScript (Ethers.js, Web3 frontend integration)

**Offensive & Penetration Testing**
- Metasploit Framework & `msfvenom`
- Burp Suite, OWASP ZAP
- `nmap`, `netcat`, SOCKS5 Proxies
- SMB/Samba Exploitation, Reverse Shell Techniques
- XSS, CSRF & Web Application Injection

**Networking & Traffic Analysis**
- TCP/IP, DNS, CIDR Subnetting & Routing
- Stateful Firewalls (`iptables`, UFW)
- Packet Capture & Handshake Analysis
- VLAN Segmentation & DMZ Topology

**Defensive & Forensic Tooling**
- ELK Stack (Elasticsearch, Logstash, Kibana)
- Suricata IDS, Sysmon / SysmonForLinux
- The Sleuth Kit (`fls`, `icat`), Volatility
- Log Parsing, Timeline Reconstruction & Incident Response

**Infrastructure & Environments**
- Linux (Ubuntu, Kali), Windows Server 2022
- Docker & Docker Compose
- VirtualBox VM Environments
- Active Directory Domain Configuration

**Web3 & Full-Stack**
- Flask, Solidity, Ethers.js, SIWE Authentication
- Non-Custodial Smart Contract Architecture
- GroupFund (Hackathon Build)
---

## 📂 Repository Structure

The engineering artifacts and technical documentation within this repository are structured chronologically by operational focus:

*   [**`week-01/`**](./week-01) → Linux security foundations, file system permissions, and baseline defensive automation.
*   [**`week-02/`**](./week-02) → OSI-layer network diagnostics, gateway recovery, and CIDR subnet design.
*   [**`week-03/`**](./week-03) → Python-driven threat intelligence automation, port scanners, and real-time auth log parsing.
*   [**`week-04/`**](./week-04) → Multi-tier containerized architecture security and frontend/backend microservice isolation.
*   [**`week-05/`**](./week-05) → Active Directory domain integration, automated IAM provisioning, and enterprise GPO enforcement.
*   [**`week-06/`**](./week-06) → Cross-layer infrastructure troubleshooting, SSH security auditing, and formal Security Architecture Design (SAD).
*   [**`week-07/`**](./week-07) → Active perimeter reconnaissance, port/service version interrogation, and risk-adjusted vulnerability triage.
*   [**`week-08/`**](./week-08) → Vulnerability weaponization, persistent backdoor construction, privilege escalation, and SOCKS5 subnet pivoting.
*   [**`week-09/`**](./week-09) → Web application vulnerability chaining (SQLi, XSS, CSRF) and API Broken Object Level Authorization (BOLA) exploitation.
*   [**`week-10/`**](./week-10) → Live volatile triage, cryptographic evidence handling, raw disk block data carving, and ELK SIEM attack timeline analysis.
*   [**`week-11/`**](./week-11) → Triple-tier Defense-in-Depth architecture engineering incorporating firewalls, network IDS signatures, and host EDR policies.
*   [**`week-12/`**](./week-12) → Comprehensive final phase post-mortem documentation, service hardening, and complete structural repository audit.

---

## 📌 Featured Engineering Milestones

### 🪓 1. Example
*   **Perimeter Firewalls:** Deployed kernel-level `iptables` rule-sets inside secure DMZ zones to enforce strict egress traffic parameters, dropping all unauthorized traffic directed at internal subnets (`10.0.5.0/24`) and database hubs (`10.0.5.50:3306`).
*   **Network Intrusion Detection (IDS):** Authored customized signature profiles inside **Suricata** to identify application exploit attempts, generating high-priority tracking alerts for automated ICMP sweeps and unauthorized layer-7 malicious User-Agent signatures (`Ghost_Scanner_v1`).
*   **Host Endpoint EDR Policies:** Architected and loaded custom XML detection schemas via **Sysmon** to trace volatile process behaviors, capturing unauthorized volume operations and precursor ransomware events (`delete shadows`).



## 📊 Core Verified Artifact Summary

| Functional Focus | Core Artifact Reference | Technical Impact Description |
| :--- | :--- | :--- |
| **Defensive Engineering** | [`firewall_config.sh`](./Week11-Artifact/firewall_config.sh) | Scripted stateful access rules, default-deny postures, and automated DMZ network routing controls. |
| **Detection Engineering** | [`custom_ids.rules`](./Week11-Artifact/custom_ids.rules) | Optimized Suricata signatures tracking network scanning sweeps and application-layer signature profiles. |
| **Endpoint Security** | [`edr_policy.xml`](./Week11-Artifact/edr_policy.xml) | Target XML configuration file isolating malicious PowerShell behaviors and ransomware volume modification attempts. |
| **Security Architecture**| [`HardenedOutpost_SAD.pdf`](./Week6-Artifact/HardenedOutpost_SAD.pdf)| Comprehensive architectural design plan mapping secure network topology configurations and host-based access controls. |
| **Vulnerability Assessment**| [`OmniPortal_Assessment.md`](./Week9-Artifact/OmniPortal_Assessment.md)| Forensic auditing ledger detailing multi-stage web application exploits and source-code level parameterized remediation strategies. |
| **Digital Forensics** | [`Incident_Response_Report.md`](./Week10-Artifact/Incident_Response_Report.md)| Industrial-grade DFIR report detailing memory string extraction, disk block sector manipulation, and core SIEM log correlation. |
| **System Automation** | [`incident_response.py`](./Week3-Artifact/incident_response.py) | Dynamic Python processing engine parsing live server authentication logs to extract real-time brute-force attacker footprints. |
| **Identity & IAM** | [`onboard_engineers.ps1`](./Week5-Artifact/onboard_engineers.ps1)| Scripted PowerShell Core configuration tool automating Active Directory object generation and asset group access mappings. |

---

## 🎯 Career Objective



---

## 📬 Let’s Connect

*   **GitHub Repository:** [github.com/ralphiecodes](https://github.com/ralphiecodes)
*   **Professional LinkedIn:** [linkedin.com/in/topherdiaz87](https://www.linkedin.com/in/ralphie00/)

