variable "gcp_project_id" {
  type        = string
  description = "Google Cloud project ID"
  default     = "razzlebear"
}

variable "gcp_credentials" {
  type        = string
  sensitive   = true
  description = "Google Cloud service account credentials"
  default     = "/Users/creedperry/.config/gcloud/razzlebear-sa.json"
}

variable "gcp_region" {
  type        = string
  description = "Google Cloud region"
  default     = "us-east1"
}

variable "gcp_zone" {
  type        = string
  description = "Google Cloud zone"
  default     = "us-east1-b"
}
