module "vpc" {
  source = "./modules/vpc"
  cidr =  var.cidr
  name = var.name
  private_subnets = var.private_subnets
  public_subnets = var.public_subnets
  availability_zones = var.availability_zones
}

# module "ecr" {
#   source = "./modules/ecr"
#   name = var.name
# }

module "iam" {
  source = "./modules/iam"
   name = var.name
}

module "security" {
  depends_on = [
    module.vpc
  ]
  source = "./modules/security"
  name = var.name
  vpc_id = module.vpc.id
  container_port = var.container_port
}

module "load_balancer" {
  depends_on = [
    module.vpc
  ]
  source = "./modules/loadbalancer"
  name = var.name
  alb_security_groups = [module.security.alb]
  health_check_path = "/"
  vpc_id = module.vpc.id
  subnets = module.vpc.public_subnets
}
   
     
module "fargate" {
  depends_on = [
    module.vpc
  ]
  source = "./modules/fargate"
  region = var.region
  name = var.name
  container_image = var.container_image
  container_image_fe = var.container_image_fe 
  container_environment = ["prod"]
  container_port = var.container_port
  container_memory = var.container_memory
  container_cpu = var.container_cpu
  ecs_service_security_groups = [module.security.ecs_tasks]
  execution_role_arn = module.iam.execution_role_arn
  task_role_arn = module.iam.task_role_arn
  service_desired_count = var.service_desired_count
  subnets = module.vpc.public_subnets
  aws_alb_target_group_arn = module.load_balancer.aws_alb_target_group_arn
  aws_alb_target_group_backend_arn = module.load_balancer.aws_alb_target_group_backend_arn

}

