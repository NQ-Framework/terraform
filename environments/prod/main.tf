locals {
  env = "prod"
}

terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  version     = "3.5.0"
  project     = var.project
  credentials = file("../../nq-framework-e6b01ad3b116.json")
}

module "nq-server" {
  source               = "../../modules/cloud-run"
  project              = var.project
  env                  = local.env
  name                 = var.server_name
  firebase_private_key = var.firebase_private_key
  firebase_client_email = var.firebase_client_email
}