🛡️ Security Findings – AWS SOC Lab

This lab deployed a honeypot-backed EC2 instance monitored by CloudWatch and Splunk. External scans and attacks were simulated using tools like Hydra, Nikto, and Nmap, with AWS GuardDuty capturing real-world probes.

⸻

🔍 Summary of Key Detections
	•	GuardDuty Alerts:
	•	🔐 SSH brute-force attempts from Pakistan and India (198.38.88.182, 110.39.169.73)
	•	📡 Port probes against ports 445 (SMB), 3306 (MySQL), 1433 (SQL Server), and 23 (Telnet) from Censys, Huawei Cloud, and IPVolume
	•	⚠️ S3 bucket misconfiguration: Public read access detected via PutBucketPolicy by IAM user gsocyberadmin
	•	🚨 Root API usage: Detected DeleteSession API activity from unrecognized IP in Winston-Salem, indicating poor credential hygiene
	•	Hydra FTP brute-force:
	•	16 common credentials successfully cracked against FTP service at 54.90.164.244 (e.g., admin:123456, admin:iloveyou)
	•	Nikto Scan Results:
	•	Missing security headers: X-Frame-Options, X-Content-Type-Options
	•	HTTP methods allowed: OPTIONS, GET, POST, HEAD
	•	Directory traversal vectors observed: /./, /%2e/, /%2f/
	•	Nmap Results:
(See nmap_scan_results_713.md for full port/service details)

⸻

🖥️ Attacker IP Highlights

IP Address	Location	Threat Type	Source
198.38.88.182	Mumbai, India	SSH Brute Force	WHG Hosting
110.39.169.73	Pakistan	SSH Brute Force	Wateen Telecom
122.8.184.49	Mexico City	Port Probe (Telnet)	Huawei Cloud
94.102.49.186	Amsterdam	Port Probe (Telnet)	IP Volume
162.142.125.X	United States	Multi-port Scans	Censys


⸻

📦 Recommendations Based on Findings
	•	Harden SSH access with key-only authentication and NACL restrictions.
	•	Disable unused services: FTP, Telnet, SQL ports should be blocked by default.
	•	Enforce strict S3 bucket policies using BlockPublicAccess.
	•	Avoid root key usage—use IAM roles and enforce MFA.
	•	Integrate GuardDuty and CloudWatch alert logs into Splunk dashboards for correlation.

⸻

📂 Related Files
	•	guard_duty_findings_713.json – Raw AWS GuardDuty output
	•	hydra_scan_results_713.txt – FTP brute-force log
	•	nikto_scans_results_713.txt – Web server vulnerability report
	•	nmap_scan_results_713.md – Port and service enumeration