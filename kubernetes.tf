locals{ 
  cluster_names=["k8batcha01","k9batcha02","k10batcha03","k11batcha04","k12batcha05"]
}
resource "azurerm_resource_group" "salomon_rg" {
  name     = var.rg_name
  location = var.location_for_azure
}
resource "azurerm_resource_group" "fritz_rg" {
  name     = var.rg_nametwo
  location = var.location_for_azuretwo
}
variable "location_for_azure" {
type = string
default = "Canada East"
}
variable "rg_name" {
type = string
default = "salomon_resource_group"
}
variable "location_for_azuretwo" {
type = string
default = "West India"
}
variable "rg_nametwo" {
type = string
default = "fritz_resource_group"
}
