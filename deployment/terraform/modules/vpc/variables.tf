variable "name" {
  description = "the name of your stack, e.g. \"demo\""
}

variable "cidr" {
  type = string
  description = "The CIDR block for the VPC."
}

variable "public_subnets" {
  type = list
  description = "List of public subnets"
}

variable "private_subnets" {
  type = list
  description = "List of private subnets"
}

variable "availability_zones" {
  description = "List of availability zones"
}


