resource "random_string" "acr_suffix" {
  length  = 4
  special = false
  upper   = false
}

# ACR
resource "azurerm_container_registry" "acr" {
  name = "${var.name_prefix}acr${random_string.acr_suffix.result}"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = true
}

# Redis
resource "azurerm_redis_cache" "redis" {
  name = "${var.name_prefix}redis-savas"
  location            = var.location
  resource_group_name = var.resource_group_name
  capacity            = 1
  family              = "C"
  sku_name            = "Basic"
  non_ssl_port_enabled = true
}

