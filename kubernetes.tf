locals{ 
  cluster_names=["k8batcha01","k9batcha02","k10batcha03","k11batcha04","k12batcha05"]
}
resource "azurerm_resource_group" "salomon_rg" {
  name     = var.rg_name
  location = var.location_for_azure
}
variable "location_for_azure" {
type = string
default = "Canada Central"
}
variable "rg_name" {
type = string
default = "salomon_resource_group"
}
