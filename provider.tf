terraform {
  required_providers {
    google = {
        soursource = "hashicorp/google"
        version = "4.52.0"
    }
  }
}

provider "google" {
  project = "git-terra-gcp"
  region  = "us-central1"
  zone    = "us-central1-c"
}