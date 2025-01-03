terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

provider "google" {
  project     = var.project_id
  region      = var.region
  credentials = file("service-account-key.json")
}

# Create GCP Project
resource "google_project" "main" {
  name            = var.project_name
  project_id      = var.project_id
  billing_account = var.billing_account_id
}