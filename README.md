# Cybersecurity Portfolio for Ralphie Perez

Built from the ground up through real lab work — network recon, web app exploitation, digital forensics, and penetration testing across simulated enterprise environments.through real lab work — network recon, web app exploitation, digital forensics, and penetration testing across simulated enterprise environments.
Every lab in here is scenario-driven: real tools, real techniques, real infrastructure. Covers everything from initial reconnaissance through post-exploitation, with a focus on understanding why attacks work, not just running the commands.
**.

---

##  About Me

I build things, break things, and figure out why — whether that's a misconfigured Samba share, a vulnerable web app, or a smart contract handling real money. My background spans offensive security, full-stack development, and blockchain engineering, all picked up through hands-on labs and projects I actually shipped.

Skilled in:
- **Offensive Security & Penetration Testing** —  Ran real attacks against live lab environments: Metasploit exploits, SMB/Samba compromise, reverse shells, XSS/CSRF injection, and privilege escalation across Linux and Windows targets.
- **Defensive Engineering & Hardening** — Configured kernel-level firewalls, deployed IDS solutions, and dug into VM-level driver issues that most people would just Google and give up on.
- **Digital Forensics & Incident Response (DFIR)** — Carved volatile memory, extracted low-level disk sector data, and reconstructed attack timelines from the ground up.
- **Security Scripting & Automation** — Python, Bash, and PowerShell. Equally comfortable in a Linux terminal or a Windows PowerShell session depending on what the job needs.
- **Web3 & Full-Stack Development** - Built GroupFund from scratch for a hackathon: non-custodial group savings on-chain using Flask, Solidity, Ethers.js, and SIWE authentication. Wrote the contracts, wired up the backend, shipped it.
- **Enterprise Infrastructure & Architecture** — Stood up Active Directory domains, multi-tier Docker networks, and DMZ routing topologies as part of scenario-based lab work simulating real enterprise environments.

---

##  Technologies & Tools

**Languages & Scripting**
- Python, Bash, PowerShell
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

##  Repository Structure

The engineering artifacts and technical documentation within this repository are structured chronologically by operational focus:

*   [**`week-01/`**](./week-01) → Linux security foundations, file system permissions, and baseline defensive automation.
*   [**`week-02/`**](./week-02) → OSI-layer network diagnostics, gateway recovery, and CIDR subnet design.
*   [**`week-03/`**](./week-03) → Python-driven threat intelligence automation, port scanners, and real-time auth log parsing.
*   [**`week-04/`**](./week-04) → Multi-tier containerized architecture security and frontend/backend microservice isolation.
*   [**`week-06/`**](./week-06) → Cross-layer infrastructure troubleshooting, SSH security auditing, and formal Security Architecture Design (SAD).
*   [**`week-07/`**](./week-07) → Active perimeter reconnaissance, port/service version interrogation, and risk-adjusted vulnerability triage.
*   [**`week-08/`**](./week-08) → Vulnerability weaponization, persistent backdoor construction, privilege escalation, and SOCKS5 subnet pivoting.
*   [**`week-09/`**](./week-09) → Web application vulnerability chaining (SQLi, XSS, CSRF) and API Broken Object Level Authorization (BOLA) exploitation.
*   [**`week-10/`**](./week-10) → Live volatile triage, cryptographic evidence handling, raw disk block data carving, and ELK SIEM attack timeline analysis.
*   [**`week-11/`**](./week-11) → Triple-tier Defense-in-Depth architecture engineering incorporating firewalls, network IDS signatures, and host EDR policies.
*   [**`week-12/`**](./week-12) → Comprehensive final phase post-mortem documentation, service hardening, and complete structural repository audit.

---

##  Featured Engineering Milestones

---

###  1. Penetration Testing & Exploitation Lab

- **Metasploit Exploitation:** Compromised a vulnerable target machine using Metasploit Framework, chaining service enumeration with weaponized payloads to establish a reverse shell and maintain persistent access across sessions.
- **Privilege Escalation:** Identified and abused misconfigured SUID binaries and weak file permissions on a Linux target to escalate from a low-privilege shell to full root access.
- **SOCKS5 Pivoting:** Configured a SOCKS5 proxy tunnel through a compromised host to pivot laterally into an isolated internal subnet, reaching systems with no direct external exposure.

---

###  2. Digital Forensics & Incident Response (DFIR)

- **Volatile Memory Triage:** Captured and analyzed live system memory to extract running process trees, open network connections, and injected shellcode artifacts before they were wiped on shutdown.
- **Raw Disk Sector Carving:** Used The Sleuth Kit (`fls`, `icat`) to recover deleted files and reconstruct filesystem timelines directly from raw disk block data without a mounted volume.
- **ELK SIEM Timeline Reconstruction:** Ingested and correlated multi-source log data inside an ELK Stack deployment to rebuild a full attack timeline, mapping each stage of compromise from initial access through lateral movement.

---

###  3. Web Application Exploitation & API Security

- **Vulnerability Chaining (SQLi → XSS → CSRF):** Exploited a multi-stage web application attack path — extracting database credentials via SQL injection, injecting persistent XSS payloads into user-facing fields, and forging authenticated cross-site requests to escalate impact.
- **BOLA / IDOR Exploitation:** Identified and abused Broken Object Level Authorization flaws in a REST API to access and exfiltrate data belonging to other users by manipulating object reference parameters in authenticated requests.
- **Burp Suite Interception & Replay:** Intercepted live HTTP traffic, modified session tokens and request parameters in-flight, and replayed crafted requests to bypass client-side input validation and authorization controls.

##  Career Objective


Breaking into the industry after spending the last year going heads down — building real skills across offensive security, defensive engineering, blockchain development, and full-stack automation. Every project in this repo was built hands-on: no walkthroughs, no shortcuts.

Looking for a role where I can do real work — whether that's on a red team, a SOC, a security engineering team, or somewhere at the intersection of Web3 and security. I learn fast, I ship things, and I'd rather figure out why an exploit works than just run it and move on.

Open to entry-level and junior roles in:
- Penetration Testing / Red Team Operations
- Security Engineering & Automation
- SOC / Incident Response & DFIR
- Blockchain Security & Smart Contract Auditing

---

## Where I can be found

*   **GitHub Repository:** [github.com/ralphiecodes](https://github.com/ralphiecodes)
*   **Professional LinkedIn:** [linkedin.com/in/topherdiaz87](https://www.linkedin.com/in/ralphie00/)


