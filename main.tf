variable project_config {
  description = "The metadata required to create vm"
  type        = "map"
  default     = {}
}
variable credential_path {
  type    = string
}


output "Project_config" {
	value = var.project_config
}
