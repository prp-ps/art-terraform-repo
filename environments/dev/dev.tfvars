# Define everything ONCE here
settings = {
  project_id              = "prj-lssfs-d-art-zt48"
  region                  = "europe-west2"
  environment             = "dev"                 # <- drives module count (1 for dev, 0 for prod)
  art_ingress_bucket_name = "art-dev-ingress-zt48"  # must be globally unique

  # Optional labels bag (your module doesn't use it yet)
  # labels = {
  #   env    = "dev"
  #   system = "art"
  # }
}
