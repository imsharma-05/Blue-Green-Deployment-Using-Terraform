resource "aws_lb" "app_lb" {
    name = "blue-green-alb"
    load_balancer_type = "application"
    subnets = var.subnets
}

resource "aws_lb_target_group" "blue" {
    name = "blue-tg"
    port = 80
    protocol = "HTTP"
    vpc_id = var.vpc_id
}

resource "aws_lb_target_group" "green" {
    name = "green-tg"
    port = 80
    protocol = "HTTP"
    vpc_id = var.vpc_id
}


resource "aws_lb_listener" "listener" {
    load_balancer_arn =  aws_lb.app_lb.arn
    port = 80

    default_action {
      type = "forward"
      target_group_arn = aws_lb_target_group.blue.arn
    }
}

