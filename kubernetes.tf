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
resource "azurerm_kubernetes_cluster" "batchabcd" {
  for_each            = {for cluster in local.cluster_names: cluster=>cluster}
  name                = "${var.prefix}cluster"
  location            = azurerm_resource_group.azureresourcegroup.location
  resource_group_name = azurerm_resource_group.azureresourcegroup.name
  dns_prefix          = "exampleaks1"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}
output "id" {
  value = [
    for cluster in azurerm_kubernetes_cluster.batchabcd: cluster.id
  ]
}
 
output "kube_config" {
  sensitive = true
  value = [ 
    for cluster in azurerm_kubernetes_cluster.batchabcd: cluster.kube_config_raw
  ]
}
 
output "client_key" {
  sensitive = true
  value = [
    for cluster in azurerm_kubernetes_cluster.batchabcd: cluster.kube_config.0.client_key
  ]
}
 
output "client_certificate" {
  sensitive = true
  value = [
    for cluster in azurerm_kubernetes_cluster.batchabcd: cluster.kube_config.0.client_certificate
  ]
}
 
output "cluster_ca_certificate" {
  sensitive = true
  value = [
    for cluster in azurerm_kubernetes_cluster.batchabcd: cluster.kube_config.0.cluster_ca_certificate
  ]
}
 
output "host" {
  sensitive = true
  value = [
    for cluster in azurerm_kubernetes_cluster.batchabcd: cluster.kube_config.0.host
  ]
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
