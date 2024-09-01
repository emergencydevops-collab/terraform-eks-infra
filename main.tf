provider "aws" {
  region = var.aws_region
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  cluster_version = var.kubernetes_version
  subnets         = var.subnet_ids
  vpc_id          = var.vpc_id

  node_groups = {
    eksdemo1-ng-public1 = {
      desired_capacity = var.node_desired_capacity
      max_capacity     = var.node_max_capacity
      min_capacity     = var.node_min_capacity

      instance_type = var.instance_type
      key_name      = var.ssh_key_name
      ssh          = true
      additional_security_group_ids = var.additional_security_group_ids

      tags = {
        Name = "eksdemo1-ng-public1"
      }
    }
  }
}

output "cluster_id" {
  value = module.eks.cluster_id
}

output "node_group_role_arn" {
  value = module.eks.node_groups["eksdemo1-ng-public1"].role_arn
}
