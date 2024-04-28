locals {
name="salomon"
lastname="lubin"
city="montreal"

lengthsa=length(local.name)
length=length(local.lastname)
}
output "print" {
value = local.name
}
output "secondprint" {
value = local.lastname
}
output "printcity" {
value = local.city
}
output "lengthsa" {
value = local.lengthsa
}
output "length" {
value = local.length
}
