# root/outputs.tf
output "cluster_name" {
  value = module.eks.cluster_name
}

output "bastion_public_ip" {
  value = module.bastion.bastion_public_ip
}
