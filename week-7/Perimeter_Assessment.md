# TITANCORP: PERIMETER ASSESSMENT REPORT
**Operator:** **Target Subnet:** 172.88.0.0/24

## PHASE 1: ACTIVE ENUMERATION (NMAP)
*(List the live IPs discovered and their running services/versions)*
* **Host 1 ([172.88.0.10]):** [syn-172-088-000-010.res.spectrum.com]
* **Host 2 ([172.88.0.15]):** [syn-172-088-000-015.res.spectrum.com]
* **Host 3 ([172.88.0.20]):** [syn-172-088-000-020.res.spectrum.com]

## PHASE 2: VULNERABILITY AUDIT (NIKTO)
*(Run Nikto against the TWO web servers discovered above. List one major finding for each.)*
* **Web Server 1 Finding:** [172.88.0.10 "Server leaks inodes via ETags", Missing X-Frame-Options]
* **Web Server 2 Finding:** [172.88.0.20 "Server leaks inodes via ETags", Missing X-Frame-Options and HTTP TRACE enabled]

## PHASE 3: RISK TRIAGE
*(Review your findings. Identify the SINGLE highest-risk vulnerability across the entire DMZ. Justify why it is the top priority using the Likelihood x Impact formula.)*

* **Top Priority Remediation:** [Name the Vulnerability/Misconfiguration]
* **Justification:** HTTP TRACE Enabled (OSVDB-877)Enables Cross-Site Tracing (XST) — attacker can steal session cookies/auth headers by tricking a victim's browser into making a TRACE request
