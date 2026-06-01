# CLOUDNANO REMEDIATION PLAN
**Operator:** ## TOP 5 CRITICAL FIXES
*(From the 20 raw findings, select the 5 that pose the greatest ACTUAL risk. Explain your reasoning.)*

1. **[CVSS 9.8] Unauthenticated AWS S3 Bucket (Contains Customer PII)**
   * **Justification:** There is no authentication anyone with the link can just go in and wreak havoc.

2. ** Remote Code Execution in Apache Struts on internet-facing web server (CVSS 9.8)**
   * **Justification:** It's internet facing so anyone from the internet can just go in and run code/scripts to steal or ruin data.

3. **. SQL Injection in login page on customer database portal (CVSS 8.1)**
   * **Justification:** They can turn your login page into a phishing website and steal all your customers passwords.

4. **SMBv1 enabled on internal HR file server (CVSS 9.0)**
   * **Justification:** SMBv1 was an exploit that Microsoft wants people to turn and never use since it allows bad actors to push ransomware everywhere. 

5. **Cross-Site Scripting on support forum (CVSS 8.8)**
   * **Justification:** Can turn your website into a redirection and also steal customer passwords. 
