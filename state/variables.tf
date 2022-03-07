variable "state_bucket" {
  type    = string
  default = "sushemsu-bucket"
}
variable "state_force_destroy" {
  type    = bool
  default = null

}

variable "owner" {
  type    = string
  default = "sushemsu@gmail.com"

}
variable "state_environ" {
  type    = string
  default = "prod" # we only pay for prod atm?
}

variable "state_acl" {
  type    = string
  default = "private"
}
variable "block_public_acls" {
  type    = bool
  default = true
}

variable "block_public_policy" {
  type    = bool
  default = true
}

variable "ignore_public_acls" {
  type    = bool
  default = true
}

variable "restrict_public_buckets" {
  type    = bool
  default = true
}
