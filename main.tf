# Create a Resource Group
resource "azurerm_resource_group" "management" {
  name     = "rg-${var.project}-${var.environment}"
  location = var.region

  tags = local.default_tags
}

resource "random_string" "this" {
  length  = 5
  upper   = false
  special = false
}

resource "azurerm_storage_account" "state" {
  name                            = "st${random_string.this.result}"
  resource_group_name             = azurerm_resource_group.management.name
  location                        = azurerm_resource_group.management.location
  account_tier                    = "Standard"
  account_replication_type        = "GRS"
  account_kind                    = "StorageV2"
  access_tier                     = "Hot"
  default_to_oauth_authentication = true
  min_tls_version                 = "TLS1_2"
  https_traffic_only_enabled      = true
  public_network_access_enabled   = true # setting to false disables portal access
  shared_access_key_enabled       = true # setting to false disconnects backend that uses az login


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

resource "azurerm_storage_container" "this" {
  for_each              = toset(["tf-states"])
  name                  = each.key
  storage_account_id    = azurerm_storage_account.state.id
  container_access_type = "private"

}

# for tags
locals {
  default_tags = {
    owner       = var.owner
    environment = var.environment
    project     = var.project
    region      = var.region
    createdBy   = "Terraform"
    #created_on = formatdate("YYYY-MM-DD HH:mm", timestamp())
  }
}
