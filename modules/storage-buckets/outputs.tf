# Handles count = 1 in dev, = 0 in prod
output "bucket_name" {
  description = "The name of the bucket (null if not created in this env)."
  value       = length(google_storage_bucket.art_blume_ingress) > 0 ? google_storage_bucket.art_blume_ingress[0].name : null
}

output "self_link" {
  description = "The server-defined URL (null if not created)."
  value       = length(google_storage_bucket.art_blume_ingress) > 0 ? google_storage_bucket.art_blume_ingress[0].self_link : null
}

output "url" {
  description = "gs:// URL (null if not created)."
  value       = length(google_storage_bucket.art_blume_ingress) > 0 ? "gs://${google_storage_bucket.art_blume_ingress[0].name}" : null
}
