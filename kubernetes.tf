locals{ 
  cluster_names=["k8batcha01","k9batcha02","k10batcha03","k11batcha04","k12batcha05"]
}
resource "azurerm_resource_group" "salomon_rg" {
  name     = var.rg_name
  location = var.location_for_azure
}
variable "location_for_azure" {
value = "Canada Central"
}
variable "rg_name" {
value = "salomon_resource_group"
}
