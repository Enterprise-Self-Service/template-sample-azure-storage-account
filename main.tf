terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.71.0"
    }
  }
}

resource "azurerm_resource_group" "this" {
  name     = var.resource_group
  location = "placeholder"
}

resource "azurerm_storage_account" "this" {
  account_replication_type = "GRS"
  account_tier             = "Standard"
  location                 = azurerm_resource_group.this.location
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.this.name
}

variable "storage_account_name" {
  type = string
  description = "The name of the storage account you will create"
}

variable "resource_group" {
  type = string
  description = "The name of the resource group to add the storage account to"
}
