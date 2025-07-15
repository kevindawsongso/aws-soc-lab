# 🛡️ Security Findings – AWS SOC Lab

&#x20;External scans and attacks are a combination of real world malicous activity as well as simulated activity from myself, using tools like Hydra, Nikto, and Nmap.

---

## 🔍 Summary of Key Detections

### GuardDuty Alerts

* 🔐 **SSH brute-force attempts** from Pakistan and India
  *(IPs: 198.38.88.182, 110.39.169.73)*
* 📡 **Port probes** against:

  * 445 (SMB)
  * 3306 (MySQL)
  * 1433 (SQL Server)
  * 23 (Telnet)
    *Sources include Censys, Huawei Cloud, IPVolume*
* 🚨 **Root API usage**
  `DeleteSession` call detected from an unrecognized IP in Winston-Salem, suggesting poor credential hygiene

### Hydra FTP Brute-force

* 16 weak credentials successfully cracked on FTP service at `54.90.164.244`
  *(e.g., ********************`admin:123456`********************, ********************`admin:iloveyou`********************)*

### Nikto Scan Results

* Missing HTTP security headers:

  * `X-Frame-Options`
  * `X-Content-Type-Options`
* Allowed HTTP methods: `OPTIONS`, `GET`, `POST`, `HEAD`
* Directory traversal vectors: `/./`, `/%2e/`, `/%2f/`

### Nmap Scan

See full results: [nmap\_scan\_results\_713.md](./assets/nmap_scan_results_713.md)

---

## 🖥️ Attacker IP Highlights

| IP Address    | Location      | Threat Type         | Source         |
| ------------- | ------------- | ------------------- | -------------- |
| 198.38.88.182 | Mumbai, India | SSH Brute Force     | WHG Hosting    |
| 110.39.169.73 | Pakistan      | SSH Brute Force     | Wateen Telecom |
| 122.8.184.49  | Mexico City   | Port Probe (Telnet) | Huawei Cloud   |
| 94.102.49.186 | Amsterdam     | Port Probe (Telnet) | IP Volume      |
| 162.142.125.X | United States | Multi-port Scans    | Censys         |

---

## 📦 Recommendations Based on Findings

* Enforce SSH key-only access and restrict via NACLs
* Disable unused services: FTP, Telnet, SQL
* Avoid use of root credentials; require MFA for IAM
* Integrate GuardDuty and CloudWatch into Splunk for correlation

---

## 📂 Related Files

* [guard\_duty\_findings\_713.json](./assets/guard_duty_findings_713.json)
* [hydra\_scan\_results\_713.txt](./assets/hydra_scan_results_713.txt)
* [nikto\_scans\_results\_713.txt](./assets/nikto_scans_results_713.txt)
* [nmap\_scan\_results\_713.md](./assets/nmap_scan_results_713.md)
