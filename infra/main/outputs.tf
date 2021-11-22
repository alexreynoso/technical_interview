output "tech_int" {
  value       = {
    "ec2"     = module.tech_int.ec2
  }

  sensitive   = false
  description = "Outputs for the azcsdcops_vault_nvirginia module"
}

output "password" {
  value     = module.tech_int.password
  sensitive = true
}

output "user" {
  value     = module.tech_int.user
  sensitive = false
}

output "access_key" {
  value     = module.tech_int.access_key
  sensitive = true
}

output "secret_key" {
  value     = module.tech_int.secret_key
  sensitive = true
}
