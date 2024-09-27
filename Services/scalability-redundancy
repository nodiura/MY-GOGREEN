# services/scalability-redundancy.tf
resource "aws_autoscaling_group" "web" {
  desired_capacity     = 4
  max_size             = 10
  min_size             = 2
  vpc_zone_identifier = [aws_subnet.public.id]
  launch_configuration = aws_launch_configuration.web.id
}
resource "aws_launch_configuration" "web" {
  name          = "web-launch-configuration"
  image_id     = "ami-047d7c33f6e7b4bc4"  # Replace with the appropriate AMI
  instance_type = "t3.medium"
  lifecycle {
    create_before_destroy = true
  }
}