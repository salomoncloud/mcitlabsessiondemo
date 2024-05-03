variable "string_list" {
  default = ["Canada", "Portugal","India","Netherlands", "Namibia"]
}
output "join_example" {
  value = join("+", var.string_list)
}
locals {
  contains_keyword = contains(split(" ", var.original_string), "Canada")
}
