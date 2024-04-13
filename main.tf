terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.71.0"
    }
  }
}

resource "azurerm_resource_group" "this" {
  name     = "storage-account-resources"
  location = var.region
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


variable "region" {
  type = string
  description = "The region to which you will deploy"
}