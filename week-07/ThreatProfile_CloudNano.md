# TARGET THREAT PROFILE: CloudNano 
**Classification:** Passive Security Audit
**Operator:** ## 1. Subdomain Discovery 
* **Tool Used:** Sublist3r
* **Subdomains Found:** *developer.tesla.com and view.email.tesla.com

## 2. Tech Stack Mapping 
* **Tool Used:** BuiltWith 
* **Identified Technologies (CMS/CDN/Backend):** * PHP and  jQuery

## 3. Major Exposure Points & Dangers 
*(List three major exposure points discovered during your OSINT audit and explain why they are dangerous)*
1. **developer.tesla.com:** It's definitely a danger because usually developer portals hold access to most of the databases and the behind the scenes working of a website. If someone can get access to that then all hell breaks lose.
2. **view.email.tesla.com** I think a subdomain with this name is either a bait or just really incompetent if it were true to its name then an exposure point would be the emails and reading them.
3. **Jquery open and found out:** Jquery injections can let people execute scripts on your websites.
