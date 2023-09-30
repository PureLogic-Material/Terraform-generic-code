
variable "main_region" {
  type    = string
  default = "us-east-1"
}
# variable "access-key" {
#   type    = string
#   default = "AKIA3NM6P52VCYDTF7GT"
# }

# variable "secret-key" {
#   type    = string
#   default = "QZAK7j1FnlGA74SNlMKt8n1/KbpUSSA/NTzIG6b4"
# }
provider "aws" {
  region     = var.main_region
  # access_key = var.access-key
  # secret_key = var.secret-key
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