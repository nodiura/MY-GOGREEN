# services/web-tier.tf
resource "aws_instance" "web" {
  count         = 4
  ami           = "ami-0c55b159cbfafe1f0"  # Replace with the appropriate AMI
  instance_type = "t3.medium"
  tags = {
    Name = "WebServer-${count.index}"
  }
}
resource "aws_elb" "web_elb" {
  name               = "${var.project_name}-web-elb"
  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
  listener {
    instance_port     = 80
    instance_protocol = "HTTP"
    lb_port           = 80
    lb_protocol       = "HTTP"
  }
  health_check {
    target              = "HTTP:80/"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
  }
}