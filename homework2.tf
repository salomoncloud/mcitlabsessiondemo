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

variable "love_string" {
  default = "I love "
}

variable "canada_string" {
  default = "Canada "
}

output "trim_canada" {
  value = trim(var.canada_string,"  ")
}

output "concatenat_canada" {
  value = "${var.love_string}${var.canada_string}"
}
