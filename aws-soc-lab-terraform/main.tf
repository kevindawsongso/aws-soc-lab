
provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./modules/vpc"
}

module "security" {
  source = "./modules/security"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source           = "./modules/ec2"
  subnet_ids       = module.vpc.subnet_ids
  security_groups  = {
    honeypot = module.security.honeypot_sg
    splunk   = module.security.splunk_sg
    nat      = module.security.nat_sg
    ssm      = module.security.ssm_sg
  }
}

output "splunk_private_ip" {
  value = module.ec2.splunk_private_ip
}

output "honeypot_public_ip" {
  value = module.ec2.honeypot_public_ip
}
