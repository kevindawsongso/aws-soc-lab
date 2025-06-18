# 🛡️ AWS Honeypot Lab (In Progress)

This is a personal cloud security lab where I’m building a honeypot environment in AWS to simulate attacker behavior and practice real-world detection techniques. The project is inspired by SOC-style honeypots and is being adapted from an Azure-based tutorial into an AWS-native solution.

---

## 🔍 Purpose

I’m using this project to explore how attackers behave in a controlled cloud environment and how cloud-native tools can be used to detect, monitor, and respond. This lab is helping me develop skills in:

- AWS infrastructure setup and automation
- CloudFormation for infrastructure as code
- Secure instance provisioning and access
- CI/CD integration with GitHub Actions
- Logging, detection, and cloud-based monitoring

---

## ✅ Current Progress

- [x] Studied Azure SOC lab architecture and adapted it for AWS
- [x] Wrote initial **CloudFormation** template for EC2 honeypot
- [x] Set up secure key pair in AWS for SSH access
- [x] Connected GitHub Actions for future CI/CD deployment
- [ ] Deploy CloudFormation stack and validate setup
- [ ] Configure logging: VPC Flow Logs, CloudTrail, GuardDuty
- [ ] Simulate attacker behavior for detection testing

---

## ⚙️ Tools & Services

- **AWS EC2** – To host the honeypot
- **AWS CloudFormation** – For automated infrastructure deployment
- **AWS IAM** – Secure access and permission management
- **GitHub Actions** – Deployment pipeline (coming soon)
- *(Additional tools like GuardDuty, Security Hub, and WAF will be integrated later)*

---

## 🧠 Key Learnings So Far

- Writing and debugging CloudFormation templates requires careful attention to syntax and parameters.
- IAM permissions and key management are critical for securing even test environments.
- Automation setup (e.g., GitHub Actions) saves time and ensures consistency, but requires testing to get right.
- It’s important to test in small increments — especially when provisioning public-facing resources.

---

## 🚀 Next Steps

- [ ] Finalize and deploy the CloudFormation stack
- [ ] Validate SSH access and baseline functionality
- [ ] Turn on logging and monitoring
- [ ] Simulate basic attacks (port scans, login attempts)
- [ ] Analyze logs and detection signals
- [ ] Write detection rules and summarize findings

---

## 📁 Project Structure (Planned)

aws-honeypot-lab/
├── cloudformation/
│ └── honeypot-template.yaml
├── .github/
│ └── workflows/
│ └── deploy.yml
├── README.md
└── logs/
└── example-events/

---

## 📎 References

- [CloudFormation Template Anatomy](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html)
- [AWS GuardDuty Overview](https://aws.amazon.com/guardduty/)

---

## 📌 Status

**Currently setting up the initial infrastructure.**  
This is an active learning project and will be updated regularly as I progress through setup, detection, and analysis.
