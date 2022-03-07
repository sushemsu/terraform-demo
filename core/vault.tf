resource "aws_backup_vault" "general" {
  name        = var.project
  kms_key_arn = aws_kms_key.general.arn
}

resource "aws_backup_plan" "general" {
  name = "general_backup_plan"

  rule {
    rule_name         = "general_backup_rule"
    target_vault_name = aws_backup_vault.general.name
    schedule          = "cron(1 1 1 * ? *)"
  }
}
