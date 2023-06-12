variable "api_url" {
  description = "proxmox node URL"
  type        = string
  sensitive   = true
}

variable "api_token" {
  description = "api token for connecting to VMs"
  type        = string
  sensitive   = true
}

variable "api_token_id" {
  description = "proxmox user id and token id"
  type        = string
  sensitive   = true
}

variable "proxmox_host" {
  default = "blackdragon"
}

variable "template_name" {
  default = "jammy-template"
}