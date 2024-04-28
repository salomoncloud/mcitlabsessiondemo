locals {
servicename="abracadabra"
forum="abracadabramcit"

lengthsa=length(local.servicename)
length=length(local.forum)
}
output "print" {
value = local.servicename
}
output "secondprint" {
value = local.forum
}
output "lengthsa" {
value = local.lengthsa
}
