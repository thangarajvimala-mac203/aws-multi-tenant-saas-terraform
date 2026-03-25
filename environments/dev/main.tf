data "aws_caller_identity" "current" {}

output "aws_account_id" {
  value = data.aws_caller_identity.current.account_id
}

module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr = "10.0.0.0/16"

  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]

  private_app_subnets = ["10.0.11.0/24", "10.0.12.0/24"]

  private_db_subnets = ["10.0.21.0/24", "10.0.22.0/24"]

  azs = ["ap-south-1a", "ap-south-1b"]
}
