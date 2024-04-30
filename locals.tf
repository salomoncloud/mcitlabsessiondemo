locals {
name="salomon"
lastname="lubin"
city="montreal"
landmark="BellCenter"
landmark2="Forum"
landmark3="poutine"
landmark4="justepourrire"
landmark5="maplesyrup"
winterListOfSports=["hockey", "Skiing", "figure skating"]
universityListOfSchools=["Mcgill", "Concordia", "ETS"]

lengthsa=length(local.name)
length=length(local.lastname)
lengthcity=length(local.city)
lengthbell=length(local.landmark)
lengthforum=length(local.landmark2)
lengthpoutine=length(local.landmark3)
lengthjustepourrire=length(local.landmark4)
lengthmaplesyrup=length(local.landmark5)
}
output "wintersportslist"{
  value=[for wintersports in local.winterListOfSports:sport]
}
output "universitylist"{
    value=[for sport in local.universityListOfSchools:schools]
}
output "sportslist" {
  value=[for sports in var.sports:sports]
}
output "foodlist" {
  value=[for food in var.food:food]
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
output "lengthpoutine" {
value = local.landmark3
}
output "lengthjustepourrire" {
value = local.landmark4
}
output "lengthmaplesyrup" {
value = local.landmark5
}
output "company_name_output"{
value=var.company_name
}
output "years_of_establishment_output"{
value=var.years_of_establishment
}
output "ifelsecheck_output"{
value=var.ifelsecheck
}
