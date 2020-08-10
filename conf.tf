terraform {
  required_version = "= 0.12.28"

  backend "s3" {
    region         = "us-east-1"
    bucket         = "ci-twilio-proxy-v1"
    key            = "states/terraform.tfstate"
    encrypt        = "true"
    dynamodb_table = "ci-twilio-proxy-tflock-v1"
  }
}

