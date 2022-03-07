variable "allocated_storage" {
  type    = number
  default = 10
}

variable "allow_major_version_upgrade" {
  type    = bool
  default = false
}

variable "auto_minor_version_upgrade" {
  type    = bool
  default = false
}

variable "engine" {
  type    = string
  default = "mysql"
}

variable "engine_version" {
  type    = string
  default = "5.7"
}

variable "instance_class" {
  type    = string
  default = "db.t3.micro"
}

variable "db_name" {
  type    = string
  default = "demodb"
}

variable "parameter_group_name" {
  type    = string
  default = "default.mysql5.7"
}

variable "db_user" {
  type    = string
  default = "k8suser"
}

variable "skip_final_snapshot" {
  type    = bool
  default = true
}

variable "max_allocated_storage" {
  type    = number
  default = 20
}

variable "db_replicas" {
  type    = number
  default = 1
}
