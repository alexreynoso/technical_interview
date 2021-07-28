output "tech_int" {
  value       = {
    "ec2"     = module.tech_int.ec2
  }

  sensitive   = false
  description = "Outputs for the azcsdcops_vault_nvirginia module"
}
