variable "gcp_project_id" {
  type = string
}

variable "gcp_credentials" {
  type = string
}

variable "gcp_region" {
  type = string
}

variable "gcp_zone" {
  type = string
}

variable "vm_type" {
  type        = string
  description = "Google Cloud VM"
  default     = "e2-micro"
}