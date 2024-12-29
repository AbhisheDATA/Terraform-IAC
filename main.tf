terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

# Create GCP Project
resource "google_project" "main" {
  name            = var.project_name
  project_id      = var.project_id
  billing_account = var.billing_account_id
}

# Enable required APIs
resource "google_project_service" "services" {
  for_each = toset([
    "compute.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "iam.googleapis.com",
    "artifactregistry.googleapis.com"
  ])
  
  project = google_project.main.project_id
  service = each.value

  disable_dependent_services = true
  disable_on_destroy        = false

  depends_on = [google_project.main]
}