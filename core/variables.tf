# kms
variable "kms_retention_period" {
  type    = string
  default = "10"
}

variable "kms_multi_region" {
  type    = bool
  default = true
}
