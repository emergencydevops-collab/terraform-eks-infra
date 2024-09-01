variable "aws_region" {
  description = "The AWS region to deploy the EKS cluster"
  type        = string
  default     = "ap-south-1"
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
  default     = "eksdemo"
}

variable "kubernetes_version" {
  description = "The Kubernetes version to use for the EKS cluster"
  type        = string
  default     = "1.30"
}

variable "subnet_ids" {
  description = "List of subnet IDs where the EKS cluster will be deployed"
  type        = list(string)
}

variable "vpc_id" {
  description = "The VPC ID where the EKS cluster will be deployed"
  type        = string
}

variable "instance_type" {
  description = "The instance type for the node group"
  type        = string
  default     = "t3.medium"
}

variable "node_desired_capacity" {
  description = "The desired number of worker nodes"
  type        = number
  default     = 2
}

variable "node_min_capacity" {
  description = "The minimum number of worker nodes"
  type        = number
  default     = 2
}

variable "node_max_capacity" {
  description = "The maximum number of worker nodes"
  type        = number
  default     = 4
}

variable "ssh_key_name" {
  description = "The name of the SSH key pair to use for access to the nodes"
  type        = string
}

variable "additional_security_group_ids" {
  description = "Additional security group IDs to attach to the nodes"
  type        = list(string)
  default     = []
}
