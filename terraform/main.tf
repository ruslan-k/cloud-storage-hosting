terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.2"
    }
  }
  required_version = ">= 1.9"
}

provider "google" {
  project = var.project_id
  region  = var.region
}