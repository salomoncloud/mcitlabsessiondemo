# Define local variables
locals {
cloud_providers = ["azure", "aws", "gcp", "alibaba", "ibm"]
}
# Check if 'azure' is in the list and store the result in a local variable
locals {
azure_in_list = contains(local.cloud_providers, "azure")
}
# Output the list of cloud providers
output "cloud_providers" {
value = local.cloud_providers
}
# Output the result based on the check
output "check_azure" {
value = local.azure_in_list ? "Azure is part of the cloud list" : "Azure is not part of the cloud list"
}

