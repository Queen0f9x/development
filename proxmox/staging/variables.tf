variable "api_token" {
    descriptions = "api token for connecting to VMs"
    type         = string
  
}

variable "proxmox_host" {
    default = "blue"
}

variable "template_name" {
    default = "jammy-template"
}