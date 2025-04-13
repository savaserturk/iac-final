variable "cluster_name" {
  type        = string
  description = "Name of the AKS cluster"
}

variable "location" {
  type        = string
  description = "Azure region to deploy resources"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "dns_prefix" {
  type        = string
  description = "DNS prefix for the AKS cluster"
}

variable "node_count" {
  type        = number
  default     = null
  description = "Fixed number of nodes (used in test)"
}

variable "min_count" {
  type        = number
  default     = null
  description = "Minimum number of nodes for autoscaling"
}

variable "max_count" {
  type        = number
  default     = null
  description = "Maximum number of nodes for autoscaling"
}

variable "kubernetes_version" {
  type        = string
  description = "Kubernetes version"
}

variable "region" {
  type        = string
  description = "Region for resources"
}

variable "labelPrefix" {
  type        = string
  description = "Label prefix for naming resources"
}

variable "client_secret" {
  type        = string
  description = "Client secret for Azure service principal"
}