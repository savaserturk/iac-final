terraform {
    required_version = ">= 1.1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.94.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "aks_rg" {
  name     = "iac-final-aks-rg"
  location = var.location
}   

module "aks_cluster_test" {
  source              = "./modules/aks"
  cluster_name        = "test-aks"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = "testaks"
  node_count          = 1
  kubernetes_version  = "1.31.5"
  labelPrefix         = "test"
  region              = "westus3"
}

module "aks_cluster_prod" {
  source              = "./modules/aks"
  cluster_name        = "prod-aks"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = "prodaks"
  min_count           = 1
  max_count           = 3
  kubernetes_version  = "1.31.5"
  labelPrefix         = "prod"
  region              = "westus3"
}

module "network" {
  source              = "./modules/network"
  prefix              = "cst8918"
  location            = var.location
  resource_group_name = azurerm_resource_group.aks_rg.name
}


module "app_test" {
  source              = "./modules/app"
  name_prefix         = "test"
  location            = var.location
  resource_group_name = azurerm_resource_group.aks_rg.name
}

module "app_prod" {
  source              = "./modules/app"
  name_prefix         = "prod"
  location            = var.location
  resource_group_name = azurerm_resource_group.aks_rg.name
}

