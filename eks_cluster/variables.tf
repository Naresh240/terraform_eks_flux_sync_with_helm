variable "project" {
  description = "Name to be used on all the resources as identifier. e.g. Project name, Application name"
  # description = "Name of the project deployment."
  type = string
}

variable "vpc_id" {
  type  = string
}

variable "desired_size" {
  type  = number
}

variable "min_size" {
  type  = number
}

variable "max_size" {
  type  = number
}
variable "private_subnet_ids" {
}

variable "public_subnet_ids" {
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}