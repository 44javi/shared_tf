resource "azurerm_container_app_environment" "this" {
  name                       = "cae-${var.project}-${var.environment}"
  resource_group_name        = azurerm_resource_group.management.name
  location                   = azurerm_resource_group.management.location
  log_analytics_workspace_id = azurerm_log_analytics_workspace.this.id

  tags = local.default_tags
}
