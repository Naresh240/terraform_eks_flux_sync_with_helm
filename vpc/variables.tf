variable "project" {
  description = "Name to be used on all the resources as identifier. e.g. Project name, Application name"
  type = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
}

variable "subnet_count" {
  description = "The number of subnet bits for the CIDR. For example, specifying a value 8 for this parameter will create a CIDR with a mask of /24."
  type        = number
}
