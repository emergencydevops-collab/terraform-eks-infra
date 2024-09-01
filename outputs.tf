
output "cluster_id" {
  description = "The ID of the EKS cluster"
  value       = module.eks.cluster_id
}

output "node_group_role_arn" {
  description = "The ARN of the node group role"
  value       = module.eks.node_groups["eksdemo1-ng-public1"].role_arn
}
