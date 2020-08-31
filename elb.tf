resource "aws_elb" "main-elb" {
  name            = "${var.project_name}-elb"
  subnets         = [aws_subnet.main-public-1.id]
  security_groups = [aws_security_group.main-elb-sg.id]
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  #number_of_instances = "${var.web_instance_count}"
  #instances           = "${aws_instance.web.*.id}"
  #instances                   =  element(aws_instance.web.*.id, count.index)
  cross_zone_load_balancing   = true
  connection_draining         = true
  connection_draining_timeout = 400
  tags = {
    Name = "${var.project_name}-elb"
  }
}

