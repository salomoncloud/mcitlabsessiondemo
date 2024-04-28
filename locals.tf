locals {
name="salomon"
lastname="lubin"
city="514"

lengthsa=length(local.name)
length=length(local.lastname)
}
output "print" {
value = local.name
}
output "secondprint" {
value = local.lastname
}
output "lengthsa" {
value = local.lengthsa
}
output "length" {
value = local.length
}
