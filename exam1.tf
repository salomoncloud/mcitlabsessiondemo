locals {
  cloud_providers = ["azure", "aws", "gcp", "alibaba", "ibm"]
  cloud_owners = ["Microsoft", "Amazon", "Google", "Alibaba Group", "Vanguard Group"]
  cloud_provider_owners = { for index, provider in local.cloud_providers : provider => local.cloud_owners[index] }
  azure_in_list = contains(local.cloud_providers, "azure")
  flattened_sum_list = flatten(var.flat_sum_list)
}
variable "flat_sum_list" {
  type    = list(list(number))
  default = [[1,2,3],[1,2],[1,2,3,4],[1,2,3,4,5]]
}
output "cloud_providers" {
value = local.cloud_providers
}
output "check_azure" {
value = local.azure_in_list ? "Azure is part of the cloud list" : "Azure is not part of the cloud list"
}
output "cloud_provider_owners" {
  value = local.cloud_provider_owners
}
output "exam_flattened" {
  value = flatten(var.flat_sum_list)
}
