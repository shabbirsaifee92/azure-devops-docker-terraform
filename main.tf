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

resource "azurerm_container_group" "azure_devops_docker_terrform_cg" {
  name = "staticwebapp"
  location = azurerm_resource_group.azure_devops_docker_terrform_rg.location
  resource_group_name = azurerm_resource_group.azure_devops_docker_terrform_rg.name

  ip_address_type = "public"
  dns_name_label = "staticwebapp"
  os_type = "Linux"

  container {
    name = "staticwebapp"
    image = "aksdevopsacrdemo.azurecr.io/dev/staticwebapp"
    cpu = "1"
    memory = "1"
    ports {
      port = "80"
      protocol = "TCP"  
    }
  }
}