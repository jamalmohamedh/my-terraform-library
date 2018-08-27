provider "aws" {
  region                  = "us-east-1"
  profile                 = "jammy"
}

variable "AMIID" {
  default = "ami-04681a1dbd79675a5"
}

resource "aws_instance" "web" {
  ami           = "${var.AMIID}"
  instance_type = "t2.micro"
  key_name      = "test"
  instance_initiated_shutdown_behavior = "terminate"
  associate_public_ip_address = "true"

  tags {
    Name = "My Terraform Instances"
    Project="Terraform"
    Environment = "Prod"
    "Patch Group" = "Linux"
  }
}
