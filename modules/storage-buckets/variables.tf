variable "bucket_name" {
  description = "Name of the GCS bucket to create"
  type        = string
}

variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "Region for GCP resources"
  type        = string
}

variable "environment" {
  description = "Deployment environment (dev/prod)"
  type        = string
}

variable "labels" {
  type        = map(string)
  description = "Labels to apply on the bucket."
  default     = {}
}