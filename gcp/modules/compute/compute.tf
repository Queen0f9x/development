# Create a single Compute Engine instance
resource "google_compute_instance" "vm-one" {
  name         = "vm-one"
  machine_type = var.vm_type
  zone         = var.gcp_zone

  boot_disk {
    initialize_params {
      image = "cos-cloud/cos-101-lts"
    }
  }

  network_interface {
    network    = "default"

    access_config {
      # Include this section to give the VM an external IP address
    }
  }
}
