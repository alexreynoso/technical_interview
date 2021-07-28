# USER PROVIDED VARIABLES

variable "os" {
  type        = map(string)
  description = "Os family for the os distribution"
}

variable "ssh" {
  type        = map(string)
  description = "Os family for the os distribution"
}

variable "distro" {
  type        = string
  description = "Os distriubution for the ami"
}

variable "region" {
  type        = string
  description = "Application inside the ami"
}

variable "ansible" {
  type        = map(string)
  description = "Ansible install script properties"
}

variable "playbook" {
  type        = map(string)
  description = "Playbook properties"
}

variable "ami_owner" {
  type        = map(string)
  description = "Owner for the base ami to build upon"
}

variable "ami_filter" {
  type        = map(string)
  description = "Filter for the base ami to build upon"
}

variable "volume_size" {
  type        = number
  description = "Volume size depending on environment"
}

variable "instance_type" {
  type        = string
  description = "Instance type depending on environment"
}
