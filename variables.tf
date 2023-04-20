variable "vpc_id" {
  description = "Provide the VPC ID of existing vpc in your AWS Account that you want to use for EC2 instane creation"
  type        = string
  default     = "vpc-0dd7db37b1c6bbc85"
}

variable "region" {
  description = "Which region you want to use  in your aws for resource provising"
  type        = string
  default     = "us-east-1"
}

variable "username" {
  description = "Provide the username as per AMI ID"
  type        = string
  default     = "ubuntu"
}