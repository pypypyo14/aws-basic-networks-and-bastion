####################
## BASIC SETTINGS ##
####################
module "basic-networks" {
  source  = "app.terraform.io/Saochan/basic-networks/aws"
  version = "0.2.0"

  project = var.project
}

module "ec2-bastion" {
  source  = "app.terraform.io/Saochan/ec2-bastion/aws"
  version = "0.1.0"

  project   = var.project
  vpc_id    = module.basic-networks.vpc_id
  subnet_id = module.basic-networks.public_subnets_id[0]
}
