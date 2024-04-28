locals {
name="salomon"
lastname="lubin"
city="montreal"
landmark="BellCenter"

lengthsa=length(local.name)
length=length(local.lastname)
lengthcity=length(local.city)
lengthbell=length(local.landmark)
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
output "lengthcity" {
value = local.lengthcity
}
output "lengthbell" {
value = local.landmark
}
