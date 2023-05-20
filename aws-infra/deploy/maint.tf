data "aws_caller_identity" "current" {}
module "aws-iac" {
  source   = "../"
  aws_region        =    "us-east-1"
  vpc_cidr_block    =    "10.0.0.0/16"
  subnet_cidr_block =    "10.0.1.0/24"
  instance_count    =    "2"
  ami_id            =    "ami-04505e74c0741db8d" 


 }
