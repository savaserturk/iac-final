variable "prefix" {
  type        = string
  description = "Prefix for naming resources"
}

variable "location" {
  type        = string
  description = "Azure region for backend storage"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group for storage account"
}