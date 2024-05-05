variable "simple_nested_list" {
  type    = list(list(string))
  default = [["a", "b"], ["c", "d"], ["e", "f"]]
}
variable "nested_map" {
  type    = map(map(string))
  default = {
    group1 = {"name" = "Alice", "age" = "25"}
    group2 = {"name" = "Bob", "age" = "30"}
    group3 = {"name" = "Charlie", "age" = "35"}
  }
}
variable "total_output"{
type = list(string)
default = ["150", "150", "150"]
}
locals{
  number_output = ["724", "238", "219", "291", "555"]
  world_leaders = ["Obama", "Trudeau", "Macron"]
  world_countries = ["US", "CAD", "FRA"]
  world_countries_associated = { for index, world_leader in local.world_leaders : world_leader => local.world_countries[index] }

  incremented_output = [
    for value in var.total_output : tostring(tonumber(value) + 10)
  ]
  characters = ["luke", "yoda", "darth"]
  enemies_destroyed = [4252, 900, 20000056894]
  character_enemy_map =   { for index,character in local.characters: # Convert character list to a set
      character => local.enemies_destroyed[index]
  }
  simple_local_flattened_list = flatten(var.simple_nested_list)
  flattened_list = flatten(var.simple_nested_list)
  flattened_map  = flatten([for k, v in var.nested_map : [for kk, vv in v : { group = k, key = kk, value = vv }]])
  sum_element1=20
  sum_element2=30
}
output "list_flattened"{
value = flatten(var.simple_nested_list)
}
output "unflattened_list"{
value=var.simple_nested_list
}
output "flattened_nested_map"{
value = local.flattened_map
}
output "nested_map"{
value = var.nested_map
}
output "character"{
value = local.characters
}
output "enemies_destroyed"{
value = local.enemies_destroyed
}
output "character_enemy_map"{
value = local.character_enemy_map
}
output "incremented_output_show" {
  value=local.incremented_output
}
output "sumoffivenumbers"{
    value=sum([for numberoutput in local.number_output: tonumber(numberoutput)])
}
output "world_countries_associated"{
value = local.world_leaders
}
