module "art_ingress_bucket" {
  source      = "../../modules/storage_buckets"

  bucket_name = "art-blume-ingress-dev"
  project_id  = "prj-lssfs-d-art-zt48"
  region      = "europe-west4"               
  environment = "dev"
}
