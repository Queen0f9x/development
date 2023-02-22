terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  project     = var.gcp_project_id
  credentials = var.gcp_credentials
  region      = var.gcp_region
  zone        = var.gcp_zone
}

module "network" {
  source          = "../modules/networking"
  gcp_project_id  = var.gcp_project_id
  gcp_credentials = var.gcp_credentials
  gcp_region      = var.gcp_region
  gcp_zone        = var.gcp_zone
}

module "compute" {
  source          = "../modules/compute"
  gcp_project_id  = var.gcp_project_id
  gcp_credentials = var.gcp_credentials
  gcp_region      = var.gcp_region
  gcp_zone        = var.gcp_zone
}
