resource "aws_lb" "nlb" {
  name               = var.lb_name
  internal           = var.lb_internal_facing
  load_balancer_type = var.lb_type
  subnets            = var.subnets

  enable_deletion_protection = var.del_protection

  tags = {
    name = "${var.lb_name}"
  }
}

resource "aws_lb_target_group" "test" {
  name        = var.nlb_tg_name
  port        = var.appln_port
  protocol    = var.protocol
  vpc_id      = var.vpc_id
  target_type = var.target_type

  health_check {
    port                = var.appln_port
    healthy_threshold   = 6
    unhealthy_threshold = 2
    timeout             = 2
    interval            = 5
    protocol            = "TCP"
  }
}

resource "aws_lb_target_group_attachment" "nlb_tg_atch_1" {
  count            = length(var.target_ids)
  target_group_arn = aws_lb_target_group.test.arn
  target_id        = var.target_ids[count.index]
  port             = var.appln_port
}

resource "aws_lb_listener" "nlb_listener" {
  load_balancer_arn = aws_lb.nlb.arn
  protocol          = "TCP"
  port              = var.listener_port

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test.arn
  }
}
