data "google_compute_image" "vm_image" {
  for_each = var.project_config
  name = each.value.osimages
  project = each.value.image_project
}

//Get data related to HOST xpn project where vm network would live.
data "google_compute_network" "xpn_network" {
  for_each = var.project_config
  name = "kube101"
  project = each.value.project_id
}

//// Get data related to subnet inside the Host xpn project which hrzmgmt
data "google_compute_subnetwork" "xpn_subnetwork" {
  for_each = var.project_config
  name   = each.value.subnet_name
  region = "us-central1"
  project = each.value.project_id
}
