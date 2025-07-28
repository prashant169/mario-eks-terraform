variable "cluster_name" { }
variable "cluster_role_arn" { }
variable "node_role_arn" { }
variable "subnet_ids" { type = list(string) }
variable "vpc_id" { }
variable "desired_size" { }
variable "max_size" { }
variable "min_size" { }
variable "instance_type" { }