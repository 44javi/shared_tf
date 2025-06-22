# Root module outputs

output "resource_group_id" {
  description = "main resource group where most resources will be placed"
  value       = azurerm_resource_group.main.id
}

output "resource_group_name" {
  description = "name of main resource group where most resources will be placed"
  value       = azurerm_resource_group.main.name
}

output "keyvault_admin_object_id" {
  value     = azurerm_role_assignment.key_vault.principal_id
  sensitive = true
}

output "container_app_environment_id" {
  value = azurerm_container_app_environment.this.id
  description = "The ID of the Container App Environment"
}

output "container_app_environment_static_ip" {
  value = azurerm_container_app_environment.this.static_ip_address
}