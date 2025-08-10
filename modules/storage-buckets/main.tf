resource "google_storage_bucket" "art_blume_ingress" {

  count = var.environment == "dev" ? 1 : 0

  name     = var.bucket_name
  project  = var.project_id
  location = var.region

  storage_class = "STANDARD"
  force_destroy = false

  versioning {
    enabled = true
  }

  uniform_bucket_level_access = true

  labels = {
    environment = var.environment
    managed_by  = "terraform"
    description = "Used for file ingress process"
  }
}
