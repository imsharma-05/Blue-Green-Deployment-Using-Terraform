resource "aws_launch_template" "blue" {
    name_prefix = "blue-template"
    image_id = var.ami_id
    instance_type = var.instance_type
    user_data = base64encode(file("${path.module}/../../user-data/blue.sh"))
}

resource "aws_launch_template" "green" {
  name_prefix = "green-template"
  image_id = var.ami_id
  instance_type = var.instance_type
  user_data = base64encode(file("${path.module}/../../user-data/green.sh"))
}

resource "aws_autoscaling_group" "blue" {
    desired_capacity = 2
    max_size = 3
    min_size = 1

    vpc_zone_identifier = var.subnets
    launch_template {
      id = aws_launch_template.blue.id
      version = "$Latest"
    }

    target_group_arns = [var.blue_tg_arn]  
}

resource "aws_autoscaling_group" "green" {
    desired_capacity = 2
    max_size = 3
    min_size = 1

    vpc_zone_identifier = var.subnets
    launch_template {
      id = aws_launch_template.green
      version = "$Latest"
    }

    target_group_arns = [var.green_tg_arn]  
}