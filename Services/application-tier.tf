# services/application-tier.tf
resource "aws_instance" "app" {
  count         = 4
  ami           = "ami-0c55b159cbfafe1f0"  # Replace with the appropriate AMI
  instance_type = "c5.large"
  tags = {
    Name = "AppServer-${count.index}"
  }
}
resource "aws_ecs_cluster" "app_cluster" {
  name = "${var.project_name}-ecs-cluster"
}
resource "aws_api_gateway_rest_api" "api" {
  name        = "${var.project_name}-api"
  description = "API for the application."
}