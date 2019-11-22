resource "google_compute_instance" "test" {
  for_each = var.project_config
  name         = each.value.vm_name
  machine_type = each.value.machine_type
  zone         = each.value.zone

  boot_disk {
    initialize_params {
      size = "100"
      image = data.google_compute_image.vm_image[each.key].self_link
    }
  }
  //Subnetwork should be specified for custom subnetmode network
  network_interface {
    subnetwork = data.google_compute_subnetwork.xpn_subnetwork[each.key].self_link
  }

  service_account {
    scopes = ["userinfo-email", "compute-ro"]
  }

  project = each.value.project_id


}


output "Project_config" {
	value = var.project_config
}
