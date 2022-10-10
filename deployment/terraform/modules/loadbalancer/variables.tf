variable "name" {
  description = "the name of your stack, e.g. \"demo\""
}

variable "subnets" {
  description = "Comma separated list of subnet IDs"
}

variable "vpc_id" {
  description = "VPC ID"
}

variable "alb_security_groups" {
  type = list
  description = "Comma separated list of security groups"
}

# variable "alb_tls_cert_arn" {
#   description = "The ARN of the certificate that the ALB uses for https"
# }

variable "health_check_path" {
  description = "Path to check if the service is healthy, e.g. \"/status\""
}