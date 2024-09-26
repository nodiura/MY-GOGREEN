# outputs.tf
output "web_tier_instance_ids" {
  value = module.web_tier.instance_ids
}
output "app_tier_instance_ids" {
  value = module.application_tier.instance_ids
}
output "s3_bucket_id" {
  value = module.data_tier.s3_bucket_id
}
output "rds_instance_id" {
  value = module.data_tier.rds_instance_id
}