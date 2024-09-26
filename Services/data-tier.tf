# services/data-tier.tf
resource "aws_db_instance" "example" {
  allocated_storage    = 20
  storage_type        = var.db_storage_type
  engine             = "mysql"
  engine_version     = "8.0"
  instance_class     = var.db_instance_class
  username           = "exampleuser"
  password           = "password"  # Consider using AWS Secrets Manager to store credentials securely
  db_name            = "exampledb"
  multi_az           = true
  iops               = var.db_iops
  tags = {
    Name = "GoGreenRDS"
  }
}
resource "aws_s3_bucket" "documents" {
  bucket = var.bucket_name
  acl    = "private"
  lifecycle_rule {
    id      = "move-to-glacier"
    enabled = true
    transitions {
      days          = 90
      storage_class = "GLACIER"
    }
  }
}