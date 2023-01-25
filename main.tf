# Configure the Azure provider
terraform {
  required_version = ">= 1.1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
  cloud {
    organization = "crack-squirrels"
    workspaces {
      name = "learn-terraform-azure"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "myBUTTResourceGroup"
  location = "uksouth"

  tags = {
    Environment = "Terraform Getting Started"
    Team        = "ButtOps"
  }
}


resource "azurerm_virtual_network" "vnet" {
  name                = "myBUTTVnet"
  address_space       = ["10.0.0.0/16"]
  location            = "uksouth"
  resource_group_name = azurerm_resource_group.rg.name
}
