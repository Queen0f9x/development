terraform {
  required_version = ">= 0.13.0"

  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.1-rc3"
    }
  }
}

provider "proxmox" {
  pm_api_url          = var.api_url
  pm_api_token_id     = var.api_token_id
  pm_api_token_secret = var.api_token
  pm_timeout          = 800
  pm_parallel         = 1
  pm_tls_insecure     = true
}
