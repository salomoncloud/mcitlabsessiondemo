locals {
  cloud_providers = ["azure", "aws", "gcp", "alibaba", "ibm"]
  cloud_owners = ["Microsoft", "Amazon", "Google", "Alibaba Group", "Vanguard Group"]
  cloud_provider_owners = { for index, provider in local.cloud_providers : provider => local.cloud_owners[index] }
  azure_in_list = contains(local.cloud_providers, "azure")
  flat_sum_exam = [[1,2,3],[1,2],[1,2,3,4],[1,2,3,4,5]]
}
output "sumoflistinlocals" {
  value = sum([for numberoutput in local.flat_sum_exam : tonumber(numberoutput)])
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
