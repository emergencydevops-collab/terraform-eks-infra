variable "cluster_name" {
  default = "eksdemo"
}

variable "region" {
  default = "ap-south-1"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID for EKS cluster"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs"
}

variable "node_group_name" {
  default = "eksdemo1-ng-public1"
}

variable "desired_capacity" {
  default = 2
}

variable "max_capacity" {
  default = 4
}

variable "min_capacity" {
  default = 2
}

variable "instance_type" {
  default = "t3.medium"
}

variable "key_name" {
  default = "terraform_key"
}

variable "tags" {
  type    = map(string)
  default = {
    "Environment" = "DevOps"
    "ManagedBy"   = "Terraform"
  }
}

variable "ssh_key" {
  type        = string
  description = "SSH public key"
  sensitive   = true
}

variable "access_key" {
  type        = string
  description = "AWS access key"
  sensitive   = true
}

variable "secret_key" {
  type        = string
  description = "AWS secret key"
  sensitive   = true
}
