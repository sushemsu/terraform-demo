resource "aws_backup_selection" "dbbackup" {
  name         = "db_backup"
  iam_role_arn = data.terraform_remote_state.core.outputs.iam_role_backups_arn
  plan_id      = data.terraform_remote_state.core.outputs.general_backup_plan_id
  selection_tag {
    type  = "STRINGEQUALS"
    key   = "kubernetes.io/cluster/${var.cluster_name}"
    value = "owned"
  }
}
