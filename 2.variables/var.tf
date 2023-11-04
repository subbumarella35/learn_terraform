# variable "sample"{
#     default = "subbu"
# } 
# variable "intergervalue" {
#   default=100
# }

# output "printing_sample_name" {
#   value = var.sample
# }
# output "printing_integer" {
#   value="value of name is ${var.intergervalue}"
# }

# # variable Data types in terrarform 
# #1.string
# #2.list
# #3.boolean

# # variable types
# # 1. plain
# # 2. list
# # 3. map

# # 1. plain
#  variable "Plain" {
#    default="Devops Training"
#  }

#  #2 .list
#  variable "List_Ex" {
#    default=["aws","azure","gcp"]
#  }

 #3. map
 variable "map_ex" {
    type = map(string)
    default={
    Inter={
        name= "m.p.c"
        fee="10,000"
        city="CTP"
    }
   }
 }

 output "printing_values" {
   #count=length(var.map_ex)
   value = var.map_ex

 }