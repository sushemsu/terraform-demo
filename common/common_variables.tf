# generic
variable "owner" {
  type    = string
  default = "sushemsu@gmail.com"
}

variable "region" {
  type    = string
  default = "us-west-2"
}

# tags
variable "app_environ" {
  type    = string
  default = "prod" # we only pay for prod atm?
}

variable "project" {
  type    = string
  default = "demo"
}
