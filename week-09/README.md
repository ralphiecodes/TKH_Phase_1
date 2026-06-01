# Week 9 — Web Application Vulnerabilities, API Security & Chained Exploitation

## Objective
Conduct a full-stack security assessment of modern web environments by
identifying and exploiting OWASP Top 10 vulnerabilities — then documenting
how to fix them at the source code level.

---

## Artifacts
| File | What It Is |
|---|---|
| `sqli_report.txt` | Database schema mapping and UNION-based salary exfiltration |
| `xss_payloads.txt` | Stored/Reflected XSS payloads and CSRF attack documentation |
| `api_audit.log` | BOLA ID-swapping and Burp Intruder business logic exploitation |
| `OmniPortal_Assessment.md` | Full chained exploitation report for the Titan Omni-Portal |

---

## What I Did
Bypassed authentication using SQL tautologies and mapped internal database
schemas via UNION attacks to extract CEO-level salary data. Executed Stored
and Reflected XSS to steal session cookies and demonstrate account takeover.
Built CSRF payloads using hidden image tags to force unauthorized financial
transfers silently. Used Burp Suite to intercept API traffic, swap object
IDs to pull unauthorized CISO profile data, and ran Intruder against a
checkout endpoint to brute-force a hidden discount code. Tied it all
together in Operation Omni-Portal — chaining SQLi, Stored XSS, and API
BOLA into a single end-to-end attack against a legacy corporate portal.

---

## What It Proves
- I can chain multiple attack vectors into a high-impact kill chain
- I know how to intercept and manipulate live API traffic with Burp Suite
- I understand how injection flaws work at the database and browser level
- I can audit API endpoints for authorization flaws and business logic gaps
- I can deliver actionable remediations, not just findings

---

## Outcome
Audited four distinct web environments and went from theoretical knowledge
to validated exploitation — proving database compromise via SQLi, session
hijacking via XSS, and API data leakage via BOLA, with professional-grade
fixes documented for every vulnerability found.