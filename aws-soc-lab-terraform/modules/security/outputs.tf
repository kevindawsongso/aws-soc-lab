output "honeypot_sg_id" {
  value = aws_security_group.honeypot.id
}

output "splunk_sg_id" {
  value = aws_security_group.splunk.id
}

output "ssm_sg_id" {
  value = aws_security_group.ssm.id
} 