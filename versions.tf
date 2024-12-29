terraform {
  required_version = ">= 1.0.0"
  
  cloud {
    workspaces {
      name = "Terraform-IAC"
    }
  }
}
