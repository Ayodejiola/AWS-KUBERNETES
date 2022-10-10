variable "name" {
  description = "the name of your stack, e.g. \"demo\""
  default = "assesment"
}

variable "region" {
  description = "aws region"
  default = "eu-west-1"
}

variable "aws-access-key" {
  type = string
}

variable "aws-secret-key" {
  type = string
}

variable "availability_zones" {
  description = "a comma-separated list of availability zones, defaults to all AZ of the region, if set to something other than the defaults, both private_subnets and public_subnets have to be defined as well"
  default     = ["eu-west-1a", "eu-west-1b","eu-west-1c","eu-west-1d"]
}

variable "cidr" {
  description = "the name of your stack, e.g. \"demo\""
  default = "192.168.0.0/16"
}

variable "public_subnets" {
  description = "the name of your stack, e.g. \"demo\""
  default = ["192.168.1.0/24","192.168.3.0/24","192.168.4.0/24"]
}

variable "private_subnets" {
  description = "the name of your stack, e.g. \"demo\""
  default = ["192.168.2.0/24"]
}

variable "container_port" {
  description = "the name of your stack, e.g. \"demo\""
  default = 5000
}

variable "service_desired_count" {
  description = "the name of your stack, e.g. \"demo\""
  default = 1
}
variable "container_cpu" {
  description = "the name of your stack, e.g. \"demo\""
  default = 512
}

variable "container_memory" {
  description = "the name of your stack, e.g. \"demo\""
  default = 1024
}
variable "container_image" {
  description = "the name of your stack, e.g. \"demo\""
  default = "test_project/test"
}
variable "container_image_fe" {
  description = "the name of your stack, e.g. \"demo\""
  default = "test_project/test:fe"
}