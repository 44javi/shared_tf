# Create a Resource Group
resource "azurerm_resource_group" "main" {
  name     = "${var.client}_shared_${var.suffix}"
  location = var.region
}

resource "azurerm_storage_account" "this" {
  name                            = "uniquestategg6sj8"
  resource_group_name             = azurerm_resource_group.main.name
  location                        = azurerm_resource_group.main.location
  account_tier                    = "Standard"
  account_replication_type        = "GRS"
  account_kind                    = "StorageV2"
  access_tier                     = "Hot"
  default_to_oauth_authentication = true

  blob_properties {
    change_feed_enabled           = true
    change_feed_retention_in_days = 30
    last_access_time_enabled      = true
    versioning_enabled            = true
    container_delete_retention_policy {
      days = 30
    }
    delete_retention_policy {
      days                     = 30
      permanent_delete_enabled = false
    }
  }
  sas_policy {
    expiration_action = "Log"
    expiration_period = "00.02:00:00"
  }
  share_properties {
    retention_policy {
      days = 7
    }
  }
}




# for tags
locals {
  default_tags = {
    owner       = var.owner
    environment = var.environment
    project     = var.project
    client      = var.client
    region      = var.region
    created_by  = "Terraform"
  }
}
