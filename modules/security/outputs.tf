output "keyvault_admin_object_id" {
  value     = azurerm_role_assignment.key_vault.principal_id
  sensitive = true
}
