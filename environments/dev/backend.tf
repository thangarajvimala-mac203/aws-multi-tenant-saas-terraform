terraform {
  backend "s3" {
    bucket         = "thangaraj-mt-saas-tfstate"
    key            = "multi-tenant-saas-/dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "thangaraj-mt-saas-tflock"
    encrypt        = true
  }
}