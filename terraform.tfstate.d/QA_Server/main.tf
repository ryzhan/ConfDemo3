provider "google" {
  credentials = var.credentials
  project     = var.project
  region      = var.region
}

module "qa-db-server" {
  source = "./modules/qa-db-server"  
  instance_name = "qa-db-server"
}

module "qa-app-server" {
  source = "./modules/qa-app-server"  
  instance_name = "qa-app-server"
}

