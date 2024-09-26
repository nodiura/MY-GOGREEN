# main.tf
provider "aws" {
  region = var.aws_region
}
module "web_tier" {
  source = "./services/web-tier"
}
module "application_tier" {
  source = "./services/application-tier"
}
module "data_tier" {
  source = "./services/data-tier"
}
module "security_compliance" {
  source = "./services/security-compliance"
}
module "monitoring" {
  source = "./services/monitoring"
}
module "networking" {
  source = "./services/networking"
}
module "scalability_redundancy" {
  source = "./services/scalability-redundancy"
}