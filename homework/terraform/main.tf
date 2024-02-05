terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  project = "lithe-maker-411313"
  region = "us-central1"
  zone = "us-central1-a"
}



resource "google_storage_bucket" "data-lake-bucket" {
  name          = "dez-quanns-bucket"
  location      = "US"

  # Optional, but recommended settings:
  storage_class = "STANDARD"
  uniform_bucket_level_access = true

  versioning {
    enabled     = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 30  // days
    }
  }

  force_destroy = true
}


resource "google_bigquery_dataset" "dataset" {
  dataset_id = "dez_quanns_big_query"
  project    = "lithe-maker-411313"
  location   = "US"
}