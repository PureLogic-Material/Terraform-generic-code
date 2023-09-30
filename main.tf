
provider "aws" {
  region     = var.main_region
  access_key = var.access_key
  secret_key = var.secret_key
}

module "vpc" {
  source = "./module/VPC"
  region = var.main_region
}

resource "aws_instance" "my-instance" {
  ami           = module.vpc.ami_id
  subnet_id     = module.vpc.subnet_id
  instance_type = "t2.micro"
}