variable "classs" {
    type = set(string)
    default=["apple","banana","grap"]
}
locals {
    my_list=tolist(var.classs)
}
output "printgClassName" {
 
    count=length(my_list)
    value = local.my_list[count.index]

}