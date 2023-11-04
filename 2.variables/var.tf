variable "sample"{
    default = "subbu"
} 
variable "intergervalue" {
  default=100
}

output "printing_sample_name" {
  value = var.sample
}
output "printing_integer" {
  value="value of name is ${var.intergervalue}"
}