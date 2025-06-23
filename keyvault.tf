# Creates a Key Vault 
data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "this" {
  name                       = "kv-${var.project}-${var.suffix}-${random_string.this.result}"
  resource_group_name        = azurerm_resource_group.management.name
  location                   = var.region
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "standard"
  enable_rbac_authorization  = true
  soft_delete_retention_days = 30
  purge_protection_enabled   = true

  tags = local.default_tags
}

# Key vault permission
resource "azurerm_role_assignment" "key_vault" {
  scope                = azurerm_key_vault.this.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = data.azurerm_client_config.current.object_id
}

