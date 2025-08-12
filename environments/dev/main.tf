########################################
# Single settings object (define ONCE in dev.tfvars)
########################################
variable "settings" {
  description = "All env settings in one place to avoid repetition."
  type = object({
    project_id               : string
    region                   : string
    environment              : string         # "dev" or "prod"
    art_ingress_bucket_name  : string         # must be globally unique
    labels                   : optional(map(string), {})
  })
}

########################################
# Provider uses settings (no duplicate vars)
########################################
provider "google" {
  project = var.settings.project_id
  region  = var.settings.region
}

# If you use google-beta, uncomment:
# provider "google-beta" {
#   project = var.settings.project_id
#   region  = var.settings.region
# }

########################################
# Call your existing module (unchanged)
# Your module expects individual vars; we map from settings.* once.
########################################
module "art_ingress_bucket" {
  source     = "../../modules/storage-buckets"

  bucket_name = var.settings.art_ingress_bucket_name
  project_id  = var.settings.project_id
  region      = var.settings.region
  environment = var.settings.environment
}


########################################
# (Optional) re-expose module outputs
########################################
output "art_ingress_bucket_name" {
  value       = module.art_ingress_bucket.bucket_name
  description = "Null in prod, since your module uses count=0 when environment != dev."
}
