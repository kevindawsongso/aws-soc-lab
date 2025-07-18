variable "subnet_ids" {
  type = map(string)
}

variable "security_groups" {
  type = map(string)
}

variable "splunk_key" {
  type = string
}

variable "honeypot_key" {
  type = string
}
