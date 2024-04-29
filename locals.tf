locals {
name="salomon"
lastname="lubin"
city="montreal"
landmark="BellCenter"
landmark2="Forum"

lengthsa=length(local.name)
length=length(local.lastname)
lengthcity=length(local.city)
lengthbell=length(local.landmark)
lengthforum=length(local.landmark2)
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
output "lengthforum" {
value = local.landmark2
}
