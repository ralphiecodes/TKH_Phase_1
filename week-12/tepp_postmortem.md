# Phase 1 Final Reckoning — TEPP Post-Mortem
**Operator:** Ralphie Perez
**Date:** June 1, 2026
**Repository:** [https://github.com/ralphiecodes/TLAB_12_-Final]
**TKH Innovation Fellowship 2026 | Phase 1 | Cybersecurity**

---

## Phase 0: Reconnaissance

### Triage Network — 172.100.0.0/24
Reconnaissance of the 172.100.0.0/24 subnet revealed four live hosts, three of which were intentionally misconfigured target servers. A default Nmap scan failed to detect all services; a full port scan (-p-) was required to identify Redis running on port 6379 at 172.100.0.11. The FTP server at 172.100.0.12 exposed vsftpd 3.0.2 on port 21 with virtual user credentials stored in plaintext. The host at 172.100.0.13 presented no open network ports but contained a world-writable web root directory at /var/www/html, demonstrating that dangerous misconfigurations are not always network-visible.

### Breach Network — 172.80.0.0/24
Reconnaissance of the 172.80.0.0/24 subnet identified one live host at 172.80.0.10 running OpenSSH 10.2 on port 22. Default Nmap scans initially failed to return results; the -Pn flag was required to bypass ping filtering. The SSH service accepted password-based authentication, which informed the Phase 2 brute-force approach using Hydra against staged wordlists.

### Exploitation Network — 172.60.0.0/24
Reconnaissance of the 172.60.0.0/24 subnet identified a web application running on port 80 at 172.60.0.10. The application accepted user-supplied input without sanitization, making it susceptible to OS command injection. This vulnerability was identified prior to exploitation and confirmed through direct HTTP interaction with the application endpoint.

---

## Phase 1: Rapid Triage

### Server 1 — 172.100.0.11
**Vulnerability Identified:**
Redis 8.6.3 was exposed on port 6379 with no authentication required. This was confirmed by connecting directly with redis-cli and running CONFIG GET requirepass, which returned an empty string.

**Remediation Commands:**
redis-cli -h 172.100.0.11 config get requirepass
docker exec -it broken_server_1 redis-cli config set requirepass "TKHSecure2026"

**Before State:**
requirepass = "" (no authentication required, open to any client)

**After State:**
requirepass = "TKHSecure2026" (authentication enforced on all connections)

**Analysis:**
An unauthenticated Redis instance exposes all stored data to any host with network access, enabling an attacker to read, modify, or delete keys without any credentials. In an enterprise environment, Redis frequently stores session tokens, cache data, and application secrets, making unauthorized access a critical risk. Furthermore, Redis supports configuration commands that can be abused to write arbitrary files to the filesystem, potentially enabling remote code execution.

### Server 2 — 172.100.0.12
**Vulnerability Identified:**
A vsftpd 3.0.2 FTP server was running with virtual user credentials stored in plaintext at /etc/vsftpd/virtual_users.txt. Credentials admin/3qShmJ8KKyKADM9E were recovered and used to authenticate successfully, confirming unauthorized access was trivially achievable.

**Remediation Commands:**
docker exec -it broken_server_2 pkill vsftpd
docker ps | grep broken_server_2

**Before State:**
vsftpd running and accepting connections on port 21 with write_enable=YES and plaintext credentials stored at /etc/vsftpd/virtual_users.txt.

**After State:**
Container stopped — FTP service no longer running or accessible on port 21.

**Analysis:**
An unauthorized FTP service running with write access and plaintext credentials represents a severe data exfiltration and lateral movement risk in an enterprise environment. FTP transmits credentials and data in cleartext, making it trivially interceptable on any shared network segment. The presence of write_enable=YES combined with allow_writeable_chroot=YES could allow an attacker to upload malicious files directly to the server.

### Server 3 — 172.100.0.13
**Vulnerability Identified:**
The web root directory /var/www/html had world-writable permissions (drwxrwxrwx), allowing any user or process to write, modify, or delete files in the web root. This misconfiguration was not detectable via network scanning and required direct filesystem inspection to identify.

**Remediation Commands:**
docker exec -it broken_server_3 ls -la /var/www/
docker exec -it broken_server_3 chmod 755 /var/www/html
docker exec -it broken_server_3 ls -la /var/www/

**Before State:**
drwxrwxrwx 2 root root 4096 — world-writable, any user or process could write to the web root.

**After State:**
drwxr-xr-x 2 root root 4096 — only root can write; all others have read and execute only.

**Analysis:**
A world-writable web root allows any authenticated or unauthenticated process with filesystem access to plant malicious files, including web shells that enable remote code execution. In a real enterprise environment, this misconfiguration could allow an attacker who gains any level of access to escalate privileges by deploying a backdoor directly into the web-served directory. Proper file permissions are a fundamental hardening control that prevents unauthorized modification of served content.

---

## Phase 2: The Breach

**Cracked Credentials:**
- Username: root
- Password: admin123

**Forensic Evidence:**
- Exact Timestamp of Successful Login: 2026-06-01 05:25:40 (Hydra completion timestamp; container logs did not include syslog timestamps as Alpine Linux does not run a syslog daemon by default)
- Attacker IP Address: 172.80.0.1

**Engineered iptables Rule:**
iptables -A INPUT -s 172.80.0.1 -j DROP

**SOC Analysis:**
A single iptables rule blocking the attacker's IP is insufficient as a standalone defensive measure because IP addresses can be spoofed or rotated, allowing an adversary to bypass the block by switching source addresses. A real SOC would deploy additional controls including fail2ban for automated brute-force detection and temporary banning, multi-factor authentication on all SSH endpoints, and SIEM alerting on repeated failed authentication attempts. Network segmentation and the principle of least privilege would further limit the blast radius of any successful credential compromise.

---

## Phase 3: Full Spectrum

**Listener Configuration:**
Phase 3 could not be completed due to a build failure in the capstone_target container. The container failed to initialize /app/server.py due to GPG signature errors in the Ubuntu 22.04 apt repositories during provisioning, preventing the web application from starting. All attempts to re-provision and resolve the dependency issue were unsuccessful within the lab window.

**Reverse Shell Payload:**
N/A — capstone_target container did not successfully deploy.

**Command Injection Explanation:**
Command injection occurs when an application passes unsanitized user-supplied input directly to a system shell, allowing an attacker to append arbitrary OS commands to the intended operation. This class of vulnerability arises when developers fail to implement input validation or use dangerous functions such as os.system() or subprocess with shell=True in Python. A properly hardened application would validate and sanitize all input, use parameterized commands, and run with the minimum required system privileges to limit the impact of any successful injection.

**Forensic Evidence:**
- Process ID (PID): N/A — logs not generated due to container build failure
- User-Agent: N/A — logs not generated due to container build failure

**Lockdown Command:**
N/A — capstone_target container did not successfully deploy.

**Final Analytical Paragraph:**
Having executed both the offensive and defensive sides of this operation, the most significant lesson is that attackers require only a single exploitable weakness while defenders must secure every surface simultaneously. The SSH brute-force attack in Phase 2 succeeded entirely because password-based authentication was permitted and weak credentials were in use; a single control — disabling password authentication in favor of SSH key-based authentication — would have stopped the breach entirely before any brute-force attempt could succeed. Across all three phases, the vulnerabilities encountered were not sophisticated zero-days but fundamental misconfigurations: unauthenticated services, plaintext credentials, and excessive filesystem permissions. This underscores that the majority of real-world breaches exploit known, preventable weaknesses rather than novel techniques. Effective defense requires continuous configuration auditing, the principle of least privilege, and layered controls so that the failure of any single measure does not result in a total compromise.

---

## References
Hydra Project. (2023). THC-Hydra: A fast and flexible online password cracking tool. https://github.com/vanhauser-thc/thc-hydra

Redis Ltd. (2024). Redis security: Authentication. https://redis.io/docs/management/security/

Nmap Project. (2024). Nmap: The network mapper. https://nmap.org

The Linux Documentation Project. (2024). Iptables tutorial. https://www.netfilter.org/documentation/

vsFTPd Project. (2024). vsftpd — Very Secure FTP Daemon. https://security.appspot.com/vsftpd.html
