locals {
name="salomon"
lastname="lubin"
city="montreal"
landmark="BellCenter"
landmark2="OldForum"
landmark3="PontJacqueCartier"
landmark4="ChezMaTanteHotDogs"
landmark5="MCIT"

lengthsa=length(local.name)
length=length(local.lastname)
lengthcity=length(local.city)
lengthbell=length(local.landmark)
lengthforum=length(local.forum)
lengthpont=length(local.pont)
lengthhd=length(local.hd)
lengthmcit=length(local.mcit)
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
value = local.forum
}
output "lengthpont" {
value = local.pont
}
output "lengthhd" {
value = local.hd
}
output "lengthmcit" {
value = local.mcit
}
