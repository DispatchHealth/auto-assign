terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "terraform-state-swe-development.dispatchhealth"
    dynamodb_table = "terraform-state-lock"
    key            = "probot-us-east-1-dev/terraform.tfstate"
    region         = "us-east-1"
    role_arn       = "arn:aws:iam::783655260372:role/TerraformAdmin"
  }
}