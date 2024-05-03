variable "country_list" {
  default = ["Canada", "Portugal","India","Netherlands", "Namibia"]
}
output "join_countries" {
  value = join("+", var.country_list)
}
