
output "splunk_web_url" {
  value       = "http://${aws_eip.splunk_eip.public_ip}:8000"
  description = "Public URL for accessing Splunk Web UI"
}
