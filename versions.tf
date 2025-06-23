terraform {
  backend "azurerm" {} 

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.25.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.2.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.7.1"
    }
  }
}

provider "azurerm" {
  storage_use_azuread = true
  features {}
}
