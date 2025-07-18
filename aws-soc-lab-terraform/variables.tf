variable "splunk_key" {
  description = "Name of the key pair for Splunk EC2"
  type        = string
}

variable "honeypot_key" {
  description = "Name of the key pair for Honeypot EC2"
  type        = string
}

variable "admin_ip_cidr" {
  description = "CIDR block allowed to access Splunk Web (8000)"
  type        = string
}