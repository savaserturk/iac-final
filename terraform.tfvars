# terraform.tfvars for prod
cluster_name        = "my-aks-prod"
location            = "westus3"
resource_group_name = "my-rg"
labelPrefix = "myaks"
region      = "westus3"
dns_prefix          = "myaksprod"
min_count           = 1
max_count           = 3
kubernetes_version  = "1.31.5"
