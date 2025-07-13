# AWS SOC Lab – Honeypot, Splunk, Logging, and Threat Detection

This lab project sets up an AWS-based Security Operations Center (SOC) environment to monitor and investigate network activity using a Dionaea honeypot, Amazon CloudWatch, and (optionally) Splunk. It includes a full logging and detection pipeline and integrates foundational AWS security services.

---

## ✅ Lab Summary

Deployed a **Dionaea honeypot EC2 instance** in a public subnet and a **Splunk EC2 instance** in a private subnet. Enabled log collection, forwarding, and visibility across AWS-native services with dashboards and visualizations.

---

## ☁️ Environment & Stack

- **EC2 Instances**:
  - Dionaea Honeypot (Ubuntu AMI from Marketplace)
  - Splunk Enterprise (Amazon Linux 2023)
- **VPC Architecture**:
  - Public & Private Subnets
  - Route Tables with NAT Gateway (for outbound access)
  - SSM VPC Endpoints (`ssm`, `ssmmessages`, `logs`)
- **Security Groups**:
  - `honeypot-sg`: exposed ports for fake services (FTP, MySQL, SMB, etc.)
  - `splunk-sg`: restricted access, inbound 8000 (UI), 22 (SSH), 9997 (forwarding)
- **Cloud Services Used**:
  - AWS Systems Manager (SSM)
  - CloudWatch Logs, Dashboards, Agent
  - CloudTrail (S3 storage)
  - VPC Flow Logs
  - Amazon GuardDuty, Security Hub, AWS Inspector, AWS Detective (enabled)

---

## 🛠️ Key Steps Completed

### Dionaea Honeypot
- Deployed from hardened Marketplace AMI (Ubuntu 22)
- Enabled inbound TCP ports (21, 22, 23, 80, 445, 3306, 11211, etc.)
- Enabled SSH (port 52222) for internal access only
- Installed CloudWatch Agent manually using CLI
- Validated log flow from `/opt/leadingsecurity/dionaea/logs/dionaea.log` to CloudWatch

### Splunk Instance
- Launched in private subnet with EIP (for temporary SSH)
- Installed from RPM using `wget`
- Allowed inbound on port 8000 for Splunk Web UI
- Will be configured to receive logs over TCP 9997

### Cloud Logging & Monitoring
- CloudWatch Agent config ships Dionaea logs to:
  - `honeypot-dionaea-log`
- VPC Flow Logs created:
  - **Log Group:** `aws-honeypot-vpc-flowlogs`
  - **IAM Role:** `VPCFlowLogs-Cloudwatch-aws-honeypot`
  - **Aggregation Interval:** 10 mins
- Created custom **CloudWatch Dashboard**:
  - Top Rejected Ports
  - Attacker IPs
  - Connection attempts over time

---

## 🔐 AWS Security Services Enabled

These are active and will be configured to receive and act on findings:

| Service         | Status  | Notes |
|------------------|---------|-------|
| GuardDuty        | ✅ Enabled | Threat detection |
| AWS Detective     | ✅ Enabled | Forensic graph investigation |
| Security Hub     | ✅ Enabled | Aggregates GuardDuty, Inspector |
| AWS Inspector    | ✅ Enabled | EC2 CVE scanning |

---

## 🔎 Sample CloudWatch Logs Insights Query

```sql
fields @timestamp, @message
| filter @message like /accept/
| parse @message "*accept/*/* [*:*->*:*]*" as proto, _, dst_addr, dst_port, src_addr, src_port, _
| stats count() as attempts by dst_port
```

---

## 🧾 VPC Flow Log Configuration

- **Resource ID:** vpc-02793ce57e31ab7ce
- **Log Group:** `aws-honeypot-vpc-flowlogs`
- **IAM Role:** `VPCFlowLogs-Cloudwatch-aws-honeypot`
- **Traffic Type:** ALL
- **Log Format:**

```text
${version} ${account-id} ${interface-id} ${srcaddr} ${dstaddr} ${srcport} ${dstport} ${protocol} ${packets} ${bytes} ${start} ${end} ${action} ${log-status}
```

---

## ⚠️ Common Stumbling Blocks for Cloud Beginners

| Area | Gotcha |
|------|--------|
| EC2 SSH | Key pair permissions must be `chmod 400` (or restricted on Windows) |
| SSM | Requires SSM agent installed + correct IAM role + VPC endpoints |
| VPC Endpoints | Needed for private subnet instances to reach CloudWatch & SSM |
| CloudWatch Agent | Agent must be installed + configured + IAM role attached |
| Log Parsing | Many log types require custom parsing to become useful |
| GuardDuty/Detective | Findings appear after initial scan period (not immediate) |
| Splunk Access | Requires correct port (8000) and EIP temporarily for setup |

---

## 🔗 To Do Next

- Configure Splunk to receive logs via forwarder or HTTP Event Collector
- Write detection rules for honeypot log anomalies
- Configure Security Hub integrations for automated response
- Forward archived logs to S3 for long-term storage

---

Maintained as part of a real-world AWS security lab project by Kevin.

