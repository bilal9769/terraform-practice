variable "location" {
  type    = string
}

variable "bcsla_code" {
  type    = string
}

variable "application_owner" {
  type    = string
}

variable "vm_admin_username" {
  type    = string
}

variable "vm_admin_password" {
  type      = string
  sensitive = true
}
