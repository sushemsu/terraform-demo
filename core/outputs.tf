output "vpc_id" {
  description = "vpc id"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = module.vpc.public_subnets
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = module.vpc.private_subnets
}

output "eks_cluster_name" {
  description = "Name for tagged subnets for eks use"
  value       = local.cluster_name
}

output "iam_role_backups_arn" {
  value = aws_iam_role.backups.arn
}

output "iam_role_backups_name" {
  value = aws_iam_role.backups.name
}

output "iam_role_backups_id" {
  value = aws_iam_role.backups.id
}

output "general_backup_vault_arn" {
  value = aws_backup_vault.general.arn
}

output "general_backup_vault_id" {
  value = aws_backup_vault.general.id
}

output "general_backup_vault_name" {
  value = aws_backup_vault.general.name
}

output "general_backup_plan_id" {
  value = aws_backup_plan.general.id
}

output "general_kms_key_arn" {
  value = aws_kms_key.general.arn
}

output "general_kms_key_id" {
  value = aws_kms_key.general.id
}

