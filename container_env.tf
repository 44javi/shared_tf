resource "azurerm_container_app_environment" "this" {
  name                = "${var.client}-projects-${var.suffix}"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

}

resource "azurerm_role_assignment" "container_env_cert_officer" {
  scope                = azurerm_key_vault.this.id
  role_definition_name = "Key Vault Certificates Officer"
  principal_id         = azurerm_container_app_environment.this.identity[0].principal_id
}