provider "google" {
  credentials = var.credentials
  project     = var.project
  region      = var.region
}

# terraform {
#   backend "local" {
#     path = "./terraform.tfstate.d/QA_Server/terraform.tfstate"
#   }
# }

module "db-server" {
  source = "./modules/db-server"  
  instance_name = "db-server"
}

module "app-server" {
  source = "./modules/app-server"  
  instance_name = "app-server"
}

