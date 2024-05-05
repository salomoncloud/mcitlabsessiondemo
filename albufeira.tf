variable "simple_nested_list" {
  type    = list(list(string))
  default = [["a", "b"], ["c", "d"], ["e", "f"]]
}
locals{
  simple_local_flattened_list = flatten(var.simple_nested_list)
  flattened_list = flatten(var.simple_nested_list)
  flattened_map  = flatten([for k, v in var.simple_nested_list : [for kk, vv in v : { group = k, key = kk, value = vv }]])
  sum_element1=20
  sum_element2=30
}
output "list_flattened"{
value = flatten(var.simple_nested_list)
}
output "unflattened_list"{
value=var.simple_nested_list
}
