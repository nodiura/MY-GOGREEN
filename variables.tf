# variables.tf
variable "aws_region" {
  description = "The AWS region to deploy the resources."
  default     = "us-east-1"  # Change this as needed
}
variable "bucket_name" {
  description = "The S3 bucket name for document storage."
}
variable "db_instance_class" {
  description = "The instance class for the RDS database."
  default     = "db.m5.large"
}
variable "db_storage_type" {
  description = "The storage type for the RDS database."
  default     = "io1"
}
variable "db_iops" {
  description = "IOPS for the RDS DB instance."
  default     = 21000
}