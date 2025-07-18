resource "aws_instance" "splunk" {
  ami                         = "ami-0fc5d935ebf8bc3bc"
  instance_type               = "t2.micro"
  subnet_id                   = var.subnet_ids["private_a"]
  vpc_security_group_ids      = [var.security_groups["splunk"], var.security_groups["ssm"]]
  associate_public_ip_address = false
  key_name                    = var.splunk_key
  iam_instance_profile        = aws_iam_instance_profile.ssm_profile.name

  user_data = <<-EOT
              #cloud-config
              package_update: true
              package_upgrade: true
              packages:
                - wget
                - ufw

              runcmd:
                - cd /opt
                - wget -O splunk.tgz 'https://download.splunk.com/products/splunk/releases/9.1.2/linux/splunk-9.1.2-77f73c9edb85-Linux-x86_64.tgz'
                - tar -xvzf splunk.tgz
                - /opt/splunk/bin/splunk start --accept-license --answer-yes --no-prompt --seed-passwd changeme123
                - /opt/splunk/bin/splunk enable boot-start
                - ufw allow 8000/tcp
                - ufw --force enable
              EOT

  tags = { Name = "splunk" }
}

resource "aws_instance" "honeypot" {
  ami                         = "ami-0fc5d935ebf8bc3bc"
  instance_type               = "t2.micro"
  subnet_id                   = var.subnet_ids["public_a"]
  vpc_security_group_ids      = [var.security_groups["honeypot"], var.security_groups["ssm"]]
  associate_public_ip_address = true
  key_name                    = var.honeypot_key
  iam_instance_profile        = aws_iam_instance_profile.ssm_profile.name

  user_data = <<-EOT
              #cloud-config
              package_update: true
              packages:
                - wget
                - curl

              runcmd:
                - wget -O splunkforwarder.tgz 'https://download.splunk.com/products/universalforwarder/releases/9.1.2/linux/splunkforwarder-9.1.2-Linux-x86_64.tgz'
                - tar -xvzf splunkforwarder.tgz -C /opt
                - /opt/splunkforwarder/bin/splunk start --accept-license --answer-yes --no-prompt
                - /opt/splunkforwarder/bin/splunk enable boot-start
                - /opt/splunkforwarder/bin/splunk add forward-server ${aws_instance.splunk.private_ip}:9997 -auth admin:changeme123
                - /opt/splunkforwarder/bin/splunk add monitor /var/log -auth admin:changeme123
              EOT

  tags = { Name = "honeypot" }
}
