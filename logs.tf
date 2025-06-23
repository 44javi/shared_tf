resource "azurerm_monitor_action_group" "alerts" {
  name                = "alerts-${var.project}-${var.suffix}"
  resource_group_name = azurerm_resource_group.management.name
  short_name          = "alerts"

  email_receiver {
    name          = "alerts"
    email_address = var.email
  }
}

resource "azurerm_log_analytics_workspace" "this" {
  name                = "log-${var.project}-${var.suffix}"
  location            = var.region
  resource_group_name = azurerm_resource_group.management.name
  sku                 = "PerGB2018"   # SKUs: Free, PerGB2018, Standalone, CapacityReservation
  retention_in_days   = 30            # Retention period for logs (30-730 days)

  daily_quota_gb             = 1 # -1 for unlimited
  internet_ingestion_enabled = true
  internet_query_enabled     = true

  tags = local.default_tags
}