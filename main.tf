module "vpc" {
    source = "./modules/vpc"
}

module "alb" {
    source = "./modules/alb"
    vpc_id = module.vpc.vpc_id
    subnets = module.vpc.public_subnets
}

module "asg" {
    source = "./modules/asg"
    vpc_id = module.vpc.vpc_id
    subnets = module.vpc.public_subnets
    instance_type = var.instance_type
    ami_id = var.ami_id
    blue_tg_arn = module.alb.blue_tg_arn
    green_tg_arn = module.alb.green_tg_arn

}

