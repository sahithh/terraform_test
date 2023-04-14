terraform {
  backend "s3" {
    bucket = "terraform-testcase"
    key    = "env/demo/ec2.tfstate"
    region = "us-east-1"
  }
}