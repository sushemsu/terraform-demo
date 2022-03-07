resource "aws_kms_key" "general" {
  description             = "default project key"
  deletion_window_in_days = var.kms_retention_period
  multi_region            = var.kms_multi_region
}
