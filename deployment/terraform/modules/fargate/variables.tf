variable "name" {
  description = "the name of your stack, e.g. \"demo\""
}

variable "region" {
  description = "the AWS region in which resources are created"
}

variable "subnets" {
  description = "List of subnet IDs"
}

variable "ecs_service_security_groups" {
  description = "Comma separated list of security groups"
}

variable "container_port" {
  description = "Port of container"
}

variable "container_cpu" {
  description = "The number of cpu units used by the task"
}

variable "container_memory" {
  description = "The amount (in MiB) of memory used by the task"
}

variable "container_image" {
  description = "Docker image to be launched"
}

variable "container_image_fe" {
  description = "Docker image to be launched"
}

variable "aws_alb_target_group_arn" {
  description = "ARN of the alb target group"
}

variable "aws_alb_target_group_backend_arn" {
  description = "ARN of the alb target group"
}

variable "execution_role_arn" {
  type = string
  description = "the name of your stack, e.g. \"demo\""
}
variable "task_role_arn" {
  type = string
  description = "the name of your stack, e.g. \"demo\""
}
variable "service_desired_count" {
  description = "Number of services running in parallel"
}

variable "container_environment" {
  description = "The container environmnent variables"
  type        = list
}

# variable "container_secrets" {
#   description = "The container secret environmnent variables"
#   type        = list
# }

# variable "container_secrets_arns" {
#   description = "ARN for secrets"
# }



# variable "network_interface_id" {
#   type = string
#   default = "network_id_from_aws"
# }

# variable "ami" {
#     type = string
#     default = "ami-0d75513e7706cf2d9"
# }

# variable "instance_type" {
#     type = string
#     default = "t2.micro"
# }
# variable "sg_name" {
#   type = string
#   default = "sec_assessment"
# }
# variable "sg_description"{
#   type = string
#   default = "Web server firewall"
# }

# variable "vpc_id"{
#   type = string
#   # default = "vpc-0a862e76be454294e"
# }
# variable "subnet_id" {
#   type = string
#   # default = "subnet-09f12d767bd8f5b7c"
# }