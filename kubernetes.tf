locals { 
  cluster_names = ["k8batcha01", "k9batcha02", "k10batcha03", "k11batcha04", "k12batcha05"]
}

variable "clusterlist" {
  type = list(string)
}

variable "location_for_azure" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "location_for_azuretwo" {
  type = string
}

variable "rg_nametwo" {
  type = string
}

variable "name_node" {
  type = string
}

variable "node_count" {
  type = number
}

variable "mcittt" {
  type    = string
  default = "ccrf2301"
}

variable "dns_cluster" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "env" {
  type = string
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
  for_each            = {for cluster in local.cluster_names: cluster => cluster}
  name                = "${var.mcittt}${each.key}"
  location            = azurerm_resource_group.salomon_rg.location
  resource_group_name = azurerm_resource_group.salomon_rg.name
  dns_prefix          = var.dns_cluster

  default_node_pool {
    name       = var.name_node
    node_count = var.node_count
    vm_size    = var.vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = var.env
  }
}

resource "azurerm_kubernetes_cluster" "newclusters" {
  for_each            = {for cluster in var.clusterlist: cluster => cluster}
  name                = "${var.mcittt}${each.key}"
  location            = azurerm_resource_group.salomon_rg.location
  resource_group_name = azurerm_resource_group.salomon_rg.name
  dns_prefix          = var.dns_cluster

  default_node_pool {
    name       = var.name_node
    node_count = var.node_count
    vm_size    = var.vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = var.env
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "kube1nodepool" {
  for_each              = azurerm_kubernetes_cluster.newclusters
  name                  = "${each.key}"
  kubernetes_cluster_id = each.value.id
  vm_size               = var.vm_size
  node_count            = var.node_count

  tags = {
    Environment = var.env
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

output "id_second_clusters" {
  value = [
    for cluster in azurerm_kubernetes_cluster.newclusters: cluster.id
  ]
}

output "kube_config_clusters" {
  sensitive = true
  value = [
    for cluster in azurerm_kubernetes_cluster.newclusters: cluster.kube_config_raw
  ]
}

output "client_key_clusters" {
  sensitive = true
  value = [
    for cluster in azurerm_kubernetes_cluster.newclusters: cluster.kube_config.0.client_key
  ]
}

output "client_certificate_clusters" {
  sensitive = true
  value = [
    for cluster in azurerm_kubernetes_cluster.newclusters: cluster.kube_config.0.client_certificate
  ]
}

output "cluster_ca_certificate_clusters" {
  sensitive = true
  value = [
    for cluster in azurerm_kubernetes_cluster.newclusters: cluster.kube_config.0.cluster_ca_certificate
  ]
}

output "host_clusters" {
  sensitive = true
  value = [
    for cluster in azurerm_kubernetes_cluster.newclusters: cluster.kube_config.0.host
  ]
}
