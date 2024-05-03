variable "country_list" {
  default = ["Canada", "Portugal", "India", "Netherlands", "Namibia"]
}

output "join_countries" {
  value = join("+", var.country_list)
}

locals {
  contains_canada = contains(var.country_list, "Canada")
}

output "string_contains_canada" {
  value = local.contains_canada ? "String contains 'Canada'" : "String does not contain 'Canada'"
}
