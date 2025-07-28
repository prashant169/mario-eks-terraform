variable "name" {
  description = "Name of the cluster"
  type = string    
}

variable "iam_role" {
  description = "IAM Role for the Jumphost Server"
  type = string
}