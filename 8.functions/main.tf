variable "classs" {    
    default=["apple","banana","grap"]
}

output "printgClassName" {
 
    for_each=var.classs
    value = each.value

}