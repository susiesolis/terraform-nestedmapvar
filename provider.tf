//Configure the variable value in variable.tf file to the path where credentials reside.
provider "google" {

  credentials = file(var.credential_path)
}
