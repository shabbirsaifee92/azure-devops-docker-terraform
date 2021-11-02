terraform {
  required_version = ">= 0.13"
  
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

provider "azurerm" {
  features { }
}

resource "azurerm_resource_group" "azure_devops_docker_terrform_rg" {
  location = "centralus"
  name = "azure-devops-docker-terrform-rg"
}