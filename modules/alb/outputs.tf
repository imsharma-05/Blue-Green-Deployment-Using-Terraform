output "alb_dns" {
    value = aws_lb.app_lb.dns_name
}

output "blue_tg_arn" {
    value = aws_lb_target_group.blue.arn
}

output "green_tg_arn" {
    value = aws_lb_target_group.green.arn
}