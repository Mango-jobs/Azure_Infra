terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.56.0"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = "62830618-0418-4f8d-8b89-90683ee74df9"
}